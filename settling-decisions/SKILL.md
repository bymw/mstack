---
name: settling-decisions
description: "Settles open choices the user owns, one question at a time, each with two to four real options and one recommendation, recording every answer before anything is built. Use when work is blocked on a product, scope, priority, taste or risk decision, a spec is silent, or the user asks for options or help deciding. Not for generating design directions (exploring-directions)."
license: MIT
compatibility: "Uses the host's question tool (AskUserQuestion in Claude Code) when available; otherwise asks in plain text."
---

# Settling decisions

A message that lists five open questions sits unanswered. One question with a clear recommendation is answered in seconds. The person weighs one thing, sees what you would do, and says yes or changes it; each answer then removes or reshapes the questions behind it, so a long list settles in minutes.

This skill covers turning open questions into recorded decisions. It does not invent options from nothing: if a choice is visual, show it first with `getting-sign-off` or `exploring-directions`, then ask here.

## Two failure modes, and the first is worse

1. **Deciding silently.** Settling a question the user owns inside a build: picking a default, filling a spec gap, choosing between two plausible behaviours. They find out in review or in production, and it costs more than the question would have.
2. **Asking badly.** A wall of questions, options that are not real alternatives, no recommendation, or a question the code, spec or decisions log already answers.

## Rules

1. **Check before asking.** If the answer is in the spec, code, decisions log, design system or this conversation, it is not a question. Ask only what is the user's to decide. A question that belongs to someone else (legal, privacy, security, finance) is named with its owner for the user to take to them, not answered here.
2. **One question at a time** with the host's question tool. One call may carry up to four questions only when each is short and independent, so each still reads and answers as a single question; a question whose answer changes the others goes alone, first.
3. **Two to four real options,** each a genuine alternative whose description states its consequence. Options that differ only in wording are one option.
4. **Exactly one "(Recommended)",** placed first, with its reason in one sentence. A recommendation is a commitment: say what you would do and why, without hedging.
5. **Record each answer before acting on it,** where the work lives, noting when it went against the recommendation.
6. **Locking, approving or merging is the user's call,** asked last as its own question and never inferred from enthusiasm.
7. **Read free-text answers carefully.** "Other" answers often reshape the question or add a constraint; ask one short follow-up if one is ambiguous. An answer that contradicts an earlier one may be a mistap: ask again.
8. **Match the weight to the stakes.** A choice that is hard to undo and costly if wrong gets full options and the evidence behind each; a reversible, low-stakes one gets a default the user can accept in one word. Why: many choices that look reversible are not once people rely on them, and the rest should not slow the work.

## Method

1. **Gather** every open question, strike the ones answerable by reading, merge duplicates, and order by dependency (scope before detail; a question that removes others goes first).
2. **Frame each question:** plain words ending in a question mark, answerable without scrolling back, naming the screen or object rather than an internal id; a header of 12 characters or fewer; options with a 1 to 5 word label and a description stating the consequence. For a visual choice, use the option's `preview` to show the states side by side.

   <example>
   Should flows close from the leading or trailing corner?
   - **Leading (Recommended):** one way out in the same place on every flow; 17 flows already do it, and it keeps the corner away from the primary action.
   - **Trailing:** matches 24 flows today, but sits where the hand reaches for the primary action.
   - **By context:** each flow chooses; this keeps two answers to one job.
   </example>

   A question such as "What do you think about the close button?" fails: it has no options and nothing to say yes to.
3. **Ask, then update:** record each answer, check whether later questions still stand (answers often dissolve them), then ask the next. If the user says to answer them all with your recommendation, do so, record each as "recommended, accepted in bulk", and list them back.
4. **Close** with the summary table, then ask the lock question if a plan or batch is involved.

## Where answers go

- **A review page with a store:** the store, one record per row.
- **A plan:** its decisions table, before any batch is built.
- **A rule that overrules a written recommendation:** a decision entry in the project's decisions log, written as "X, not Y, because Z".

A project's operating contract (CLAUDE.md, a decisions log) may say where instead; follow it. When the tool is not available, ask in plain text: one question, the options as a numbered list with the recommendation marked and its reason, and "Reply with a number, or say what you'd change." That line is the last line of the message; anything else the user needs to know goes before the question.

## Output

| Question | Answer | Recorded in |
| --- | --- | --- |

Mark an answer that went against the recommendation with "(not recommended)".

## Gotchas

| Instead of | Do |
| --- | --- |
| Five questions in one message | One question, or up to four short independent ones; the rest after their answers |
| "What do you think?" | Options with consequences, one recommended |
| The recommendation buried in the last option | First, marked "(Recommended)", reason given |
| Asking what the code or spec already answers | Read first, and cite where you found it |
| Building on an answer before recording it | Record, then build |
| Treating "looks great" as approval to merge or lock | The lock question, asked explicitly |

## Works with

- `crafting-products`: never settle a product question silently.
- `getting-sign-off` and `exploring-directions`: show visual choices before asking about them.
- `auditing-consistency`, `walking-personas`, `decluttering-screens`, `sorting-feedback`, `building-ai-features`: sources of open questions.
- `shaping-direction`, `defining-outcomes`, `sequencing-bets`, `writing-specs`: product calls the user owns, such as the direction, a target or the order.
- `unifying-patterns`: builds once rows are agreed.
