---
name: defining-outcomes
description: Defines what success means before the work starts: the change in what people do, one primary metric with baseline, target and date, a leading signal, countermetrics, and go or no-go points. Use when the user asks how to measure success, sets goals, OKRs or a north star, or asks whether a launch worked. Not for testing whether an idea is right (shaping-direction).
license: MIT
---

# Define outcome

Shipping is not success; a change in what people do is. A goal of "launch the feature" is met the day it ships whether or not anything improved, and a goal of "people use the feature" teaches the product to the test. This skill writes down, before the work, what would have to be true afterwards for it to count, and how we would know.

This skill covers success and how it is measured. Whether the idea is right in the first place is `shaping-direction`; the order of bets is `sequencing-bets`; the quality bar for AI output is `building-ai-features`.

## Two failure modes, and the first is worse

1. **A number that rises while the product gets worse.** Feature usage, sign-ups or time in the app, or support contacts that fall because help got harder to find. The team hits the goal, people are worse off, and nobody notices because the chart is green.
2. **No number, or ten.** "Improve engagement", key results that are really tasks, a dashboard nobody owns. Nothing is ever clearly a win or a loss, so nothing is ever stopped.

## Rules

1. **An outcome is a change in behaviour, not an output.** "More people finish setup on their first day", not "ship the new setup". Why: output is under our control and proves nothing; behaviour is the evidence of value.
2. **One step from a goal the business already tracks,** in units it recognises, with one line on how the outcome moves it. Why: a team goal several steps removed can be met while the company misses.
3. **Measure from the person's side.** Prefer "share who got it done without needing help" to "taps on the button". Count bad moments as well as good: errors, abandoned attempts, repeat tries. Why: value is what the person got, not what we counted.
4. **One primary metric, paired with what the business captures.** One number the team moves, alongside the revenue, cost or retention it should lead to. Why: with several primaries any result can be called a win, and value delivered without value captured does not last.
5. **Every metric has a countermetric** with a limit: what could get worse if the primary is pushed alone (quality, trust, support load, revenue, opt-outs). Why: a metric optimised alone gets gamed, usually without anyone meaning to.
6. **A leading signal earns its place by predicting the outcome.** An early signal (first success, activation) counts only if people who reach it go on to stay or pay; check that, and prefer a demanding signal to an easy one. Why: an easy early metric rises while retention does not.
7. **Baseline, target, date and estimate, written before.** Today's value or "unknown, measure first", the target, by when, and the effect we expect. Why: a target set after the results always looks met, and the gap between estimate and result is how judgment improves.
8. **Go or no-go points with actions.** At each checkpoint, the result that means continue, change or stop. Why: without a stop written in advance, work that is not working runs on for quarters.
9. **Size the evidence to the traffic.** An A/B test needs large numbers; below that, use qualitative evidence and directional measures, and say which one it is. Why: an underpowered test reports noise as a result.
10. **Instrument first.** The events and segments needed to read the outcome ship with the feature, or before it. Why: a launch without logging cannot be diagnosed, only argued about.
11. **Never invent a baseline or a benchmark.** Unknowns stay "unknown, measure first" or "to confirm". Why: a made-up number becomes the target someone repeats.

## Method

1. **Name the change:** who does what differently, and when, if this works.
2. **Link it up:** the business goal it moves, and how, in one line.
3. **Choose the primary metric** from the person's side and define it exactly: who counts, what counts, over what window.
4. **Pair it** with the value-captured metric, then add one or two countermetrics with their limits.
5. **Pick the leading signal** and say how it was, or will be, shown to predict the outcome.
6. **Set baseline, target and date,** with the expected effect and the evidence behind the estimate.
7. **Set checkpoints:** when results are read, and the continue, change or stop rule at each.
8. **List the instrumentation** the metrics need, and what is missing today.
9. **For something already shipped,** read the result against what was written. If nothing was written, say so plainly, then set it for the next checkpoint.

## Output

**Structure, not length.** The first screen (the headline, the recommendation and one table) carries the whole answer, so someone who stops there can act. After that, say everything the decision needs and nothing it does not: cut restated context, method, rejected options in detail and repeated caveats. Give each kind of content its own form so the eye can scan it (see `crafting-products`, Working with the user). List only the unknowns that could change the recommendation, at most five. Open calls get one line each here and are asked afterwards with `settling-decisions`, not written up as a section.

**Outcome:** one sentence: who does what differently, by when.
**Why it matters:** the business goal it moves, in one line.

| Metric | Exact definition | Baseline to target | By |
| --- | --- | --- | --- |
| Primary | | | |
| Value captured | | | |
| Leading signal | | | |
| Countermetric | | limit | |

**Checkpoints:** date, what is read, continue · change · stop.
**Instrumentation:** what to log, and what is missing.
**Unknowns:** baselines to measure first.

## Gotchas

| Instead of | Do |
| --- | --- |
| Every piece of thinking written out, or a long run of bullets | The answer on one screen, then each kind of content in its own form |
| "Launch X" as the goal | The behaviour X should change |
| Feature usage as success | What the person achieved because of it |
| Five primary metrics | One primary, one value-captured, and countermetrics |
| A metric with nothing to catch gaming | A named countermetric with a limit |
| An easy activation metric | A demanding one that predicts retention |
| A target set after the results | Baseline, target and estimate written first |
| Key results that are tasks | Results that measure change; tasks go in the plan |
| An A/B test on a few hundred people | Qualitative and directional evidence, labelled as such |
| A guessed baseline | "Unknown, measure first" |

## Works with

- `crafting-products`: truth before polish, applied to numbers.
- `shaping-direction`: the direction and its test-level pass marks; this skill sets the outcome the direction serves.
- `sequencing-bets`: outcomes give the order something to be measured against.
- `writing-specs`: the success section of the document.
- `building-ai-features`: pass marks for AI behaviour.
- `settling-decisions`: targets and trade-offs the user owns.
- Outside the set: Marty Cagan (outcomes over output), Matt LeMay (one step from a company goal), Itamar Gilad (value delivered and value captured), Ronny Kohavi (countervailing metrics and trustworthy experiments), Christina Wodtke (key results that measure change), Jeff Weinstein (value measured from the customer's side), Lauryn Isford (activation that predicts retention).
