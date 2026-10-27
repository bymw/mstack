// frames.swift: read a screen recording frame by frame without ffmpeg.
//
// Usage:
//   swift frames.swift <video> <out-dir> [--from <s>] [--to <s>] [--png] [--every <n>] [--region x,y,w,h]
// Run it from this skill's folder, or give the script's full path. Needs macOS.
//
// It writes <out-dir>/frames.csv with one line per decoded frame:
//   index, time_ms, gap_ms, change
// gap_ms: time since the previous frame. Screen recordings only write a frame
//   when the screen changes, so a long gap during a gesture means nothing moved
//   (a stall), and an even ~16.7ms cadence means a smooth 60fps run.
// change: mean absolute luma difference from the previous frame, 0-255,
//   sampled on a coarse grid. Spikes find flashes and jumps; a run of zeros
//   inside a gesture finds a freeze. --region limits it to a rectangle given in
//   pixels of the video (x,y from the top-left).
// --png writes frames as PNG (every frame, or every n-th with --every n) so you
// can look at the exact moment.
import AVFoundation
import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers

let args = CommandLine.arguments
guard args.count >= 3 else {
  print("usage: swift frames.swift <video> <out-dir> [--from s] [--to s] [--png] [--every n] [--region x,y,w,h]")
  exit(2)
}
let url = URL(fileURLWithPath: args[1])
let out = URL(fileURLWithPath: args[2], isDirectory: true)
func opt(_ name: String) -> String? {
  guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }
  return args[i + 1]
}
let from = Double(opt("--from") ?? "0") ?? 0
let to = Double(opt("--to") ?? "1e9") ?? 1e9
let writePNG = args.contains("--png")
let every = max(1, Int(opt("--every") ?? "1") ?? 1)
let region: [Int]? = opt("--region").map { $0.split(separator: ",").compactMap { Int($0) } }
if let r = region, r.count != 4 || r[2] <= 0 || r[3] <= 0 {
  print("--region needs x,y,w,h as whole numbers with w and h above 0, got \(opt("--region") ?? "")")
  exit(2)
}

try FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)

let asset = AVURLAsset(url: url)
let sema = DispatchSemaphore(value: 0)
var videoTrack: AVAssetTrack?
Task {
  videoTrack = try? await asset.loadTracks(withMediaType: .video).first
  sema.signal()
}
sema.wait()
guard let track = videoTrack else { print("no video track in \(url.path)"); exit(1) }

let reader = try AVAssetReader(asset: asset)
reader.timeRange = CMTimeRange(
  start: CMTime(seconds: from, preferredTimescale: 600),
  end: CMTime(seconds: min(to, 1e6), preferredTimescale: 600))
let output = AVAssetReaderTrackOutput(
  track: track,
  outputSettings: [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA])
output.alwaysCopiesSampleData = false
reader.add(output)
guard reader.startReading() else { print("cannot read: \(String(describing: reader.error))"); exit(1) }

var csv = "index,time_ms,gap_ms,change\n"
var prevLuma: [UInt8]? = nil
var prevT: Double? = nil
var index = 0
var maxChange = 0.0, maxChangeAt = 0.0, maxGap = 0.0, maxGapAt = 0.0

while let sample = output.copyNextSampleBuffer() {
  guard let pb = CMSampleBufferGetImageBuffer(sample) else { continue }
  let t = CMSampleBufferGetPresentationTimeStamp(sample).seconds
  CVPixelBufferLockBaseAddress(pb, .readOnly)
  let w = CVPixelBufferGetWidth(pb), h = CVPixelBufferGetHeight(pb)
  let stride = CVPixelBufferGetBytesPerRow(pb)
  guard let rawBase = CVPixelBufferGetBaseAddress(pb) else {
    CVPixelBufferUnlockBaseAddress(pb, .readOnly)
    continue
  }
  let base = rawBase.assumingMemoryBound(to: UInt8.self)

  let rx = region.map { max(0, $0[0]) } ?? 0
  let ry = region.map { max(0, $0[1]) } ?? 0
  let rw = region.map { min(w - rx, $0[2]) } ?? w
  let rh = region.map { min(h - ry, $0[3]) } ?? h
  guard rw > 0, rh > 0 else {
    print("--region \(opt("--region") ?? "") lies outside the \(w)x\(h) video frame")
    exit(2)
  }
  // Sample about 120 points along the shorter side of the region (never denser than
  // every 2nd pixel): coarse enough to stay fast at any resolution, fine enough to
  // catch a flash or a jump.
  let step = max(2, min(rw, rh) / 120)
  var luma: [UInt8] = []
  luma.reserveCapacity((rw / step + 1) * (rh / step + 1))
  var y = ry
  while y < ry + rh {
    var x = rx
    while x < rx + rw {
      let p = base + y * stride + x * 4
      // BGRA -> Rec. 601 luma
      luma.append(UInt8((Int(p[2]) * 299 + Int(p[1]) * 587 + Int(p[0]) * 114) / 1000))
      x += step
    }
    y += step
  }

  var change = 0.0
  if let prev = prevLuma, prev.count == luma.count {
    var sum = 0
    for i in 0..<luma.count { sum += abs(Int(luma[i]) - Int(prev[i])) }
    change = Double(sum) / Double(luma.count)
  }
  let gap = prevT.map { (t - $0) * 1000 } ?? 0
  csv += String(format: "%d,%.1f,%.1f,%.2f\n", index, t * 1000, gap, change)
  if change > maxChange { maxChange = change; maxChangeAt = t }
  if gap > maxGap { maxGap = gap; maxGapAt = t }

  if writePNG && index % every == 0 {
    let space = CGColorSpaceCreateDeviceRGB()
    let info = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
    if let ctx = CGContext(data: base, width: w, height: h, bitsPerComponent: 8, bytesPerRow: stride, space: space, bitmapInfo: info.rawValue),
       let img = ctx.makeImage() {
      let name = String(format: "f%05d_%07.0fms.png", index, t * 1000)
      if let dest = CGImageDestinationCreateWithURL(out.appendingPathComponent(name) as CFURL, UTType.png.identifier as CFString, 1, nil) {
        CGImageDestinationAddImage(dest, img, nil)
        CGImageDestinationFinalize(dest)
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(pb, .readOnly)
  prevLuma = luma
  prevT = t
  index += 1
}

try csv.write(to: out.appendingPathComponent("frames.csv"), atomically: true, encoding: .utf8)
print(String(format: "%d frames, %.2fs to %.2fs. Largest change %.1f at %.0fms; longest gap %.0fms at %.0fms. CSV: %@",
             index, from, prevT ?? from, maxChange, maxChangeAt * 1000, maxGap, maxGapAt * 1000,
             out.appendingPathComponent("frames.csv").path))
