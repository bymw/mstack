---
name: diagnosing-feel
description: Turns a report that something does not feel right (laggy, jumpy, flashing, rushed, a late indicator, a misbehaving swipe) into a measured cause, a fix and a guard, on any device. Use when the user shares a screen recording or says it is not smooth, lags, jumps, or feels broken or not native, even without calling it a bug. Not for motion with no reported symptom (designing-motion).
license: MIT
---

# Feel check

These reports come from a person holding the device. They are the most reliable signal a product has about feel, and the hardest to reproduce. Geometry checks cannot see feel, and headless browsers, hidden preview panes and debug builds misreport timing, blur and touch. So this skill starts from what was seen, reproduces it where it is true, and measures before it changes anything.

Most "not smooth" reports are not about frame rate. They come from state updating at the wrong moment, an animation that replays or cannot be interrupted, a layout that shifts when content arrives, a transition cut short or crowded, a material one engine renders differently, or main-thread work at the moment of the gesture.

This skill covers diagnosing and fixing a felt fault. Fixes are held to the vocabulary in `designing-motion`. The commands and traps for measuring are in [MEASURE.md](MEASURE.md); read it before reproducing or sampling.

## Two failure modes, and the first is worse

1. **Fixing the guess.** Treating the symptom you imagined rather than the cause you measured, often by adding a delay, fade, dim or spinner on top. It hides the fault in one place and adds one elsewhere. A press probe that dragged the page between taps once made a working press look broken and led to a needless dim that later had to be reverted.
2. **Declaring it fixed in the wrong place.** A screenshot, a headless run, a debug build or a fast desktop that cannot show the problem is no proof the fix worked.

## Rules

1. **Watch before reading code.** Extract the recording's frames and name the moment in one sentence with a timestamp: "At 2.31 s the dots still mark card 1 while card 2 is fully in view."
2. **Reproduce where it is true.** iPhone and iPad: the Simulator for logic and layout, the device for touch, scroll physics, haptics and timing, profiling a release build. Mac: the app's release build, on 60 Hz and 120 Hz displays where possible. Web: the engine the person used (Safari on iPhone and iPad, Chrome, Firefox) at the same size; headless is for logic and sampling, never proof of feel. Say which device or engine proved what.
3. **Reproduce in the same host the person used.** A home-screen web app, an embedded view, another route or another window size can render the same screen through different code.
4. **Classify against the symptom table** before changing anything.
5. **Fix the cause.** Add a delay, fade or overlay only when the cause really is a wait.
6. **Leave a guard:** a motion probe, UI test or sweep step named for the symptom, seen failing on the old code and passing on the new.
7. **Show the proof:** before and after frames or numbers from the same device or engine at the same moment, including the oldest supported hardware.

## Symptom, usual cause, fix

| What the person saw | Usual cause | Fix at the cause |
| --- | --- | --- |
| Feels rushed or hectic | Transitions shortened to feel fast; several elements moving independently; a stagger with no cap; ease-in or linear curves | Full duration on `ease-out` or a critically damped spring; one calm sequence; stagger capped |
| A flash between states | A spinner shown for a split second; a hard cut from placeholder to content; a remount by identity; a colour that cannot interpolate | Nothing under about 300 ms, at least about 500 ms once shown; crossfade in place; one stable identity |
| Content appears, then jumps | Placeholder sizes differ from the loaded ones; fake loading over data already held | Placeholder in the exact shape of what arrives; never reload what is held |
| An indicator, dots or title update after the swipe settles | State derived from a scroll-end or settle event, which fires late (450 ms measured on mobile Safari) | Derive it during the gesture or at finger lift |
| A delay after a tap or click | Main-thread work before the first visual change; a double-tap recogniser waiting; a cold route | Answer on the first frame, then do the work; drop double-tap where none exists; warm the route |
| A sheet or panel cannot be grabbed while it moves | A non-interruptible animation or input locked during the transition | A spring from the value on screen; never lock input |
| Only part of a sheet responds to a drag | The handler is on the grabber; the inner scroll captures the touch | Drag from anywhere until raised, then hand over to the inner scroll |
| Something moves past the first or last item | Elastic overscroll; snap not stopped | Clamp, `scroll-snap-stop`, `overscroll-behavior`; rubber-band on purpose |
| An animation replays on every return | A mount animation with no memory of first arrival | Animate the first arrival; a revisit rests |
| A control changes width when its label changes | Width from content | A fixed or reserved width |
| A grey flash when a panel opens or closes | A blurred, translucent surface faded below opacity 1 | Keep glass opaque; scale or clip it in |
| A shaky bar while scrolling | Animated width or height; compaction triggered by speed | Transforms over a fixed box; trigger on distance |
| Rough scrolling in a long list | Layout every frame, heavy rows, images decoded on the main thread | Profile (Instruments, or the browser's Performance panel), fix the heaviest cost |
| Choppy at 120 Hz, fine at 60 Hz | Work that fits 16.7 ms but not 8.3 ms; a fixed-rate timer | Halve the per-frame cost; drive motion from the display refresh |
| A layer invisible or frozen, only in development | A development double-mount stopping a scoped animation | An unscoped animation with a run-once guard |
| Nothing happens on press | No press state, or hover-only feedback | Press feedback on pointer-down |
| Window resize stutters (Mac, iPad, web) | Layout recomputed every pixel | Cheaper layout during live resize; reserved space |

## Method

1. **Watch.** Extract the frames around the moment with [frames.swift](frames.swift), which needs no ffmpeg:
   ```bash
   swift ~/.claude/skills/diagnosing-feel/frames.swift <recording> <out-dir> --from 1.5 --to 3.5 --png --every 2
   ```
   It writes `frames.csv` (time, gap since the previous frame, change from the previous frame) plus PNGs. A long gap mid-gesture is a stall; a spike in `change` is a flash or a jump; `--region` limits the measure to one element.
2. **Reproduce** on the right device or engine, same host, route and window size, same gesture. Record it and run `frames.swift` on that too.
3. **Measure** what moves frame by frame and when input arrived (MEASURE.md has the probes for the web and Instruments for Apple platforms).
4. **State the cause** in one sentence, "X happens because Y", with frame numbers, milliseconds and the line of code.
5. **Fix** at the cause, within the motion vocabulary. Then check Reduce Motion and Reduce Transparency, both reading directions if the product mirrors, both themes, every device and window size that renders the screen, and the oldest supported hardware.
6. **Prove and guard.** Record again on the same device and compare at full speed and slowed down; add the guard and watch it fail on the old code.

## Output

**What you saw:** the timestamp and one sentence.
**Cause:** one sentence with evidence (frames, ms, file:line).
**Fix:** file:line and what changed.
**Proof:** the device or engine, before and after, and the guard's name.
**Checked beyond the report:** Reduce Motion, both themes, every size that renders the screen, and the oldest supported hardware, each with its result or "not yet checked".
**Only provable on a real device:** anything the simulator or headless run could not settle.

## Gotchas

| Instead of | Do |
| --- | --- |
| A delay, fade or dim to hide a jump | Find what moved, and why |
| Judging feel from a screenshot | Frames and timings |
| Trusting headless, a hidden pane or a debug build | The real device or engine on a release build |
| Testing only on the newest hardware | The oldest supported device too |
| "Fixed" without recording the same gesture | Before and after on the same device |

## Works with

- `crafting-products`: principles 6, 10 and 12, and the shared terms.
- `designing-motion`: the vocabulary and defaults every fix is checked against.
- Emil Kowalski's `animation-performance` (dropped frames with a rendering cause), `apple-design` (gesture physics) and `mobile-native` (the web on phones: tap delay, stuck hover, viewport units, safe areas).
