---
name: decluttering-screens
description: Simplifies an existing feature radically without removing anything a person can do: inventories every element, applies the cheapest moves first, and proves every capability is still reachable, with before-and-after counts. Use when the user says a screen is cluttered or has too much on it, or asks to simplify. Not for inconsistency across screens (auditing-consistency).
license: MIT
---

# Declutter

The goal is a feature that is extraordinarily simple to use with nothing taken away. Clutter is rarely one big thing; it is many small ones: a title that repeats the tab, a summary with four figures where one decides, a line reporting what the person just watched happen, a list capped behind "View all" with no count, a step asking a decision the person already made. Each costs a fraction of a second; together they make a product feel like work. The simplification that lasts takes them out and leaves every capability one tap away.

The simplification that does not last removes something. A goal-setup flow once went from four steps to three by folding its reminder settings into one switch, and went back to four the same day, because people could no longer change the target, how often, or what it applied to.

This skill covers proposing a simpler version of an existing feature, screen by screen, with proof nothing was lost. Agreed rows are built afterwards. The moves, in order, with what each may and may not cost, are in [MOVES.md](MOVES.md); read it before changing any element.

## Two failure modes, and the first is worse

1. **Simplifying by removing.** A capability, a needed decision, the next step, a progress indicator or a fact the person acts on disappears so the screen gets shorter. It looks like a win in review and is reversed as soon as someone tries to do the thing.
2. **Rearranging, not simplifying.** The same elements moved, restyled or shortened until vague. The number of things to read and decide stays the same, or meaning is lost to brevity.

## Rules

1. **Inventory before cutting:** every element on every screen and state (off, empty, error, maximum), each with its job: decides, informs, acts, navigates, or nothing.
2. **Keep every capability, decision and next step.** Each may move behind a default, a counted row or a later screen, but stays reachable: a person who wants it finds it without being told.
3. **Run the moves in order,** cheapest first. Splitting a screen or redesigning a component is the last resort.
4. **The surface keeps only what the person acts on.** Secondary facts (member since, badges, counts, status chips, descriptions) move to the detail screen they belong to. A value people glance at becomes a visual (a meter) rather than a line of figures. In a list, an action is a plain row in the accent colour, not a filled button competing with the screen's one primary action.
5. **A default is a decision.** Default only what the system can know, or where any answer is safe and changeable later; start empty for a personal choice, a recipient or a consent.
6. **Words get shorter, never vaguer,** following `writing-ux-copy`. A title too long for its bar is a layout problem, not a type-size problem.
7. **Off is a state, not an empty screen:** a feature not yet turned on shows what it is and how to start it.
8. **Count before and after:** elements on screen, decisions asked, taps to the main job, words. A proposal without counts is an opinion.
9. **Respect recorded decisions.** A move that contradicts one names it and becomes a question for `settling-decisions`.

## Method

1. **Walk the feature:** every screen, state and entry point, as a new person and an established one (`walking-personas` covers the worst cases), on every device the product targets. Capture each screen with the capture guide in the `getting-sign-off` skill.
2. **Inventory** each screen, marking any fact shown twice (in the summary and the row below it, in the title and the description):

   | Element | Job | Needed when | Duplicated on |
   | --- | --- | --- | --- |
3. **Apply the moves in order** to every element: keep, cut (only if it does nothing or repeats), reword, default, put behind a counted row, merge, or return the person to where they started.
4. **Prove nothing was lost** with the still-reachable checklist in MOVES.md: every capability and where it lives now, in taps from the entry, before and after; every decision still asked or defaulted with a reason; every next step still offered. Any "no" sends the move back.
5. **Present** one `getting-sign-off` row per screen, or per change where one screen changes in unrelated ways, with the counts in the page's lede. A default the system might not know, or a merged step, is flagged on its row with a recommendation and settled with `settling-decisions`.
6. **After agreement,** build only the agreed rows under the project's rules, and recapture once they ship.

## Output

**Headline:** one sentence with the counts, for example "Settings: 9 screens, 41 elements to 27, 3 decisions defaulted, nothing removed."

**Then the screens,** today beside proposed (the `getting-sign-off` page link), each with one line: elements before and after, and what moved where.

**Still reachable:**

| Capability | Before | After | Taps |
| --- | --- | --- | --- |

**For you to decide:** each default or merge that needs a product call, with a recommendation.

**Inventory,** after the main points: each element with its job (decides, informs, acts, navigates, or nothing) and any fact shown twice.

**Before sending, check the report against this list:**

- [ ] The headline has elements before and after, decisions before and after, and "nothing removed"
- [ ] Every state is covered (empty, off, error, maximum), not only the populated one
- [ ] One primary action per screen remains, and it is the action the screen exists for
- [ ] Every capability appears in the Still reachable table with its taps

## Gotchas

| Instead of | Do |
| --- | --- |
| A capped list with no way to the rest | A short recent preview (up to about five) plus a counted row that opens the whole list |
| A summary carrying every figure | One figure and one line of context; the rest behind a row |
| A line narrating what the person just watched | Cut it; the record stays where records live |
| Off drawn as an empty screen | The full screen with the switch off |
| A flow that ends somewhere new | It ends where the person started |
| Simplifying the happy path only | Every state, including off, empty, error and maximum |

## Works with

- `crafting-products`: principles 2 and 3, and the shared terms.
- `writing-ux-copy`: every string the moves touch.
- `designing-visuals`: structure for the elements that remain.
- `designing-flows`: when the clutter is in a multi-step flow.
- `walking-personas`: the people to walk the feature as.
- `exploring-directions`: when one screen has several defensible simplifications.
- `auditing-consistency`: when the clutter is the same job done several ways.
- `getting-sign-off` and `settling-decisions`: sign-off and the product calls.
- Apple's and Linear's own apps are the reference for restraint: one primary action, detail one level deeper.
