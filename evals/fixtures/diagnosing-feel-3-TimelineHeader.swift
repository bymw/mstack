// Loomly/Timeline/TimelineHeader.swift
import SwiftUI
import Combine

struct TimelineHeader: View {
  @ObservedObject var scroll: ScrollModel          // publishes the list's current offset
  @State private var shown: CGFloat = 0

  private let tick = Timer.publish(every: 1.0 / 60.0, on: .main, in: .common).autoconnect()

  var body: some View {
    Image("header")
      .resizable()
      .scaledToFill()
      .frame(height: 220)
      .offset(y: shown * 0.4)
      .clipped()
      .onReceive(tick) { _ in
        shown = scroll.offset                       // sample the scroll offset 60 times a second
      }
  }
}
