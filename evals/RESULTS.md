# Results

**With the skills, answers showed 89% of the expected behaviours. Without them, 36%.** Leaving out the checks on each skill's own output format, which a model without the skill cannot know, the gap holds: 89% against 39%. Every skill beat its baseline.

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
- **Same scenarios across runs.** There is no held-out set yet; new scenarios written without reading the skills would be the next step.
- **Some behaviours cannot pass here.** Running a guard against real code or recording on a device was not possible in this setup, so those fail in both conditions.
- **One model.** Tested on Opus 5.5 only, not yet on Sonnet or Haiku.
