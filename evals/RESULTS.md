# Results

**With the skills, answers showed 89% of the expected behaviours. Without them, 36%.** Leaving out the checks on each skill's own output format, which a model without the skill cannot know, the gap holds: 89% against 39%. Every skill beat its baseline. On a [held-out set](#held-out-set) written without reading the skills, the gap is 4 points on Opus 5.5 and 2 on Sonnet 5.5, and Haiku 5.5 does slightly worse with the skills.

Final run on Claude Opus 5.5, October 2026: all 21 skills, 63 scenarios, each run once with the skills and once without, graded blind.

## By skill

| Skill | With skills | Without |
| --- | --- | --- |
| `settling-decisions` | 100% | 29% |
| `shaping-direction` | 100% | 17% |
| `writing-specs` | 100% | 29% |
| `auditing-consistency` | 94% | 61% |
| `exploring-directions` | 94% | 28% |
| `getting-sign-off` | 94% | 28% |
| `sequencing-bets` | 94% | 33% |
| `crafting-products` | 89% | 33% |
| `defining-outcomes` | 89% | 61% |
| `designing-flows` | 89% | 39% |
| `designing-motion` | 89% | 44% |
| `diagnosing-feel` | 89% | 33% |
| `sorting-feedback` | 89% | 50% |
| `writing-ux-copy` | 89% | 28% |
| `building-ai-features` | 83% | 39% |
| `designing-visuals` | 83% | 22% |
| `walking-personas` | 83% | 33% |
| `writing-briefs` | 83% | 44% |
| `breaking-experiences` | 78% | 22% |
| `decluttering-screens` | 78% | 44% |
| `unifying-patterns` | 72% | 44% |
| **All** | **89%** (333 of 376) | **36%** (137 of 376) |

## Added after the final run

| Skill | With skills | Without |
| --- | --- | --- |
| `optimizing-discoverability` | 100% | 83% |
| `framing-problems` | 94% | 28% |
| `building-ai-features`, new scenario 4 only | 5 of 6 | 2 of 6 |

`optimizing-discoverability` was tested on its three scenarios the same way, against a baseline that could also search the web; the gap is smaller because current SEO advice is easy to find, and the skill's edge is completeness and dated sources. `framing-problems` and the fourth `building-ai-features` scenario (AI acting for an organisation) were also run against the 21 skills before them, which scored 44% and 3 of 6: the existing set routed these prompts to `shaping-direction`, `writing-briefs` and `sorting-feedback` and still missed the checks. Graded blind, the answers with the new skill were also the most accurate (4 factual slips against 5 with the 21 skills and 7 with none), but the longest. Rule 10 was then tightened to say each thing once, opening with the problem in one sentence; two reruns were judged faster to read, and scored 4 to 6 of 6 per scenario, within the noise of single runs.

## Trigger checks

With all 23 skills, 145 of 145 (2026-10-23), including the near-misses for `framing-problems` and `optimizing-discoverability`. The run before the two new skills, with 21:

130 of 131. A fresh session saw only the twenty-one names and descriptions and picked a skill for each prompt: at least three that should load each skill, and near-misses that belong to a neighbour, including the riskiest boundaries (visuals and decluttering, walking and breaking, shaping and exploring, AI features and specs). The one miss was a prompt whose label contradicted the motion boundary; the label has since been corrected.

## How the numbers came about

| Run | With skills | Without | What changed before it |
| --- | --- | --- | --- |
| First | 84% | 36% | Nothing; the skills as first written (20 skills) |
| After one round of fixes | 92% | 36% | Recurring misses fixed as general rules, then the affected scenarios rerun |
| **Final** | **89%** | **36%** | Gaps from source research, a 21st skill, and two independent reviews; every scenario rerun fresh |

The first run is the fairest measure of the skills as written, because nothing had been tuned against these scenarios yet. Later runs reuse the same scenarios, so they partly measure fixes made against them.

## How it was run

1. **Scenarios.** Three per skill, written from the skill's own rules, each with input files where the task needs them and 4 to 6 behaviours checkable from the answer alone.
2. **Runs.** Each scenario ran in a fresh agent with the skills, and in another with no skills. Runners never saw the expected behaviours.
3. **Grading.** A separate agent graded each pair, labelled only A and B in shuffled order, pass or fail per behaviour, quoting the line that decided it.
4. **Format checks.** Behaviours that check a skill's own output layout are counted in the headline and reported separately above.

## Limits worth knowing

- **One run per condition,** so differences of a few points between skills are noise.
- **Model-graded.** The grader is a model; each verdict quotes its evidence so it can be checked. Answers and gradings are kept outside the repository.
- **Behaviours come from the skills,** so the scenarios test whether the skills do what they promise, not whether those promises are the best possible ones.
- **Same scenarios across runs.** The skills were tuned against these scenarios. The [held-out set](#held-out-set) checks them on new ones.
- **Some behaviours cannot pass here.** Running a guard against real code or recording on a device was not possible in this setup, so those fail in both conditions.
- **One model.** This set ran on Opus 5.5 only. The [held-out set](#held-out-set) also ran on Sonnet 5.5 and Haiku 5.5.

## Held-out set

**On 46 new scenarios written without reading the skills, the skills added little. Opus 5.5 passed 93% of the behaviours with them and 89% without, Sonnet 5.5 90% and 88%, Haiku 5.5 79% and 81%.** No gap is beyond chance. The baseline already did most of what an expert would expect from the request alone, so this set shows where the skills add craft on top of a strong model, and that on Haiku they cost about as much as they add.

October 2026, skills as of commit 640a9f8: 23 skills, two scenarios each, each run once per model with the skills and once without, graded blind by Opus 5.5. How the scenarios were written and run: [heldout/README.md](heldout/README.md).

### By model

| Model | With skills | Without | Behaviours passed only with skills | Only without | Scenarios better, same, worse with skills |
| --- | --- | --- | --- | --- | --- |
| Opus 5.5 | 93% (256 of 276) | 89% (245 of 276) | 24 | 13 | 16, 21, 9 |
| Sonnet 5.5 | 90% (248 of 276) | 88% (244 of 276) | 21 | 17 | 13, 23, 10 |
| Haiku 5.5 | 79% (219 of 276) | 81% (224 of 276) | 32 | 37 | 15, 12, 19 |
| **All** | **87%** (723 of 828) | **86%** (713 of 828) | 77 | 67 | 44, 56, 38 |

A sign test on the behaviours that differ gives p = 0.10 for Opus and 0.63 for Sonnet and Haiku. Answers with the skills were longer: median 2,186 against 2,173 words on Opus, 2,139 against 1,797 on Sonnet, 1,020 against 950 on Haiku.

### By skill

Behaviours passed out of 12 (two scenarios of six), with the skills / without.

| Skill | Opus 5.5 | Sonnet 5.5 | Haiku 5.5 | Net |
| --- | --- | --- | --- | --- |
| `auditing-consistency` | 11 / 12 | 12 / 12 | 8 / 8 | -1 |
| `breaking-experiences` | 12 / 11 | 12 / 11 | 9 / 10 | +1 |
| `building-ai-features` | 11 / 11 | 11 / 11 | 9 / 12 | -3 |
| `crafting-products` | 12 / 11 | 10 / 11 | 9 / 8 | +1 |
| `decluttering-screens` | 12 / 9 | 11 / 12 | 12 / 10 | +4 |
| `defining-outcomes` | 11 / 12 | 11 / 12 | 9 / 11 | -4 |
| `designing-flows` | 10 / 12 | 9 / 9 | 9 / 8 | -1 |
| `designing-motion` | 12 / 11 | 12 / 11 | 11 / 11 | +2 |
| `designing-visuals` | 12 / 11 | 12 / 10 | 10 / 11 | +2 |
| `diagnosing-feel` | 12 / 11 | 12 / 12 | 9 / 10 | +0 |
| `exploring-directions` | 11 / 11 | 10 / 10 | 7 / 9 | -2 |
| `framing-problems` | 11 / 11 | 12 / 10 | 9 / 11 | +0 |
| `getting-sign-off` | 12 / 11 | 12 / 12 | 11 / 11 | +1 |
| `optimizing-discoverability` | 10 / 9 | 11 / 10 | 10 / 11 | +1 |
| `sequencing-bets` | 11 / 12 | 11 / 11 | 11 / 8 | +2 |
| `settling-decisions` | 11 / 10 | 9 / 10 | 12 / 10 | +2 |
| `shaping-direction` | 12 / 9 | 12 / 10 | 10 / 8 | +7 |
| `sorting-feedback` | 11 / 12 | 11 / 10 | 11 / 10 | +1 |
| `unifying-patterns` | 11 / 10 | 10 / 10 | 6 / 8 | -1 |
| `walking-personas` | 12 / 11 | 11 / 10 | 10 / 12 | +0 |
| `writing-briefs` | 10 / 10 | 8 / 9 | 7 / 11 | -5 |
| `writing-specs` | 11 / 11 | 11 / 11 | 12 / 9 | +3 |
| `writing-ux-copy` | 8 / 7 | 8 / 10 | 8 / 7 | +0 |

### Where the skills help most and least

Net behaviours gained across the skill's two scenarios, with what made the difference.

| Model | Help most | Help least |
| --- | --- | --- |
| Opus 5.5 | `decluttering-screens` +3 (a full inventory first, every capability kept reachable, the revised page in full); `shaping-direction` +3 (risks beyond demand, a test that takes days, a time box and a pass mark); +1 in eleven more, such as severity ranking in `walking-personas` and duplicate bookings from retries in `breaking-experiences` | `designing-flows` -2 (account still forced at booking, a vague confirmation kept); -1 in `auditing-consistency`, `defining-outcomes`, `sequencing-bets` and `sorting-feedback` (copy tone left out of the audit, the early signal too late, no cost of delay, no transcript line per item) |
| Sonnet 5.5 | `designing-visuals` +2 (one named focal point, a spacing scale); `shaping-direction` +2 (a cheap test, a pass mark); `framing-problems` +2 (a plain opening statement, jargon explained) | `writing-ux-copy` -2 (no table to compare the messages, a permission screen without a concrete benefit); -1 in `crafting-products`, `decluttering-screens`, `defining-outcomes`, `settling-decisions` and `writing-briefs` |
| Haiku 5.5 | `sequencing-bets` +3 (stop rules, questioning the evidence); `writing-specs` +3 (interruptions, defined nouns, open questions kept open); +2 in `decluttering-screens`, `settling-decisions` and `shaping-direction` | `writing-briefs` -4 (the ask not up front, no cost of waiting, no line for parents); `building-ai-features` -3 (no binding pass bar, no way to report a bad draft); -2 in `defining-outcomes`, `exploring-directions`, `framing-problems`, `unifying-patterns` and `walking-personas` |

The pattern on Haiku: with the skills it more often followed the skill's structure at the cost of specifics in the request, compressed the answer into the skill's tables, or held work back as options for the person to choose (placeholder rooms in a mockup, delete protection left as an open decision).

### Skills that don't beat baseline on any model

| Skill | Opus, Sonnet, Haiku | Where answers with the skill fell short |
| --- | --- | --- |
| `auditing-consistency` | lower, tie, tie | On Opus, the audit table left out copy tone; Sonnet and Haiku tied |
| `building-ai-features` | tie, tie, lower | On Haiku, no binding pass bar before launch, no way to report a bad draft, and 20 test meetings not called too few |
| `defining-outcomes` | lower, lower, lower | On Opus and Sonnet, the early signal came in week 3 or 4, not the first week or two; on Haiku, a key result's missing target went unflagged and no pasteable OKR was given |
| `exploring-directions` | tie, tie, lower | On Haiku, placeholder rooms instead of the page's real ones, and directions not judged against the main job |
| `writing-briefs` | tie, lower, lower | The decision asked of the CEO came at the end, not in the opening lines (all three models); on Haiku, no line for parents |

Only `shaping-direction` beat the baseline on all three models.

### Why the gap is smaller than on the main set

The baseline here passed 81% to 89% of the behaviours, against 36% on the main set. Two likely reasons:

1. **Different behaviours.** The main set's behaviours were written from the skills' own rules, including their methods and output formats. These were written from the request alone, so they reward judgement a strong model already has.
2. **Not a bare baseline.** Both conditions had the author's personal working rules in context (answer first, one primary action, one question at a time, check every state, no em dashes), which overlap with the skills' foundations.

Read together: the main set shows the skills reliably apply their own methods. The held-out set shows that, judged only by what the request asks, those methods add about 4 points on Opus, 2 on Sonnet and nothing on Haiku, on top of a model that already works by good rules.

### Limits of the held-out set

- **Shared context.** Every runner was an agent inside one working session, so both conditions had the author's working rules and the list of installed skill names and descriptions. Several runners in both conditions checked their own answer for em dashes, a rule that exists only there. No baseline runner read a skill file (checked in every transcript). A rerun in a clean session is the next step.
- **Written by the same model family.** Opus 5.5 wrote the scenarios. It was told to use only each skill's README line, but the session also listed each skill's longer description, which names some of its rules.
- **One run per condition.** A difference of one or two behaviours in a skill is noise; only the per-model totals are worth reading, and even those are not significant.
- **One grader.** Opus 5.5 graded all three models, including its own answers. Each verdict quotes its evidence.
- **Ceiling.** In 37 of 46 Opus scenarios and 38 of 46 Sonnet scenarios, both answers passed 5 or 6 of 6, leaving little room to show a gain (Haiku: 20 of 46).
- **Some behaviours are strict.** Two failed in all six answers: putting the whole answer to a school's question in the first sentence, and ending with a summary of what changed.
