---
name: writing-specs
description: Writes the spec builders and agents work from once a direction is chosen: the problem in numbers, scope, defined nouns, a sketch-level flow, every state, the data model and API sketch, checks that prove it done, and a decision log. Use when the user asks for a PRD, spec, requirements, acceptance criteria or a plan for an agent. Not for choosing the direction (shaping-direction) or visual design (designing-visuals).
license: MIT
---

# Product definition

A definition draws the edges so builders can be creative inside them. Too thin, and the gaps get filled with guesses; too thick, with every requirement and pixel fixed, and it breaks on first contact with the code. The right one names the problem in numbers, fences the scope, shows the flow at sketch level, covers every state, and says plainly what is still open.

This skill covers the document builders work from. The direction comes from `shaping-direction` and success from `defining-outcomes`; the steps are designed with `designing-flows`, the look with `designing-visuals` and the words with `writing-ux-copy`; open choices go to `settling-decisions`.

## Two failure modes, and the first is worse

1. **A definition that fakes certainty.** Confident requirements nobody tested, words like "dashboard" or "sync" left undefined so they grow, the happy path only. Builders implement it faithfully, and the gaps surface weeks in or in production.
2. **Too much, too early, too finished.** A long requirements list or a finished mock with no builder input, in system language. It hides the logic, invites rework, and nobody reads it.

## Rules

1. **Start with the problem paragraph:** a specific person (never "all users"), the moment, and what it costs them today, in numbers where known. Why: if this paragraph will not write, the problem may not exist; go back to `shaping-direction` before defining a solution.
2. **Draw the perimeter.** In scope, out of scope, devices supported, paths supported, and the trade-off principles ("fast over complete"). Why: every constraint removes a decision someone would otherwise guess.
3. **Define the nouns.** Every word that could mean ten things ("dashboard", "share", "sync"), including the ones in the feature's own name and the technical ones such as sync, gets one line on what it means here and what it does not. Why: an undefined noun is where scope grows unnoticed.
4. **Sketch level, not finished design.** Show the flow as places, the controls in each, and how they connect, before any visual design. Why: a finished mock hides the logic and fixes the look before the logic is right.
5. **Every state and edge case,** per place: empty, first run, partial, error, offline, permission off, the longest content, the largest number, a slow network, undo. Why: edge cases are most of the build, and leaving them out leaves the hardest parts to guesswork.
6. **Name the rabbit holes and the no-gos:** where the work could sink time, the decision that avoids it, and what is explicitly not being built. Why: a risk named before the build costs a sentence; found during it, a week.
7. **Shape it with a builder.** Someone who will build it checks the riskiest part against the real code before the definition is final. Why: one look at the code can turn one step into three, and it is cheaper to learn that now.
8. **Say where each of the four risks stands.** Value, usability, feasibility and viability: which were tested and how, and which are still open. Every viability row from `shaping-direction` marked Consult becomes an open question with its owner (legal, privacy, security, finance, support, sales). Why: a spec that hides an untested risk hands it to the builders, who are the last people able to settle it.
9. **Plan the rollout to learn.** Release in widening circles (the team, then trusted users, then everyone), each with who gets it, what lets it widen, a holdback for comparison where traffic allows, and a kill switch; and say who is ready to explain, sell and support it on launch day. Why: real use finds what a lab misses, and a wide launch with no way back turns a fixable fault into a public one.
10. **Success is the outcome, not usage:** the change and its metrics from `defining-outcomes`. Why: "people use the feature" teaches to the test.
11. **For AI behaviour, examples are the spec.** A set of real inputs, each with its expected result or pass mark, serves as acceptance and grows as real data arrives. Why: a feature that is right 60% of the time is a different product from one right 99% of the time. (`building-ai-features`)
12. **Give builders the contracts, not just the behaviour.** When people or agents build from it, sketch the technical shape: the data model (entities, fields, ownership), the interfaces or API surface (each call, its input, its result, its errors), the rules for sync, permissions and conflicts, and the analytics events. Use code blocks and tables, and mark names as sketches to map to the codebase's own conventions. Why: behaviour without contracts leaves every builder to invent the model, and two builders invent two.
13. **Write checks a builder or agent can verify.** Each part has a test that says it is done; standards (the design system, existing flows, the project's rules) are referenced, not restated. Why: agents follow a plan they can verify and drift from one they cannot.
14. **Numbers over adjectives.** No "seamless", "intuitive" or "great"; say what, and how much. Why: adjectives hide the trade-offs.
15. **Size the document to the work, and keep it complete for builders.** A small change (days) gets a few lines. A feature gets as much as builders need and no more: brevity means no restated context, method or prose padding, never a missing contract, state or check. The opening lines and the summary of what ships must stand on their own, so a reader can stop there. Why: process heavier than the work gets skipped, and a gap in the contracts costs more than a page of tables.
16. **Open questions and decisions live in the document.** Each open question names who decides; each decision is written "X, not Y, because Z". Why: the document is where the next person looks for why.

## Method

1. **Size it:** small change, feature or new bet; pick the matching length from Output.
2. **Write the problem paragraph,** and bring in the outcome from `defining-outcomes`, or mark it missing.
3. **Draw the perimeter** and define the nouns.
4. **Sketch the flow:** places, controls, connections. Detailed step design goes to `designing-flows`.
5. **List every state and edge case,** place by place.
6. **Sketch the technical shape:** the data model, interfaces, rules and events the states imply.
7. **Review with a builder:** the riskiest part against the code, then the rabbit holes and no-gos. Record where each of the four risks stands, and plan the rollout.
8. **Add the checks** (or the example set for AI behaviour), the open questions and the decision log.
9. **Edit:** cut adjectives and system words, and make sure the first paragraph stands on its own. When others review it, ask them to read it fully before commenting, and to mark each comment as a note, a suggestion or a must.

## Output

A small change keeps sections 1, 3 and 10. A feature that builders or agents will build gets all twelve. The opening lines say what ships in one sentence, so a builder knows the shape before the detail.

The definition holds what builders would otherwise guess: scope, behaviour, states and checks. Interface copy, visual detail and motion are not written out here; they come from `writing-ux-copy`, `designing-visuals` and `designing-motion` when the screens are designed. Cut any sentence a builder would not miss.

1. **Problem:** who, the moment, the cost today.
2. **Outcome:** the change, the primary metric and its countermetric.
3. **Perimeter:** in, out, devices, trade-off principles, defined nouns.
4. **Risks:** the four risks, each tested (and how) or open, with every viability owner to consult.
5. **Flow:** places, controls and connections, at sketch level.
6. **States and edge cases,** per place.
7. **Technical shape:** data model, interfaces or API surface, sync, permission and conflict rules, events, as code blocks and tables.
8. **Appetite, rabbit holes and no-gos.**
9. **Rollout and launch:** the circles, what widens each, holdback, kill switch, and who is ready to explain, sell and support it.
10. **Checks:** what proves each part is done; the example set for AI behaviour.
11. **Open questions:** question · who decides · what it blocks.
12. **Decision log:** X, not Y, because Z.

## Gotchas

| Instead of | Do |
| --- | --- |
| Starting with the solution | The problem paragraph, with who and how much |
| "All users" | The specific person and moment |
| "A dashboard" | What it shows, for whom, and what it does not |
| A finished mock as the spec | Places, controls and connections first |
| The happy path only | Every state and edge case |
| "Success: people use it" | The outcome and its countermetric |
| A requirement nobody checked against the code | A builder's look at the riskiest part first |
| A full document for a small fix | A few lines: problem, perimeter, checks |
| Writing out every label, message and animation | Behaviour and states here; copy and motion from their own skills |
| Behaviour with no data model or API | The technical shape sketched in code blocks and tables |
| A spec silent on legal, privacy or support | The four risks with each open viability owner named |
| "Launch to everyone" | Widening circles with a holdback and a kill switch |
| "Seamless", "intuitive", "great" | What exactly, and how much |
| Decisions made in chat and lost | The decision log, in the document |

## Works with

- `crafting-products`: the bar, the shared terms, and the states every definition covers.
- `shaping-direction`: the direction this defines; go back when the problem paragraph will not write.
- `defining-outcomes`: the success section.
- `sequencing-bets`: which bet gets defined next.
- `designing-flows`, `designing-visuals`, `writing-ux-copy`: the steps, the look and the words.
- `walking-personas`: the states, walked as real people.
- `building-ai-features`: example sets as acceptance for AI behaviour.
- `settling-decisions`: the open questions the user owns.
- `writing-briefs`: a version for readers who are not building it.
- Outside the set: Ryan Singer (shaping, breadboards, rabbit holes and no-gos), Amazon's working backwards (the problem paragraph first), Kevin Yien (constraints as the perimeter, and a decision log in the document), Marty Cagan (the definition written after the evidence, to communicate rather than to fake certainty).
