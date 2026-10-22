---
name: breaking-experiences
description: "Builds simulation controls that put a product into any state (data at scale, failures, slow networks, time zones, permissions, concurrent edits, every device), hunts edge cases by combining them, and turns each break into an automated check seen failing first. Writes code. Use when the user wants to break a feature, find edge cases, or build a simulator or test harness. Not for read-only walks (walking-personas)."
license: MIT
---

# Breaking experiences

Happy paths are the cheapest part of a product to get right and the least likely to fail in someone's hands. The breaks live in combinations nobody demoed: the second device, the session that expires mid-save, the 400th item, the time zone change at midnight, two people editing the same thing. Now that a simulator is cheap to build, guessing at edge cases is a choice. This skill makes every state reachable on demand, breaks the product on purpose, and leaves each break behind as a test.

This skill covers building the controls, hunting with them, and the checks that stay. Walking flows as people and reporting what they meet is `walking-personas`; the fix belongs to the skill that owns it (`designing-flows`, `designing-visuals`, `writing-ux-copy`, `designing-motion`); a felt fault with a recording is `diagnosing-feel`. What to vary, and how to build each control on each platform, is in [BREAKS.md](BREAKS.md); read it before building.

## Two failure modes, and the first is worse

1. **Faking the state.** Hand-editing a database, mocking a screen into a state the real system cannot produce, or trusting a simulator that drifts from production. The breaks it finds are not real, and the real ones stay hidden.
2. **Breaking without leaving anything behind.** A clever afternoon of exploration whose findings live in a chat. The same break returns next month because nothing catches it.

## Rules

1. **Every state reachable by a link, a flag or a command.** Build controls that drive the real product through its real code paths: seeded personas, data volume, injected failures, clock, locale, permissions, device. Each one is rerunnable by anyone. Why: a state you cannot reproduce cannot be fixed or guarded.
2. **Simulate at the boundary, not inside the screen.** Inject faults where the system meets the world (network, server responses, storage, clock, operating system permissions) so the product's own handling runs. Why: a mocked screen proves the mock, not the product.
3. **Controls never reach real people.** Gate them behind a debug build, an internal flag or a test environment, and say how each is turned off. Why: a simulator that leaks into production is a security and trust fault.
4. **Hunt by combination, not by memory.** Cross the axes in BREAKS.md and run the riskiest pairs first: anything shared, saved, synced, timed or gated by a permission, meeting a failure or an interruption. Why: most real faults sit where two conditions meet, which a list of single cases misses.
5. **Throw what people really throw.** The longest and strangest input, pasted rich text, zero and huge numbers, double taps, Back during a save, rotation or resize mid-flow, the app killed and reopened; generated input where the space is too large to list. Why: real people are less careful than the test account.
6. **A break is a finding with a reproduction:** the control, the steps, what happened, what should happen, and its severity (High: data lost, wrong, leaked, stuck or untrue; Medium: confusing or slow; Low: cosmetic). Why: a break nobody can reproduce gets closed as "works for me".
7. **Every break leaves a check, seen failing first.** Turn each confirmed break into an automated end-to-end or integration test that drives the same control, run it on today's code and watch it fail, then keep it in the suite. Why: a fix without a test that once failed is not proven.
8. **Agree the controls while the feature is specified,** so they ship with it, and list them in the spec's checks (`writing-specs`). Why: a simulator built after launch means the first people to use it found the breaks.
9. **Fix only when asked.** Controls and checks are this skill's code; a fix in the product goes to its owner unless the user asked for it here. Why: a hunt that quietly patches what it finds hides the decision about how it should behave.
10. **Say what was not broken.** What was not tried, what the simulator cannot reproduce (real devices, real networks, third parties), and what production monitoring should watch instead. Why: coverage claimed is not coverage.

## Method

1. **Map the surface:** the flows, the data they read and write, everything shared, synced, timed or permissioned, and the target devices.
2. **Inventory the controls** the product already has (debug menus, seeds, flags), then list the gaps against BREAKS.md, including any simulation gap `walking-personas` reported.
3. **Build the missing controls** at the boundary, gated, each with its rerun link or command, and confirm each on the first screen it affects.
4. **Plan the hunt** as a short table before running it: the riskiest combinations, a pass of hostile input, a pass of interrupted actions.
5. **Hunt** on every target device, recording each break with its reproduction as you go.
6. **Turn each break into a check,** seen failing on today's code.
7. **Report,** then hand each fix to its owner, and offer `getting-sign-off` rows for any change people will see.

## Output

**Headline:** one sentence, for example "Shared lists: 9 controls built, 41 combinations run, 7 breaks (3 High), 7 checks added, 2 states not reproducible here."

**Controls:**

| Control | How to use it | What it varies | Gate |
| --- | --- | --- | --- |

**Breaks,** grouped under High, Medium and Low, each one line: what breaks, the reproduction (control plus steps), what should happen, and the check that now guards it.

**Not covered:** what was not tried or cannot be simulated here, and what monitoring should watch.

## Gotchas

| Instead of | Do |
| --- | --- |
| Testing with the demo account | Seeded personas from nothing to maximum |
| Editing the database to reach a state | A control that drives the real code path |
| Mocking the screen | Faults injected at the network, storage, clock or operating system |
| One condition at a time | Pairs of conditions, riskiest first |
| Typing "test" into every field | The longest, emptiest, strangest and pasted input |
| A list of breaks in chat | A check per break, seen failing first |
| Debug controls reachable in production | Gated, with how each is turned off |
| "Tested, works" | What was covered, and what was not |

## Works with

- `crafting-products`: principles 10, 11 and 13 (nothing jumps, every state designed, every fix leaves a guard).
- `walking-personas`: hands over every simulation gap, then walks the states this skill makes reachable.
- `writing-specs`: the controls belong in the checks, agreed before the build.
- `designing-flows`, `designing-visuals`, `writing-ux-copy`, `designing-motion`: own the fixes.
- `diagnosing-feel`: when a break is about timing and feel.
- `building-ai-features`: hostile and adversarial inputs feed its exam.
- `getting-sign-off`: visible fixes, one row each.
- Outside the set: Emil Kowalski's `break-ui` stress-tests one component with worst-case data; this skill does the same for whole flows and the systems behind them. Chaos engineering and property-based testing are the engineering traditions it borrows from.
