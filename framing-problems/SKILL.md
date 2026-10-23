---
name: framing-problems
description: "Turns raw material (a data export, logs, a handover folder, written rules, a brief, people's accounts) into a problem statement anyone can understand in one read: the ask decoded, a plain glossary, every number checked and marked fact, inference or unknown, sources reconciled, and open questions with owners. Use when the user asks what is really going on, why a number moved, where a project stands or what happened, or says they do not understand the material. Not for deciding what to build (shaping-direction) or sorting what people said (sorting-feedback)."
license: MIT
---

# Framing problems

Most bad decisions start from a problem nobody checked. The material is usually all there (an export, a log, a handover folder, three people's accounts), and it disagrees with itself. The work is to read all of it, count, test it against the rules already written down, and say what is true in words the reader already knows, before anyone decides what to do.

This skill covers what is true and what the problem is. What to do about it is `shaping-direction`; what people said and what to act on is `sorting-feedback`; a brief for a leader is `writing-briefs`; how success will be measured is `defining-outcomes`.

## Two failure modes, and the first is worse

1. **Plausible and wrong.** A story that fits part of the data ("the new price did it"), a dashboard number trusted without asking how it is counted, one person's account treated as the record. The team then solves a problem that does not exist, with full confidence.
2. **Correct and unreadable.** Every finding right, but in the material's jargon, unranked and mixed with fixes, so the reader cannot tell what the problem is or what needs them.

## Rules

1. **Decode the ask first:** who asks, what they literally asked, what they need (an answer, a decision, a document) and what they will judge the result on. Why: a correct answer to a different question is still a miss.
2. **Size the investigation.** A question one source answers gets a few lines. A moved metric, an incident, an inherited project or an unfamiliar domain gets the full method. Why: the method is heavy, and small questions deserve small answers.
3. **Terms before findings.** Every term the reader may not know gets one plain line. Flag any word the sources use in different ways ("conversion" as paid per trial in one report and paid per install in another). Why: sources that seem to disagree often only define a word differently, and a reader who stumbles on a term stops trusting the rest.
4. **Read everything; count, never estimate.** Every file, table and rule. Every claim of size is a number with its source ("8 distinct tickets, not 10"), never "several", "most" or "three are the same". Why: the planted fact is usually in the part nobody opened, and a count settles what an adjective only suggests.
5. **Check how a number is made before trusting it:** what is counted, from which events, since when. Look for duplicate rows, double counting, tracking changes and records that failed to link. Why: a moved metric is a measurement change more often than people expect.
6. **Every written rule is a test.** Spec lines, decisions, policies and promises are each checked against what the data or the system shows; a broken rule is a finding, with both sources quoted. Where documents disagree, the later decision is the current word, marked to confirm with its owner. Why: the most serious problems are rules already agreed and quietly broken.
7. **Records over accounts.** Build timelines and counts from logs and data, then check each person's account against them, saying where it is right and where it is wrong, with the line that proves it. Why: an account is memory plus a theory; a record is neither.
8. **Mark every finding fact, inference or unknown,** with the check that produced it. A rate needs its denominator, and a conclusion drawn from matching counts or timing is an inference, not a fact. Never invent a cause, figure or quote; an unexplained change stays unknown rather than being pinned on the nearest event. Why: a guess written like a fact becomes the fact someone repeats.
9. **The problem first, on its own.** Who is affected, what goes wrong, since when and what it costs, in numbers. Next steps come after, in a short separate section, each with an owner; designing the fix belongs to the next skill. Why: fixes mixed into the explanation hide the problem and start a debate about the fix before the facts are agreed.
10. **Explain in layers, and say each thing once:** the problem in one sentence, then the story in numbered steps, then terms, then only the findings the story did not already carry, then open questions. Each layer adds; nothing is restated. The reader can stop at any layer and still be right. Why: readers stop early, so the first layer must carry the whole answer, and a point said three times makes the answer three times as long without making it truer.
11. **Every open question names who can answer it.** Why: a question with no owner is never answered.

## Method

0. **Size it** (rule 2). If one source answers it, answer in a few lines and stop.
1. **Decode the ask** in two sentences, and check it with the user when unsure.
2. **Inventory the material:** each source, what it holds, how big, how current. Note what is missing.
3. **Write the glossary** as you read, including words used two ways.
4. **Reconcile the records:** duplicates, double counts, unlinked rows, tracking changes. Recount with them fixed, and say how much the picture moved.
5. **Test every rule** against the records, and **check every account** against them.
6. **Mark each finding** fact, inference or unknown, with its check.
7. **Write the problem statement:** one sentence, in numbers; it opens the answer. If it will not write, say what is still unknown and who can close it.
8. **Layer the answer** in the output below, then hand on: what to do goes to `shaping-direction`, the measure of success to `defining-outcomes`, a version for a leader to `writing-briefs`.

## Output

Structure the answer as `crafting-products` describes. The first line carries the whole answer.

**The problem:** one sentence: who is affected, what goes wrong, since when, what it costs, in numbers. Detail belongs to the layers below.

**What happened:** three to six numbered steps, in order.

| Term | What it means here |
| --- | --- |

| Finding | Evidence | Fact, inference or unknown |
| --- | --- | --- |

| Next step | Owner |
| --- | --- |

| Open question | Who can answer |
| --- | --- |

Findings already told in the story are not repeated in the table. Leave out an empty section rather than filling it.

## Gotchas

| Instead of | Do |
| --- | --- |
| Findings first, terms never | A plain glossary before any finding |
| "Several tickets duplicate each other" | "SA-101, SA-105 and SA-106 are one job: 8 items, not 10" |
| Trusting the dashboard's number | How it is counted, then the recount |
| The most convincing person's account | The log first, then each account checked against it |
| An unexplained change pinned on the nearest event | Marked unknown, with who can find out |
| Fixes woven through the explanation | The problem on its own, then next steps with owners |
| One long answer at a single depth | Layers the reader can stop at |
| The same point in the summary, the story and the findings | Each layer adds; nothing is said twice |
| The later decision picked silently | The later decision as the current word, marked to confirm with its owner |
| A rate from counts whose total is unknown, labelled fact | The counts as fact, the rate as unknown until the total is found |

## Works with

- `crafting-products`: truth before polish, and how answers are structured.
- `shaping-direction`: what to do once the problem is agreed.
- `sorting-feedback`: what people said, and what to act on.
- `defining-outcomes`: the measure that would show the problem is solved.
- `writing-briefs`: the finding explained to a leader or partner.
- `settling-decisions`: open questions the user owns.
- Outside the set: Richard Feynman on not fooling yourself; Toyota's "go and see" (genchi genbutsu); the Five Whys, used on records rather than recollection.
