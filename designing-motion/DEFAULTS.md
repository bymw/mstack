# Motion defaults

Read this when a project has no motion tokens yet, when a role needs values, or when reviewing a move. A project's own tokens always win; these are the starting point that has held up on iPhone, iPad, Mac and the web. The numbers draw on Emil Kowalski's skills and Apple's WWDC talk "Designing Fluid Interfaces".

**Contents:** 1 Should it move · 2 Easing · 3 Durations · 4 Springs · 5 Interruption · 6 Origin and shape · 7 Press and gesture · 8 Loading and state changes · 9 Text and figures · 10 Reduce Motion · 11 Performance · 12 Haptics · 13 Review checklist

## 1. Should it move at all?

Decide this before any value.

**It needs a job.** Motion explains a change (where something came from or went), follows the hand, or confirms input. If you cannot name the job, it does not move. "No animation" is a successful outcome.

**Frequency decides:**

| How often it is seen | What to do |
| --- | --- |
| 100+ times a day (keyboard shortcuts, command menus, core navigation, switching tabs) | No animation |
| Tens of times a day (hover, list selection) | None, or barely perceptible |
| Occasionally (sheets, popovers, toasts, dialogs) | The standard motion for its role |
| Rarely or once (onboarding, a first success, an empty state) | The only place for choreography or delight |

**Never animated:** keyboard-triggered actions; core-action surfaces appearing; page and tab switches inside an app; filtering as you type; system menus; data the person is reading or deciding on. When motion competes with an instant answer, the instant answer wins.

## 2. Easing

- **Entering or leaving:** ease-out.
- **Moving or morphing while on screen:** ease-in-out.
- **Colour and hover changes:** a gentle ease.
- **Constant motion (progress, a marquee):** linear. Progress never eases.
- **Never ease-in on interface motion.** It delays the moment the person is watching.

The curves (use exactly, never approximate):

| Token | Value | Use |
| --- | --- | --- |
| `ease-out` | `cubic-bezier(0.23, 1, 0.32, 1)` | Interface entrances and exits |
| `ease-in-out` | `cubic-bezier(0.77, 0, 0.175, 1)` | Movement on screen |
| `ease-sheet` | `cubic-bezier(0.32, 0.72, 0, 1)` | Sheets and drawers, the iOS feel |

Default browser easings are too weak for deliberate motion.

## 3. Durations

| Move | Duration |
| --- | --- |
| Press feedback | 100 to 160 ms |
| Tooltip, small popover | 125 to 200 ms |
| Menu, dropdown, select | 150 to 250 ms |
| Toggle or chip state | 150 to 200 ms |
| Sheet, dialog | 200 to 300 ms (a long sheet up to 500 ms on `ease-sheet`) |
| Platform navigation (an iOS push) | The platform's own timing; do not restyle it |
| Onboarding, seen once | May be slower and choreographed |

- Everyday interface motion stays under 200 ms, and all interface motion under 300 ms unless there is a stated reason.
- **Leaving is faster than arriving,** by about 20%. Arrive softly, leave quickly.
- Larger elements and longer travel take slightly longer than small, short moves.
- **One thing arrives as one piece.** A mark, badge, illustration or card scales and fades in as a single unit; its parts (segments, strokes, letters) never appear one by one. Choreography means a few elements in a calm order (the mark, then its words), not a graphic assembling itself.
- **Stagger** 30 to 50 ms between separate items in a list, capped at about the eighth item. Never block input while a stagger plays, and never stagger lists people scroll past all day.
- **Distance is small.** An element rises about 4 pt (or 8 px on the web) as it appears; it does not fly in.
- **Quick is for feedback, not for transitions.** Press and hover answer fast; a change of state or place takes its full duration and lands softly. Never shorten a transition to make the product feel faster: if it is too slow for how often it is seen, remove it; otherwise keep it calm.

## 4. Springs

**If a finger is involved, use a spring,** so a flick or a second tap carries into the motion already running.

Apple's model has two parameters: **damping ratio** (1.0 means no overshoot) and **response** (in seconds, not a duration).

| Use | Damping | Response |
| --- | --- | --- |
| Default interface spring (surfaces, sheets, repositioning) | 1.0 | 0.3 to 0.4 |
| After a flick that carried momentum | 0.8 | 0.3 to 0.4 |
| A small control that may show life (a toggle knob, an icon) | 0.8 to 0.9 | 0.25 to 0.35 |

- **Surfaces never bounce.** Overshoot only when the gesture itself carried momentum: overshoot on a menu that faded in feels wrong; on a card you flicked it feels right.
- **SwiftUI:** `.spring(response: 0.35, dampingFraction: 1)`, or the built-in `.smooth` (no bounce) and `.snappy`. **Motion for the web:** `{ type: "spring", bounce: 0, duration: 0.4 }`, with `bounce: 0.2` after a flick. **CSS only:** use `ease-out` or `ease-sheet` at the durations above.

## 5. Interruption

The most important property of fluid motion.

- Never lock out input during a transition. A sheet that is closing and gets grabbed follows the finger.
- Animate from the value on screen, never from where the animation was headed.
- Rapid triggers (toggles, toasts) use transitions that retarget, not keyframes that restart.
- Gestures hand their release velocity to the spring, and the sign of the velocity, not the position, decides commit or reverse.
- Two-dimensional motion uses separate springs per axis.

## 6. Origin and shape

- **Never scale from 0.** Start from 0.95 to 0.97 with opacity 0 (popover 0.95, dialog 0.96, tooltip 0.97). A pure fade with no transform reads flat.
- **Popovers, menus and tooltips grow from their trigger** (set the transform origin to the anchor). Dialogs stay centred.
- **Leave the way you came.** Something that enters from the bottom leaves through the bottom; that is what makes swipe to dismiss obvious. The way out plays the way in, reversed.
- **Direction follows meaning.** Forward moves one way, back the other, and sideways motion follows the reading direction in a mirrored layout.
- **The container animates too,** so nothing below it jumps.
- **Glass arrives, it does not fade.** Scale or clip a translucent surface in, and animate blur with scale; a blurred surface faded below opacity 1 flashes grey on some engines.
- **Crossfades that double-expose:** a brief 2 px blur through the middle of the fade hides it.

## 7. Press and gesture

- **Press:** scale to 0.97 for a button and about 0.985 for a card, on pointer-down, about 120 to 160 ms on `ease-out`; release a little faster than the press. It applies to every pressable on touch.
- **Respond on pointer-down, commit on pointer-up.** A finger that drifts a few points keeps the press.
- **Dismiss on distance or velocity:** past the threshold, or faster than about 0.11 px per ms. A flick is enough.
- **Project momentum** before snapping: `project(v) = (v / 1000) × d / (1 − d)` with `d ≈ 0.998`; snap to the target nearest `current + project(v)`.
- **Rubber-band, don't wall:** `offset × size × 0.55 / (size + 0.55 × |offset|)`.
- **Track 1:1** from where it was grabbed, capture the pointer, ignore extra touches mid-drag, and wait about 10 pt of movement before committing to a direction.
- **Hover** (pointer platforms only): gate it behind `(hover: hover) and (pointer: fine)` on the web; animate a child, not the hovered element, to avoid flicker.

## 8. Loading and state changes

The moments between states are where products feel rushed or flashy. Make them seamless.

- **Under about 300 ms, show nothing.** The content simply arrives; a loading state that flashes for a frame is worse than none.
- **Once shown, a loading state stays about 500 ms at least,** so it never flickers on and off.
- **Placeholders take the exact shape of what arrives** (same height, same rows, same radius), so nothing shifts when content lands.
- **Content crossfades into place,** about 150 to 250 ms on `ease-out`, with at most a 4 pt rise. No pop, no slide from far away, no layout jump.
- **Waits are honest:** a status word, a spinner after about 1 s, reassurance at about 3 s and 10 s, never a fake percentage. Spinners are for actions; content gets placeholders.
- **One change at a time.** When several regions update, they settle together or in one short stagger, never as a flurry of independent moves.
- **State changes in place.** A toggle, a filter or a period switch swaps content under the control with a crossfade, without travel; the control itself does not jump.
- **Errors and empty results arrive as calmly as success:** the same crossfade, never a shake or a flash of red across the screen.

## 9. Text and figures

- Text never scales, bounces or morphs letter by letter. A label changes with a plain crossfade or an instant swap.
- Figures never count up. Only the changed digits may roll, with tabular numerals.
- Icons and a brand mark may overshoot slightly; nothing else.

## 10. Reduce Motion and accessibility

Reduce Motion means fewer and gentler, not zero. Each role carries its reduced form: travel becomes a crossfade of about 150 to 200 ms or nothing; press stays; loops stop; overshoot goes. Opacity and colour changes stay, because they carry information. Also respect Reduce Transparency (solid surfaces) and Increase Contrast. Avoid full-screen moving backgrounds and slow loops.

## 11. Performance

- Frame budget: 16.7 ms at 60 Hz and 8.3 ms at 120 Hz (ProMotion). Design against 120 Hz.
- Animate only `transform` and `opacity` (on Apple platforms: position, scale, rotation, opacity). Never width, height, padding, margins or `transition: all`.
- Size changes become scale; position changes become translate; shadows become a pre-rendered layer or `drop-shadow`.
- An inherited variable driving a child's transform recalculates every descendant. Set the transform on the element.
- `will-change` comes last, only on the animating element, only when a measurement shows the need.
- Prove it on the oldest supported device, not a desktop with throttling.

## 12. Haptics and sound (Apple platforms)

Causality, harmony, utility: an obvious cause, visual and haptic on the same frame, and only for meaningful moments. Fire at the causal moment, not when the animation ends. Never the only feedback. Selection ticks for detents, a light impact for a snap or commit, success and error notifications for outcomes.

## 13. Review checklist

Before a move ships, answer each:
1. What does it explain, follow or confirm?
2. How often is it seen, and does that allow motion at all?
3. Does it answer on the first frame?
4. Does it use a token, with the right easing?
5. Does it leave faster than it came, and the way it came?
6. Can it be interrupted, and does it carry velocity?
7. Does anything around it jump?
8. Does it feel calm: no hard cut, no flash, nothing rushed, no competing motions, and does it settle completely?
9. Is every loading moment seamless: nothing under 300 ms, no flicker, a placeholder of the same shape, a crossfade into place?
10. Does any text scale, any figure count, or any status text flick past too fast to read?
11. Does it make sense with Reduce Motion on?
12. Does it animate only transform and opacity, and hold 120 Hz on old hardware?

**Fix in this order:** delete, reduce, fix the easing, fix the origin, make it interruptible, move it to cheap properties, make the timing asymmetric, polish, then accessibility and cohesion.
