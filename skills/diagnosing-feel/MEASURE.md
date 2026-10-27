# Measuring feel

Read this at steps 2 and 3. Each trap below can produce a convincing false result.

## iOS and iPadOS: the Simulator

```bash
xcrun simctl list devices booted            # find a booted device, or:
xcrun simctl boot <udid>
xcrun simctl openurl <udid> http://localhost:<port>/<route>   # for a web product
xcrun simctl launch <udid> <bundle-id>                        # for a native app
# The first open after a boot often times out while Safari launches. Retry it in a loop.
xcrun simctl io <udid> recordVideo --codec=h264 --force /path/clip.mov &
# ...perform the gesture...
pkill -INT -f recordVideo                    # stop cleanly so the file is finalised
xcrun simctl io <udid> screenshot /path/still.png
```

- A dev server on `localhost` is reachable from the Simulator as it is, with no port forwarding.
- A swipe of about 0.15 s is a flick. A slow drag needs a path with timed points.
- If input refuses with "input connection still starting up", wait a minute and retry.
- The Simulator runs on the Mac's GPU and CPU. It is right for logic, layout and recording, wrong for scroll physics, haptics and performance. Those need the device.

## iOS, iPadOS and macOS: on the device

- **Record:** the device's own screen recording (Control Center), or QuickTime Player with the device connected, or `screencapture -v` on the Mac.
- **Profile a release build** in Instruments: Animation Hitches (hitch time ratio and each hitch's cause), Time Profiler (main-thread work during the gesture), the SwiftUI instrument (view body updates per frame), Core Animation (offscreen and blending passes).
- **120 Hz:** ProMotion devices budget 8.3 ms per frame. Test on one, and on the oldest supported device.
- **Slow it down:** Simulator, Debug, Slow Animations; on the web, the DevTools Animations panel at 10% or 25%.

## Per-frame sampling in a browser

Run this against the same route. Headless for logic and numbers; the real engine (Safari on iPhone, iPad or Mac, Chrome, Firefox) for proof.

- **Inline styles:** a `MutationObserver` on the `style` attribute inside the app root. Libraries such as Motion (Framer Motion) write `transform` and `x`/`y`/`scale` inline every frame, so this gives timestamped values.
- **`document.getAnimations()`, polled every frame:** this catches Web Animations (opacity, filter, pre-generated spring keyframes that report `linear` easing) and CSS transitions and keyframes, with their real duration and curve.
- **Nodes added or removed with no motion on them.** That is how a cut shows up.
- **Read after the paint**, with `requestAnimationFrame(() => channel.postMessage(...))` and the read in the message handler. A rAF callback registered earlier in the frame reads the in-between value the library is about to overwrite. That value is never painted, and it looks like one-frame flashes at the end of every move.
- **Event timing:** a capture-phase listener logging `pointerdown`, `touchmove`, `touchend` and `scrollend` timestamps. Compare event timing first, before blaming a change.
- **Traces:** under 4× CPU throttle the sampler's first frame lands late. Judge the path at full speed. Count `Layout` and `Paint` trace events in a separate throttled pass. A composited animation costs 0 paints over its run.
- **Safari on a device:** connect it, enable Web Inspector on the device, and use Safari's Develop menu for the Timelines (layout, paint, rendering frames).

## Traps that look like bugs

- **The in-app preview pane, when hidden,** stalls `requestAnimationFrame` (frames every few hundred ms) and pauses CSS animations at their first frame. It can also reopen narrow and trigger mobile fallbacks. Never time anything in it. Set its size explicitly if you measure layout there.
- **Headless touch timing.** Automated touch steps can arrive tens of milliseconds apart under load (about 65 ms in one observed setup). A flick's release velocity then depends on luck, and any animation still running at lift delays `touchend` by a frame. A flick that fails headless and passes in Safari is the harness, not the change.
- **Glass in headless Chrome** is drawn on the CPU and does not show Safari's fade problem. It also slows touch events.
- **Debug builds** of native apps run SwiftUI and Swift code far slower than release. Never judge smoothness on one.
- **Cold taps on a dev server** carry module loading time (130 to 210 ms in one observed setup). Warm the route first.
- **CSS animations with `fill: both`** stay in `getAnimations()` after they finish, so they look re-triggered on later taps.
- **Press probes:** releasing a held press by moving the pointer away can drag the page, so the next control has moved and reads as "no press". Reload before each control.
- **Motion (Framer Motion):**
  - `AnimatePresence initial={false}` silences the first animation of every descendant.
  - An outer presence waits for every descendant's exit, and one that never reports done parks the page forever.
  - An animated width with no `initial` grows from 0 on every mount.
  - A scoped `useAnimate` stops on unmount, which includes React's StrictMode double-mount in development.
  - A `flex: 1` child ignores an animated width.
  - The `x`/`y`/`scale` shorthands are not hardware-accelerated on a busy page; a full `transform` string is.
  - `color-mix()` tokens compute to `color(srgb …)`, which will not tween.
- **SwiftUI:** an animation attached to a value that changes for unrelated reasons animates those changes too; scope it with `.animation(_:value:)` or `withAnimation` at the cause. A view whose identity changes (a changing `id`, a conditional branch) remounts instead of animating.
- **Many edits in one session can wedge a dev server.** Restart it before trusting a result.

## Freezing a moment for a still

On the web: `document.getAnimations()`, then for each animation `pause()` and set `currentTime`. Two builds frozen at the same `currentTime` diff pixel for pixel. On Apple platforms: Slow Animations plus a screen recording, then pick the frame with `frames.swift`.
