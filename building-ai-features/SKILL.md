---
name: building-ai-features
description: Holds AI features (rewrite, summarise, generate, transcribe, agents, assistants) to a standard people trust: labels that match results, nothing sent without a yes, honest waits, and an evaluation gate before shipping. Use when an AI feature is designed, built, reviewed or evaluated, or the user asks whether it is ready to ship or which model to use. Not for general visual quality (designing-visuals).
license: MIT
---

# AI product

An AI feature is only as good as the trust people place in it. Trust is earned in small ways: the action called "Simplify" actually simplifies, a rewrite keeps every fact, nothing is sent without a yes, the original is one tap away. It is lost the same way: one dropped fact, one surprise send, one result weaker than its label. AI makes learning fast; what to build, and what to kill, stays human.

This skill covers the behaviour, interface and quality gate of AI features. Labels and claims are written with `writing-ux-copy`, the flow that introduces the feature with `designing-flows`, and the working signal with `designing-motion`.

## Two failure modes, and the first is worse

1. **Untrustworthy.** The AI changes the person's words silently, drops or invents a fact, acts on something consequential without confirmation, overclaims privacy, or ships below a bar nobody wrote down. One incident and people stop using the feature, or the product.
2. **Disappointing.** Safe, but weaker than its label: "Friendlier" swaps one word, "Summarise" returns the same length, pressing again returns the same thing. The feature reads as a gimmick.

## Rules

**Trust**
1. **Keep heard, inferred, planned and did separate.** The interface shows what the person provided, what the AI understood, what it proposes and what it has done. When unsure, it asks ("Did you mean…?") rather than guessing.
2. **The label is a promise.** An action does exactly what its name says, strongly enough that the difference is obvious. A result weaker than the label is a product bug.
3. **Never lose the person's work.** Keep the original and the current version, Undo restores the original, closing never deletes. A rewrite keeps every fact and the person's voice unless the action says otherwise; restructuring keeps their framing (a list keeps its title and intent).
4. **Confirm anything consequential or visible to others.** Nothing is sent, published, purchased or deleted without an explicit yes; everything else is undoable instead of confirmed.
5. **Suggestions stay separate from accepted edits.** Never overwrite a correction silently.
6. **Transparency by default.** Say exactly what leaves the device and where it goes, including the unflattering parts. Access to personal context is earned, scoped and revocable; where it helps, people can see the instructions behind an action.

**Feel**
7. **Answer in the first 100 ms** with an honest signal that work has started, then stream the result as stable text that fades in rather than flickers. Waits are honest, never a fake percentage.
8. **Pressing again gives a fresh result.** Regenerate is one press, never a dead end such as "This already reads well".
9. **Design the conversation, not just the reply.** An empty prompt offers a few concrete starting points; a long task shows its plan before acting and an activity view the person can watch, stop and take over; follow-up suggestions are few and specific; generated text follows a written voice and format, like any interface text.

**Quality**
10. **Every AI feature passes an exam before it ships, built from real outputs.** First read a sample of real outputs, note the first thing that went wrong in each, and group and count the failure types; then write pass-or-fail checks for the most common ones. Pass marks are fixed before each new round of results, against a held-out set of real and adversarial cases, with blind old-versus-new comparisons judged by the owner. An AI judge is trusted only once it agrees with the owner's own labels where they differ, and real use is sampled again after launch. A feature that fails stays hidden; shipping below the bar is an explicit, written product decision. Every correction a person makes becomes a new test case.
11. **Autonomy is earned, and accuracy sets the interaction.** Often wrong: a suggestion. Usually right: a draft to review. Almost always right: an action with Undo. Roll out as drafts first, log every accept, edit and reject, and widen autonomy only as that evidence supports it. A confidence score is not proof.

**Engineering**
12. **Start from the workflow, not the model.** A rule sometimes beats an agent: cheaper, predictable and auditable. Use AI where it clearly does better.
13. **The simplest model that passes,** one narrow job each where possible, measured for latency and cost on the oldest supported hardware and slowest realistic network.
14. **Keys never live in the client.** Model calls go through the product's server with per-person limits and abuse protection, tester builds included.

## Method

1. **Name the job** in the person's words: what they want done and how they would judge it done. Write the label and the promise it makes.
2. **Design the loop:** input, first-frame signal, streaming, result, accept, regenerate, undo, and the way back to the original. Mark every point where something becomes consequential or visible to others; confirmation goes there.
3. **Design every state:** first use (what it is, what leaves the device), empty, working, partial, failed (what failed, what to do), offline, limit reached, access declined.
4. **Write the exam:** pass marks first, then a test set of real cases plus the worst ones (long input, mixed languages, names and numbers, ambiguous requests, input that should be refused). Criteria a human can judge: facts kept, label honoured, voice kept, nothing invented.
5. **Run it and decide:** a blind comparison against today or the previous version. Record the result and the decision ("Ship", "Hide", or "Ship below the bar, because…") with the date.
6. **Group and order the actions:** variants of one action together, ordered by usefulness; actions that build on each other say so; a new action earns its place with evidence, like any setting.

## Output

**Headline:** one sentence, for example "Rewrite styles: 4 of 6 pass; 'Formal' drops facts in 1 case in 8, hidden until fixed."

| Action | Promise | Result | Decision |
| --- | --- | --- | --- |
| Simplify | Shorter, plainer, every fact kept | Passes 8 of 8 | Ship |

**Trust check,** one line each: heard, inferred, planned and did kept separate; original kept; confirmations in place; what leaves the device stated. Pass marks and the test set follow, after the main points. For a review, findings go under High, Medium and Low headings, every one included.

## Gotchas

| Instead of | Do |
| --- | --- |
| Changing the person's words without showing it | Show the change; keep the original one tap away |
| A spinner, then a wall of text | An immediate signal, then streamed, stable text |
| "Nothing leaves your device" when something does | Exactly what leaves, and where |
| Shipping because the demo looked good | Pass marks written first, a blind comparison, a recorded decision |
| One large model for every job | The smallest model that passes each job |
| Gradients, glows or sparkles to mark AI | The same calm interface as the rest of the product |

## Works with

- `crafting-products`: principle 9, truth before polish, and the shared terms.
- `writing-ux-copy`: labels for AI actions and claims about privacy and accuracy.
- `designing-flows`: introducing the feature and asking for access.
- `designing-motion`: the working signal is a "wait" role, the only kind that loops.
- `defining-outcomes`: the outcome the AI feature serves, beyond its quality bar.
- `writing-specs`: example sets as acceptance in the spec.
- `settling-decisions`: shipping below the bar is the owner's call.
- Apple's Human Interface Guidelines, "Machine learning" and "Generative AI".
