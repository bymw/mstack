---
name: sequencing-bets
description: Orders more ideas than there is capacity for into Now, Next and Later against ranked problems, judged by opportunity cost, evidence and what unblocks learning, with a stop rule per bet and a Not doing list. Use when the user asks what to build first or next, plans a quarter or roadmap, or faces competing requests. Not for shaping one direction (shaping-direction).
license: MIT
---

# Sequence bets

There are always more good ideas than time. The question is not whether something is worth doing, since almost everything is, but whether it is the best use of the next stretch of time. A roadmap is a set of bets that grows less certain further out, not a list of dated promises.

This skill covers order and size. Shaping any one bet is `shaping-direction`; what each bet must achieve is `defining-outcomes`; the document for the bet at the top is `writing-specs`; the priority calls the user owns go to `settling-decisions`.

## Two failure modes, and the first is worse

1. **Filling the plate with quick wins.** Every item pays back, so the list fills with small, safe work. The large uncertain bet that would change the product never starts, and complexity grows until only small work is possible.
2. **A roadmap of dated promises.** Features with dates, far out, in detail. Scope bends to fit the date, items stay because they were promised, and nothing gets stopped.

## Rules

1. **Problems first, then items.** The strategy is a short ranked list of problems to solve, and for whom. If it does not exist, write it and get it agreed before ordering anything. Why: with an agreed list most ordering becomes obvious; without one, every request is a debate.
2. **Opportunity cost, not return.** Ask whether this is the best use of the time against the alternatives, not whether it pays back. Why: return per week favours quick small work and starves the bets that matter.
3. **Set the mix before ranking.** Decide roughly what share goes to improving what exists, to new bets, and to a small speculative slice, then rank within each. Why: a big uncertain bet loses every head-to-head comparison with a sure small one.
4. **Confidence comes from evidence.** Score each item by its strongest evidence, not by conviction (the grading in `shaping-direction`). A high-impact, low-confidence item gets a cheap test before it gets a slot. Why: confidence without evidence is opinion with a number on it.
5. **Size by appetite, not estimate.** For each bet, the most time it is worth; scope bends to fit, the time does not. Why: estimates grow, while an appetite forces the trade-offs early.
6. **Order by learning and the critical path.** First comes what unblocks the most: the answer that settles other questions, the piece others depend on, a working version in people's hands early. Why: the first real use says what to build next better than any plan.
7. **Further out, less detail.** Now is committed and specific, Next is likely and outlined, Later is direction only. Dates appear only where the world sets one. When someone asks for a date on every item, say in one sentence why that backfires, then still give Now, Next and Later; offer a date range for Now only if a date is truly required. Why: detail far out hardens into commitment, and commitment makes stopping hard.
8. **Every committed bet has a stop rule:** the signal and the checkpoint at which it ends or changes. Why: people stop too late, after the cost is sunk.
9. **Hand teams problems, not features.** Each bet names the problem and the outcome; finding the solution is the team's work. Why: a team handed features measures itself on shipping them.
10. **Say no out loud.** Keep a Not doing list with reasons, and answer requests with a trade-off ("this, if that waits") rather than a flat refusal. Why: a request that is neither done nor declined comes back every week.
11. **Finish before re-ranking.** Change the order when evidence changes, not every week, and follow each shipped bet to its result. Why: constant reordering means nothing finishes, and value lands in finishing.

## Method

1. **Collect** every candidate in one list with where it came from; merge duplicates; split anything too large to judge.
2. **Write or confirm the problems,** in rank order, and set the mix.
3. **For each candidate:** the problem it serves, the impact if it works, confidence with its evidence, and the appetite. Mark anything that serves no listed problem.
4. **Order** within each share by opportunity cost, then adjust for learning and dependencies.
5. **Cut to capacity.** Now holds what fits; everything else goes to Next, Later or Not doing, each with a reason.
6. **Add a stop rule** and a first checkpoint to each Now bet.
7. **Check that a big bet survived.** If Now holds only small items, say so and say what would change it.
8. **Ask** the priority calls that belong to the user with `settling-decisions`.

## Output

**Structure, not length.** The first screen (the headline, the recommendation and one table) carries the whole answer, so someone who stops there can act. After that, say everything the decision needs and nothing it does not: cut restated context, method, rejected options in detail and repeated caveats. Give each kind of content its own form so the eye can scan it (see `crafting-products`, Working with the user). List only the unknowns that could change the recommendation, at most five. Open calls get one line each here and are asked afterwards with `settling-decisions`, not written up as a section.

**Headline:** the one bet that matters most now, and why, in one sentence.

**Problems, in order:** a numbered list.

**Now**

| Bet | Problem it serves | Appetite | Stop if |
| --- | --- | --- | --- |

**Next:** bet · what it waits for.
**Later:** direction only.
**Not doing:** item · reason.
**Mix:** improving what exists, new bets, speculative, as rough shares.

## Gotchas

| Instead of | Do |
| --- | --- |
| Every piece of thinking written out, or a long run of bullets | The answer on one screen, then each kind of content in its own form |
| Scoring every item for return | Asking what it displaces |
| A list of features with dates | Now, Next and Later; dates only where the world sets them |
| A big bet ranked against small ones | A set share for new bets first |
| Confidence from how sure someone feels | Confidence from the strongest evidence |
| Estimates that keep growing | An appetite; scope bends, time does not |
| Adding every request to the list | Not doing, with the reason and the trade-off |
| Reordering every week | Reordering when evidence changes |
| A bet with no end condition | A stop rule and a checkpoint |

## Works with

- `crafting-products`: the bar every bet ships to.
- `shaping-direction`: shapes a bet before it gets a slot.
- `defining-outcomes`: what each bet must achieve.
- `writing-specs`: the document for what is in Now.
- `sorting-feedback`: requests from feedback arrive here as candidates.
- `settling-decisions`: the priority calls the user owns.
- `writing-briefs`: the order explained to leaders.
- Outside the set: Shreyas Doshi (opportunity cost over return), Marty Cagan (strategy as a ranked list of problems; teams given problems, not features), Ryan Singer (appetite and the circuit breaker), Janna Bastow (Now, Next, Later), Itamar Gilad (confidence from evidence), Annie Duke (stop rules written in advance).
