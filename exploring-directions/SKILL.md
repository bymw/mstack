---
name: exploring-directions
description: Shows two to four genuinely different directions for one design problem, built in the real interface at true device size, each with its trade-off and one recommended. Writes no product code. Use when the user asks for concepts or options to compare, or a problem has more than one defensible answer. Not for one proposed change (getting-sign-off).
license: MIT
compatibility: Publishing the comparison page uses Claude artifacts with a data store when available; otherwise a local HTML page.
---

# Exploring directions

When a problem has more than one good answer, a single proposal hides the choice: the reviewer either accepts it or starts designing in the meeting. Directions side by side let them choose in one look and answer with a letter. That works only if the directions differ in idea, not in shade, and if every one is the real interface, because a reviewer judges a drawing's drift rather than its idea. Directions captured on the real interface are usually settled in one sitting.

This skill covers diverging honestly and recommending one. It does not choose for the user and does not build the winner: the pick becomes `getting-sign-off` rows. The axes that make two directions genuinely different are in [AXES.md](AXES.md); read it before choosing directions. Capturing real screens follows [../getting-sign-off/CAPTURE.md](../getting-sign-off/CAPTURE.md); without that skill, capture the running product at true device size, one image per state.

## Two failure modes, and the first is worse

1. **A direction that is not the real interface.** Drawn, approximated, at the wrong size, or with spacing, type or icons the product does not have. The reviewer picks the picture and the build disappoints.
2. **Tints of one idea.** Directions that differ only in colour, radius or copy, or a straw man added to flatter the favourite. Flipping between them teaches nothing, and the real alternative is never seen.

## Rules

1. **Frame before building:** the problem from the person's side, the measured faults of today's screen, and what stays fixed (the data, the action, decisions already recorded). A direction that contradicts a recorded decision names the decision it would overrule, or is dropped.
2. **Today is the first panel,** captured at the same size, persona, data, state, theme and reading direction as every direction.
3. **Two to four directions, each on a named axis** (structure, ground and material, density and disclosure, position and reach, interaction model, signal, motion). Two directions at the same position on every axis are one direction.
4. **Every direction is the real interface:** the running product edited in place or its real components rendered, at true device size. If the screen does not exist yet, render it from the product's real tokens and components and say so on the panel. When the problem is a multi-step flow, use journey mode: each direction shows its screens in order on one row.
5. **Every direction meets the bar** in `crafting-products` and could be defended as shipped. If the best existing answer elsewhere in the product fits, it is one of the directions. Before the directions, a round of probes may find the edges: deliberate extremes (the fastest and the safest version of one trait, or the ideal end-to-end journey), or, for a question about structure or order only, grey blocks. Label them clearly as probes; a probe is never offered as a pick.
6. **A letter to answer with and a name for the idea,** such as "D · Split view".
7. **One trade-off each,** from the person's side, and **exactly one recommended,** with its reason in one sentence. "Keep today" is always a valid answer.
8. **Show the hardest context** the choice depends on: a dark ground, the smallest phone or window, the largest display, long names, the mirror.
9. **Stop at the choice.** Nothing is built from the canvas.

## Method

1. **Frame:** the problem, the faults with numbers ("at 375 pt the third tab truncates and the filter sits off screen"), the fixed constraints and the decisions that bind it.
2. **Choose the axes:** list every candidate with a name and an axis before making any; strike the tints; keep the set that spans the real space of answers. Two for a binary question, three by default, four at most.
3. **Capture today** at true device size, persona and state, at 2×, recording ring rectangles.
4. **Build each direction** in the order of preference in the capture guide (CSS override, DOM edits from the product's own markup, real components in place, branch build). Keep each direction's patch beside its image, because the winner is built from it. A motion question needs recordings, not stills.
5. **Check every direction,** not only the favourite, at the smallest supported size, in both themes, in the mirror if the product has one, with long content, and against `designing-visuals`'s check. A direction that breaks is fixed, or the break becomes its stated trade-off.
6. **Publish the canvas:** one section per problem, today then A to D at one size, wrapping at phone width (in journey mode, one row per direction, today's row first). Each panel carries its letter and name, one line for the idea, one for the trade-off, and rings on what changed; the recommended panel is marked. Start from ../getting-sign-off/review-page.html (without that skill, a plain page with one answer button per panel): keep its store, tally, rings, themes and layout; change each row to today plus the directions, with one answer button per direction plus Keep today and Discuss. Store answers in their own collection, `directions`: document id = the problem id, `choice` = the letter, `today` or `discuss`, plus `note`. Publish with `capabilities: {"db": {}}`. If the host has no artifact store, the page is a local HTML file and answers come back as a short list in chat.
7. **Read back and hand on:** read the answers first (the store, or the list in chat) and quote every note. A Discuss goes to `settling-decisions`. A hybrid ("D, with A's contrast") is a new direction: capture and confirm it. A pick becomes `getting-sign-off` rows, one per screen it changes.

## Output

The canvas link, then one line per problem: "Today plus A to D. I recommend C, because …". After the read-back:

| Problem | Pick | Note | Next step |
| --- | --- | --- | --- |

## Gotchas

| Instead of | Do |
| --- | --- |
| Directions without today beside them | Today as the first panel, same size and state |
| "Option A" with no idea named | A letter to answer with and a name for the idea |
| A straw man to flatter the favourite | Every direction could ship |
| No recommendation, or two | Exactly one, with its reason |
| Building straight from the canvas | The pick becomes `getting-sign-off` rows first |
| Comparing directions in an easy context | The hardest context the choice depends on |

## Works with

- `crafting-products`: the bar every direction meets, and the shared terms.
- `designing-visuals`: the structure every direction is judged on.
- `shaping-direction`: decides which problem and which approaches are worth drawing.
- `designing-flows`: when the problem is a multi-step flow.
- `decluttering-screens`: when the problem is clutter, its moves suggest the axes.
- `auditing-consistency`: when the answer already exists elsewhere in the product.
- `getting-sign-off`: the pick becomes its rows; its capture guide and page template are reused here.
- `settling-decisions`: Discuss answers and hybrids.
- Emil Kowalski's `prototype` builds variants behind a live picker in code with the same divergence rule; use it for a component with no product around it yet. Apple's and Linear's own products are good places to find the best existing answer to a pattern.
