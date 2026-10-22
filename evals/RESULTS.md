# Results

**With the skills, answers showed 92% of the expected behaviours. Without them, 36%.** Every skill beats its baseline, and every description picks its own requests.

Run on Claude Opus 5.5, October 2026. 60 scenarios, each run once with the skills and once without, graded blind.

## By skill

| Skill | With skills | Without |
| --- | --- | --- |
| `auditing-consistency` | 100% | 50% |
| `exploring-directions` | 100% | 28% |
| `sequencing-bets` | 100% | 33% |
| `settling-decisions` | 100% | 29% |
| `sorting-feedback` | 100% | 39% |
| `writing-specs` | 100% | 35% |
| `writing-ux-copy` | 100% | 22% |
| `designing-flows` | 94% | 33% |
| `getting-sign-off` | 94% | 33% |
| `shaping-direction` | 94% | 22% |
| `crafting-products` | 89% | 33% |
| `decluttering-screens` | 89% | 33% |
| `defining-outcomes` | 89% | 61% |
| `designing-motion` | 89% | 33% |
| `diagnosing-feel` | 89% | 39% |
| `walking-personas` | 89% | 44% |
| `building-ai-features` | 83% | 33% |
| `unifying-patterns` | 83% | 50% |
| `writing-briefs` | 83% | 39% |
| `designing-visuals` | 78% | 22% |
| **All** | **92%** (330 of 358) | **36%** (128 of 358) |

## Trigger checks

120 of 121 in the latest run (121 of 121 in the one before; the miss was an ambiguous prompt, since reworded). A fresh session saw only the twenty names and descriptions and picked a skill for each prompt: three or more that should load each skill, and three near-misses that belong to a neighbour.

## How it was run

1. **Scenarios.** Three per skill, written from the skill's own rules, each with input files where the task needs them and 4 to 6 behaviours checkable from the answer alone.
2. **Runs.** Each scenario ran in a fresh agent with the skills, and in another with no skills. Runners never saw the expected behaviours.
3. **Grading.** A separate agent graded each pair, labelled only A and B in shuffled order, pass or fail per behaviour with the deciding line quoted.
4. **One round of fixes.** The first run scored 84% against 36%. Misses that recurred across scenarios were fixed in the skills as general rules (closing lines last, no invented figures, complete risk tables, output checklists for the review skills). The 22 affected scenarios were rerun and graded blind against the same baseline answers, which graded the same both times.
5. **A second round from the sources.** Gaps found in Lenny's Podcast transcripts and talks by Marty Cagan, Katie Dill and Robby Stein were added (the four risks with a concrete viability check, rollout plans, journey walks, density by use, a release editor, AI quality from real outputs). The 39 scenarios of the 13 changed skills were rerun and graded blind: 6 rose, 3 fell (two by one point, one by two), the rest held.

## Limits worth knowing

- **One run per condition.** No repeated runs, so small differences between skills are within noise.
- **Model-graded.** The grader is a model, not a person; each verdict quotes its evidence so it can be checked.
- **Behaviours come from the skills.** Some check the skill's own output format, which a model without the skill cannot know. The gap on substance is smaller than the headline, though still large.
- **Some behaviours cannot pass here.** Running a guard against real code, or recording on a device, was impossible in this setup, so those fail in both conditions.
- **One model.** Tested on Opus 5.5 only.

The answers and gradings are kept outside the repository; rerun with [README.md](README.md).
