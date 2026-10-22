---
name: unifying-patterns
description: Builds an agreed consolidation so it sticks: the canonical answer goes into the shared kit, every caller moves, old variants are deleted, and a guard is seen failing on the old code first. Writes code. Use when consolidation rows are agreed, the user asks to make something consistent everywhere or delete an old variant, or a fixed inconsistency has returned. Not for finding inconsistencies (auditing-consistency).
license: MIT
compatibility: Reads agreed rows from the review page's store when available, or from the user's answers in chat.
---

# Unifying patterns

A consolidation is finished only when the old answer cannot come back. Two things bring it back: callers are moved but the variant stays in the kit, so the next screen built from an old example uses it again; or the fix sits on a branch that never lands, so the main line keeps the fault and the next review finds it again.

The pattern that holds: one canonical answer in the shared kit, every caller moved, the variant and its prop deleted, a guard that fails if anything reintroduces it, and a written reason.

This skill covers building what was agreed, and only that. The canonical is proposed by `auditing-consistency` and agreed through `getting-sign-off` and `settling-decisions`. Which kind of guard to use and how to see it fail is in [GUARDS.md](GUARDS.md); read it before writing the guard.

## Two failure modes, and the first is worse

1. **A consolidation that does not stick.** The variant stays, a prop is defaulted rather than deleted, there is no guard, the change never lands, or the docs still describe the old answer. The fault returns and the next review finds it again.
2. **Collateral change.** Moving callers changes what nobody agreed: a screen whose exception had a recorded reason, a neighbouring job swept along, a layout that shifts because the canonical's box differs. The review signed one thing and the build ships another.

## Rules

1. **Build only agreed rows.** Read the decisions store, the user's answers in chat, or the plan before the first edit. A row marked Discuss, Not this, or nothing is not built; a gap in an agreed row is a question, not a licence.
2. **The canonical lives in the shared kit,** never inside one feature. Promote a feature's instance to the kit first, as its own change.
3. **Find every caller before moving any,** from three sources: the code graph (callers of the component and the prop), a search for hand-rolled lookalikes by visual signature, and a walk of the product on every device it targets. Write the list down with a count.
4. **Delete, don't deprecate.** Remove the losing variants, the props and values that selected them, and their styles, so asking for the old answer fails to compile or fails a lint. Switching a default to the canonical is not deletion.
5. **A kept exception keeps its reason,** beside it in the code and in the decision.
6. **Write the guard first and see it fail:** on the old code it fails and lists every offender; on the new code it passes; on everything it does not mean, it passes too. A rule never seen to fail is not yet a rule.
7. **Documentation in the same change:** the decision ("X, not Y, because Z": what it replaced and overrules), the component's design-system page, and the specification where a flow changed.
8. **Land it, with the user's yes.** Commit on a branch, then ask the user before pushing or opening a pull request, unless they already said to, and within the project's rules for what may be pushed. Until it lands, say so plainly in the status: an unpushed consolidation is unfinished.
9. **Recapture after the build** at the same framing, and republish the review page as shipped (without `getting-sign-off` installed, show the shipped captures in the reply).

## Method

1. **Read the agreement** (`ArtifactData list`, collection `decisions`, or the user's answers in chat, plus the plan and decision entries). List the agreed rows, each with its canonical, what moves, what is deleted, the kept exceptions and the proposed guard. Ask anything missing with `settling-decisions`, one question at a time.
2. **Map the blast radius:** every caller of each losing variant, every prop value that selects one, every hand-rolled copy, counted, plus every screen whose geometry will shift.
3. **Write the guard against today's code.** Its offender list is the to-do list, and its count should match step 2; if they differ, find out which is wrong before moving anything.
4. **Make the canonical right in the kit,** as its own commit with its own documentation if it changes.
5. **Move every caller,** keeping each caller's content, data and state so only the pattern changes; one commit per job when there are several.
6. **Delete** the variants, props, values, styles, dead exports and the tests of the old behaviour, which the guard replaces.
7. **Prove:** the guard and the static gates pass; walk the affected screens at true size on every device; capture the agreed rows and compare them with the proposed side; check the mirror and both themes where the component appears. A shift nobody agreed is reported, not shipped.
8. **Write it down and hand over:** the decision entry, design-system page and changelog; branch, commit and check the merge is clean; ask before pushing and opening the pull request with what was verified, unless the user already said to; republish the `getting-sign-off` page with the shipped captures.

## Output

The branch and commit, and the pull request link once the user says to open it, with a headline, for example "One red button: 3 variants to 1, 23 callers moved, guard fails 16 times on main."

| Job | Canonical | Callers moved | Guard |
| --- | --- | --- | --- |

**Then:** what was deleted, exceptions kept with their reasons, what was verified (walks, gates, captures), and rows not built, with why.

## Gotchas

| Instead of | Do |
| --- | --- |
| A deprecated variant left "for now" | Delete it, so asking for it fails |
| A prop's default switched to the canonical | Delete the prop |
| Callers found by name only | The code graph, a visual-signature search and a walk |
| A guard that also flags what it should not | One seen passing on everything it does not mean |
| Docs updated "in a follow-up" | Decision, design-system page and spec in the same change |
| A silent layout shift on a screen nobody reviewed | Report it, capture it and ask |

## Works with

- `crafting-products`: principles 7 and 13, and the shared terms.
- `auditing-consistency`: proposes the canonical and the guard.
- `getting-sign-off`: the agreement, and the capture as shipped.
- `settling-decisions`: Discuss rows and gaps in agreed rows.
- `designing-motion`: when the job is a motion role; read it first. Emil Kowalski's `review-animations` checks the craft of a motion canonical.
