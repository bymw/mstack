# Held-out set

Forty-six scenarios, two per skill, that the skills were never tuned against. They exist to check that the results in [RESULTS.md](../RESULTS.md) are not just the skills passing their own tests.

## How they were written

| Rule | Why |
| --- | --- |
| Written before opening any SKILL.md or reference file | The behaviours can't echo the skill's own rules |
| Based only on the skill's name and its one-line description in the README | That is all a stranger choosing the skill would know |
| Requests a product manager, design engineer or engineer would really send | Tests the job, not the skill's vocabulary |
| Expected behaviours are what a world-class answer would do, judged from the request alone | A skill earns credit only for doing what an expert would |
| Invented, neutral products, none reused from the main set | No overlap with scenarios the skills were tuned on |
| Never used to tune a skill | If a held-out result leads to a skill change, move that scenario to the main set and write a new one |

Same format as [FORMAT.md](../FORMAT.md), with `"set": "heldout"` and no trigger checks. Input files are in [fixtures/](fixtures/).

## How they are run

Each scenario runs in a fresh agent per model and condition. Runners never see the expected behaviours.

| Condition | What the runner reads |
| --- | --- |
| With skills | `crafting-products/SKILL.md`, the named skill's `SKILL.md`, any file in those two folders they point to, then the request |
| Without skills | The request only |

Both runners get the same rules: only read and write files, no commands, web or skill loading; no questions back (state the assumption and answer); put any page or code in full in the answer; never mention the instructions or a skill by name.

Both runners were agents inside one working session, so both also had that session's standing context: the author's personal working rules and the list of installed skill names and descriptions. The baseline is therefore a model with those rules, not a bare model. See the limits in [RESULTS.md](../RESULTS.md#limits-of-the-held-out-set).

A separate agent then grades each pair, labelled A and B in random order, pass or fail per behaviour, quoting the line that decides it, with the request's input files open to check facts. The grading prompt is the one in [evals/README.md](../README.md), plus: judge each answer on its own, and do not reward length or polish.
