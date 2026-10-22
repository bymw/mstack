---
name: getting-sign-off
description: Builds a sign-off page with one row per proposed change: the same real screen today and proposed, side by side, answered Agree, Not this or Discuss. Only agreed rows get built. Use when a design change, fix list or simplification needs sign-off, or the user asks to see before and after. Not for exploring several directions (exploring-directions).
license: MIT
---

# Before and after

A reviewer decides one row at a time: is the right-hand screen better than the left, yes or no? Everything on the page serves that question. A board that mixes several screens and states the fix as a rule makes the reviewer rebuild the change in their head, and it stalls. One 15-board consistency canvas had to be rebuilt as 26 strict pairs; in that form it was settled in one sitting.

This skill covers the sign-off page and building only what is agreed. The changes come from upstream (`auditing-consistency`, `sorting-feedback`, `decluttering-screens`, `walking-personas` or a review); rows marked Discuss are settled with `settling-decisions`. How to capture real screens on the web, iPhone, iPad and Mac is in [CAPTURE.md](CAPTURE.md); read it before capturing either side.

## Two failure modes, and the first is worse

1. **A proposal that is not the real interface.** A drawn screen, a mock with the wrong spacing, type or icons, or a screen at the wrong size. The reviewer judges the drift rather than the idea, or approves something that looks different once built: a search concept that won approval looked broken beside the real build.
2. **A row that asks two things.** Two changes at once, two different screens, or screens in different states. The reviewer cannot say yes to one half.

## Rules

1. **One change per row.** If it touches many screens, show the most representative and list the rest under "Also".
2. **Both sides come from the real product,** at the same device size, persona, data, state and scroll position. Make the proposed side by editing the live page, rendering the product's real components, or capturing a branch build. If the screen does not exist yet, render it from the product's real tokens and components at true size, and say so on the row; that is the only exception to "never drawn".
3. **Ring what changed on both sides,** in screen points read from the element's frame, never guessed.
4. **One sentence each side,** in plain words: "Today" says what is wrong from the person's side; "Proposed" says what changes.
5. **Decisions are saved to the page:** Agree, Not this or Discuss, plus an optional note, in the page's store (collection `decisions`, document id = row id), and read back before anything is built.
6. **A row that needs a decision says so,** with a recommendation ("Your call: left or right? I recommend left."). Findings with no single screen go in the short list at the end, not on a row.
7. **Build only agreed rows.** "Agree, but the design is poor" means redesign that row, republish it with its choice cleared, and ask again.
8. **Recapture after the build,** so the page records what shipped, not what was proposed.
9. **One editor checks the release.** Before a change goes wide, one named person uses the shipped thing in every state and with the longest content, judges whether it holds together, and may hold it back with the reason ("almost, but not yet"). Done is not the same as good.

## Method

1. **Rows.** List the changes from the source with short stable ids (`back`, `search`, `closed`). Group them by where the person meets them ("Getting around", "Getting things done", "When something stops"), not by severity, ordered along the person's path.
2. **Capture today** for every row at true device size, persona and state, at 2× density, as `img/b-<id>.jpg`, recording ring rectangles as you go.
3. **Make the proposed side** in the order of preference in CAPTURE.md (a CSS override, DOM edits from the product's own markup, real components rendered in place, a branch build) and capture `img/a-<id>.jpg` from the same element. Where the proposal is an existing screen, capture it and label it with `sub`.
4. **Build the page** from [review-page.html](review-page.html): fill in the title; the lede (how many changes, where they came from, how to read a row, whether anything is built); `SCREEN_W`, `SCREEN_H` and `SCREEN_RADIUS` for the device; `GROUPS` and `PAIRS`; and the footer (what is not on the page, how the screens were made). Publish it with `capabilities: {"db": {}}` and the images through `files`. JPEG at quality 80 to 85 keeps a 26-row page well within the limit. The template already handles the tally, saving with a device-only fallback, notes, rings, both themes and phone-width viewing.
5. **Read back** the store (`ArtifactData list`, collection `decisions`) before building. Report the tally and quote every note; notes are the reviewer's words and often change the row. Ask Discuss rows one at a time with `settling-decisions`.
6. **Build, then recapture:** build agreed rows under the project's own rules, capture the shipped screens, and republish the same page with each proposed image replaced by the built one.

## Output

The reply ends with the page link and one line: how many rows, and how to answer (Agree, Not this or Discuss). Anything else goes before it, never after. After the read-back, one line with the tally, then:

| Row | Choice | Note | Next step |
| --- | --- | --- | --- |

## Gotchas

| Instead of | Do |
| --- | --- |
| A board of several screens with the fix written as a rule | One row per change, the same screen twice |
| Today and proposed at different sizes, states or scroll positions | Identical framing; only the change differs |
| Building rows that were "nearly agreed" | Build Agree only; ask the rest with `settling-decisions` |
| Leaving the page showing the proposal after the build | Recapture and republish what shipped |
| Discussion-only findings dressed as rows | The short list at the end |

## Works with

- `crafting-products`: the bar each proposal is held to, and the shared terms.
- `auditing-consistency`, `sorting-feedback`, `decluttering-screens`, `walking-personas`: sources of rows.
- `exploring-directions`: when the question is "which direction?" rather than "is this better than today?"; the chosen direction becomes rows here.
- `settling-decisions`: Discuss rows and the lock.
- `unifying-patterns`: builds agreed consolidation rows so they stick.
- `designing-visuals` and `writing-ux-copy`: the checks every proposed side passes before it goes on the page.
- Emil Kowalski's `prototype` compares several possible futures behind a switcher in code.
