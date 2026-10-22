---
name: designing-motion
description: "Keeps every transition, animation and loading moment smooth, well timed and calm: decides whether something should move, gives each move a named role and tokens, and audits motion in frames. Use when motion, transitions, loading states or animations are added, reviewed or tuned, or the user asks for Apple- or Linear-level motion. Not for a fault someone already felt (diagnosing-feel)."
license: MIT
---

# Designing motion

Good motion is felt, not noticed. Every transition is smooth, seamless and well timed: it answers at once, moves with intent, settles completely, and never feels rushed, hectic or flashy. Motion is a language only if the same act always moves the same way. Left alone, a product drifts into several ways to push a page, a Back that reverses only some of them, and dozens of hand-typed durations, curves and springs. Each is defensible alone; together they read as a product made by several people. The cure is small: one duration ramp, a few curves, two springs, and a short list of named roles.

This skill covers whether things move, how, and how well. Diagnosing a fault someone felt on a device is `diagnosing-feel`; its measuring kit serves both. Default values for durations, curves, springs, loading and the review checklist are in [DEFAULTS.md](DEFAULTS.md); read it whenever values are chosen or a move is reviewed. The questions that assign a role are in [ROLES.md](ROLES.md); read it when listing or naming moves.

## Two failure modes, and the first is worse

1. **Motion that performs or hurries.** A loop with nothing pending, a sweep, a letter morph, a bounce on a surface, a hero that replays on every visit, a figure that counts up, an animation on an action used a hundred times a day, a hard cut between states, a spinner that flashes for a split second, several things moving at once. It reads as a toy, as lag, or as a product that is not under control.
2. **Drift in the vocabulary.** A duration, curve or spring typed by hand; the same act moving two ways; a Back that cuts where its push slid; a sheet that cannot be grabbed while it closes. Nothing looks broken alone, and the product stops feeling like one thing.

## Rules

1. **The system lives in the tokens.** Read the project's motion tokens and decisions first and cite role names; never type a duration, curve or spring by hand. A project with no tokens starts from DEFAULTS.md, written into tokens in the first change.
2. **Purpose and frequency decide whether it moves.** A move explains a change, follows the hand or confirms input. Actions used many times a day and anything triggered from the keyboard do not animate; delight belongs only to rare moments.
3. **Smooth, seamless, never rushed.** No hard cuts between states: content crossfades or moves into place. Small, frequent feedback is quick; transitions between states and places take the full duration of their token, never cut short, and land softly on an ease-out or a critically damped spring. One calm sequence at a time, never several unrelated motions competing. Every move settles completely, with no jitter or late correction.
4. **Loading is part of the transition.** The pressed control answers instantly in its own state; a loading indicator appears only after about 300 ms. A loading state, once shown, stays long enough not to flicker (about 500 ms). The placeholder has the exact shape of what arrives, and the content crossfades into it in place, so nothing pops in, jumps or flashes.
5. **Every move has a role,** named for the act it answers. A move with no act does not move.
6. **One act, one motion, on every device.** The same role moves the same way on every screen and platform, adjusted only where the platform's own convention differs (the native push on iOS, native windows and sheets on macOS).
7. **Answer on the first frame; leave faster than you arrive; leave the way you came.** Back plays the push in reverse; a sheet sinks the way it rose; exits run about 20% shorter than entrances.
8. **Always interruptible.** Springs for anything a finger or pointer drags, motion starting from the value on screen, release velocity carried into the spring, input never locked during a transition.
9. **The standing rules:**
   - arrival animates once, and a revisit rests
   - nothing loops unless something is pending
   - state follows the finger during a gesture, not after it settles
   - press on touch; hover only as a hint on pointer devices
   - surfaces never bounce
   - text never scales, bounces or morphs; labels change plainly
   - figures never count up
   - glass scales or clips, and never fades
   - the container animates with its content, so nothing around it jumps
   - status text stays long enough to read (about one second per short phrase), or it is not shown
   - the product's signature moment (its core action while it works or listens) may carry one calm signature motion, defined as its own role

   A recorded exception lives in its decision and is cited, not re-argued.
10. **Reduce Motion is a mode, not a deletion.** Each role carries its reduced form: travel becomes a short crossfade, press stays, loops stop. Opacity and colour changes that carry information stay.
11. **Cheap properties, full frame rate.** Animate transform and opacity only, and hold the display's full refresh rate (8.3 ms per frame at 120 Hz, 16.7 ms at 60 Hz) on the oldest supported device.
12. **Measured in frames.** A screenshot cannot see motion. Judge from per-frame sampling or a recording on the device that matters, at full speed and slowed down, never in a hidden preview pane.
13. **Every fix leaves a guard:** a lint rule (no hand-typed timing, nothing animating because it mounted) or a motion sweep step, seen failing on the old code.

## Method

1. **List what moves** after every tap, click, key, swipe, arrival and wait in scope: trigger and frequency, property, measured duration and curve or spring, whether it can be interrupted, whether the exit reverses it, and its Reduce Motion form. Code shows intent and frames show what runs; use the measuring kit in the `diagnosing-feel` skill (MEASURE.md).
2. **Gate each move** on purpose and frequency (DEFAULTS.md §1). Remove moves with no job or on actions used all day before anything else.
3. **Assign roles** from the vocabulary (ROLES.md).
4. **Check every move, not only the first few,** against the checklist in DEFAULTS.md §13, including loading moments and the transitions between steps of every flow.
5. **Sort what breaks:** no job or too frequent (remove); wrong values (move to the role's token); right role, wrong shape, such as a cut where a push should slide (fix the shape); not interruptible (spring or retargeting transition); a genuinely new act (propose a role with a recommendation and ask with `settling-decisions`; never add one inside a fix).
6. **Fix in order:** delete, reduce, easing, origin, interruption, properties, timing, then polish and accessibility.
7. **Prove it:** re-measure in the same engine, at full speed and slowed to a quarter, and step the frames around each start and end for jumps or late corrections. Add the guard and watch it fail on the old code.
8. **Write it down:** a changed or new role updates the design-system page and gets a decision entry ("X, not Y, because Z") in the same change.

## Output

**Headline:** one sentence, for example "Checkout: 14 moves; 9 on their role, 2 hand-typed values, 2 on actions used all day (removed), 1 spinner that flashed (now delayed)."

**Findings, grouped under High, Medium and Low,** every one included, each as one line: what moves and when, what is wrong, the fix. For example: "Rows fly in one by one on every load: per-row 120 ms ease-in with an uncapped stagger. Fix: one 200 ms crossfade of the whole list, no travel."

**Then the inventory** of every move (trigger, frequency, role, measured values) after the main points, **new roles for you to decide** with a recommendation, and **proof:** the device or engine, before and after values, and the guard.

## Gotchas

| Instead of | Do |
| --- | --- |
| A hard cut from loading to content | A crossfade in place into a placeholder of the same shape |
| A spinner that flashes on a fast load | The press answers at once; no indicator under about 300 ms, then at least about 500 ms |
| Everything entering at once, or several motions competing | One calm sequence; a short stagger capped at about eight items |
| A graphic assembling itself piece by piece | The whole mark arrives as one piece, then its words |
| Ease-in, or a linear move on interface motion | Ease-out to enter and leave, ease-in-out to move on screen |
| Scaling from 0, or a popover growing from its centre | From 0.95 to 0.97, out of its trigger |
| Motion on a keyboard action or something used all day | No motion |
| A transition that locks input or restarts on a second tap | Interruptible, from the value on screen |
| A bounce on a sheet, card or page | The surface spring, critically damped |
| Animating width, height or layout | Transform and opacity |
| Status text that flicks past | Long enough to read, or not shown |

## Works with

- `crafting-products`: principle 6 and the shared terms.
- `diagnosing-feel`: starts from a felt fault; proves motion fixes on the device.
- `designing-flows`: transitions between steps.
- `designing-visuals`: what moves must still land on the structure.
- `auditing-consistency` and `unifying-patterns`: finding motion drift and moving every caller onto a role.
- `settling-decisions`: settles a proposed new role.
- Emil Kowalski's skills (`npx skills add emilkowalski/skills`): `animate` for the craft of one move given a role's tokens, `review-animations` for a strict review ending in Block or Approve, `improve-animations` for a codebase-wide audit, `apple-design` for springs and momentum, `animation-performance` for dropped frames.
- Apple's WWDC talks "Designing Fluid Interfaces" and "Animate with springs", and the Human Interface Guidelines, "Motion".
