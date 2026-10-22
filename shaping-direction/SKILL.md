---
name: shaping-direction
description: Turns a vague opportunity, feature request or stalled initiative into a direction worth testing: the person and their moment, graded evidence, two or three approaches, the four risks with a viability check, and the cheapest test with its pass mark. Use when the user asks what to build, which approach to pick, whether an idea is worth it, or why something stalled. Not for metrics (defining-outcomes) or specs (writing-specs).
license: MIT
---

# Shaping direction

Most products that fail confirmed a real problem and then shipped an answer nobody switched to. Confirming the problem is quick; the work is finding an approach that is clearly better than what people do today, and learning cheaply whether it is before committing to it. This skill reduces uncertainty before it increases commitment.

This skill covers the direction: who, which moment, which approach, and what would prove it wrong. What success means in numbers is `defining-outcomes`; the order of several bets is `sequencing-bets`; the document builders work from is `writing-specs`; approaches are drawn in the real interface with `exploring-directions`.

## Two failure modes, and the first is worse

1. **Committing to an unexamined answer.** A feature request built as asked, one solution never compared with another, research run after the decision "to validate" it. The team ships something that works, solves the wrong thing, and then defends it because it works.
2. **Endless framing.** Problem discovery that never ends, a wall of unranked assumptions, a test that costs more than building. The direction stalls while confidence never moves.

## Rules

1. **Start from a person in a moment, not a feature.** Name who struggles, when, and what they do today instead. A request is a clue to the job behind it: reframe it when the evidence supports that, keep it when it does not. Where several moments compete, list three to five as needs (not solutions) and pick one with its reason. Why: the same request can come from several jobs, and each needs a different answer.
2. **Ask why people leave or never start.** Those who tried and gave up, and those who never began, hold the strongest evidence. Ask "why not?", find the theme, size it, fix the largest, repeat. Why: current users describe the product they have; non-users describe the one that is missing.
3. **Grade evidence by strength.** What people did beats what they say they would do; a working test beats an interview; opinion, "a competitor has it" and a strategy theme count for almost nothing. Mark every claim as fact, inference or unknown. Why: weak evidence stated with confidence is how plausible and wrong gets built.
4. **Keep the problem framing short:** hours or days, enough to name the person, the moment and the stakes. Spend the time on approaches. Why: products rarely fail because the problem was unclear; they fail on the solution.
5. **Compare two or three genuinely different approaches,** each saying what it bets on, then pick a first choice and a named backup. Why: with one option there is no decision, only momentum.
6. **Beat what people do now, not just the problem.** Say why someone would switch from today's way, including doing nothing, and what anxiety or habit holds them back. Why: an answer that is only somewhat better loses to habit.
7. **Weigh all four risks, and make viability concrete.** Value: will they choose it, and how many people have this moment. Usability: can they use it, checked on a prototype before anything is built, with five or so people who have the moment and a task-success pass mark written first (Method, step 7). Feasibility: can it be built in the time, including third parties and the cost to serve at scale. Viability: does it work for every part of the business, through the viability check below. Why: viability is the risk most often left unexamined, and it kills good ideas late.
8. **Test the riskiest assumption with the cheapest test that can answer it.** Rank by consequence if wrong and by uncertainty, never by ease. Climb only as high as needed: data you already have, conversations about past behaviour, a prototype or a fake door, a service run by hand, then a build. Why: most ideas fail, and finding out on paper costs least.
9. **Write the pass mark and its action before the test, and let the test fail clearly.** For each signal, the result that means continue, change course or stop; where `defining-outcomes` has set a checkpoint, the stop cites it. Why: research that can only confirm is performance, and without a commitment written first, any result reads as encouragement.
10. **Propose an appetite:** how much time the direction is worth. For a single direction it stands; when bets compete, it is a proposal for `sequencing-bets`, which sets the appetite for each. When it runs out, cut scope or stop; never extend it quietly. Why: the size of a bet should be a decision, not an outcome.
11. **A point of view, not the category average.** The direction comes from this product's people and what it believes, not the most common answer in the market. Why: an interchangeable product gives nobody a reason to switch.

## The viability check

Every row ends as **Answered** (with the evidence), **Consult** (talk to that owner one-on-one before committing) or **Not relevant** (with the reason). Consult owners one at a time; a room of every stakeholder turns into design by committee.

| Area | The question | Owner to consult |
| --- | --- | --- |
| Legal and regulatory | May we offer this, here, to these people? | Legal counsel |
| Privacy and data | What does it collect, keep or share, and would people expect that? | Privacy or data owner |
| Security | What new way in does it open? | Security |
| Safety and ethics | Who could be harmed, misled or left out, including by a wrong AI answer? | Trust and safety |
| Cost and pricing | What does it cost to serve at scale, and how is it paid for? | Finance |
| Sales and marketing | Can it be explained, positioned and sold, and does it fit the brand? | Sales and marketing leads |
| Support and operations | Who helps when it goes wrong, and are they ready? | Support and operations leads |
| Partners and contracts | Does it depend on, or break, a partner or a contract? | Partnerships |

## Method

0. **Size the shaping.** A small, reversible change in a familiar pattern needs none: say so in one line and hand it on. Core features, differentiators and anything hard to undo get the full method.
1. **Frame** in one paragraph: the person, the moment, what they do today, what it costs them, and why it matters to the business now. For a stalled initiative, first ask whether the block is execution or a missing decision about strategy; a fix that keeps falling off points to the second.
2. **Sort the evidence:** what we know (with its source and strength), what we infer, what we do not know. Never invent a figure, a quote or a customer.
3. **Draft two or three approaches** that differ in what they bet on, not in detail, each with one line on why someone would switch to it.
4. **Write the hypothesis** in one sentence: "If we [approach] for [person] when [moment], they will choose it over [what they do now] because [the difference]."
5. **Run a pre-mortem:** it is six months later and this failed. List the real threats, the feared ones that are not real, and what nobody is saying. Turn the real threats into assumptions.
6. **Rank the assumptions** by consequence and uncertainty, considering every one of the four risks; keep the top three, and say in one line why any risk without a row is low here. Run the viability check and carry every Consult row into the output.
7. **Choose the test** for the riskiest one: the cheapest rung that answers it, who it reaches, how long it runs, the pass mark, and the action for each result. A usability test is three to five realistic tasks, five or so people who have the moment and a task-success pass mark written first; observe without helping, then sort the notes with `sorting-feedback`.
8. **Recommend** the first choice, the backup, the appetite (a proposal for `sequencing-bets` when bets compete), and the next decision with who owns it. Open choices the user owns go to `settling-decisions`.

## Output

Structure the answer as `crafting-products` describes: the first screen carries the whole answer, then each kind of content in its own form. List at most five unknowns, only those that could change the recommendation. Open calls get one line each and are asked afterwards with `settling-decisions`.

**Direction:** the hypothesis, in one sentence.

**The person and the moment:** two or three sentences, with the evidence behind them.

| Approach | What it bets on | Why someone would switch | How it reaches people |
| --- | --- | --- | --- |

Mark the first choice "(Recommended)" and name the backup.

| Riskiest assumption | Risk | If wrong | Evidence today |
| --- | --- | --- | --- |

**Viability:** each Consult row, with its owner and the question to ask them.
**Test:** what, who, how long, pass mark, then continue · change · stop.
**Appetite and next decision:** how much time, what happens when it runs out (cut scope or stop), what gets decided next, who owns it.
**Unknowns:** the facts we do not have, marked "to confirm".

## Gotchas

| Instead of | Do |
| --- | --- |
| Every piece of thinking written out, or a long run of bullets | The answer on one screen, then each kind of content in its own form |
| Building the requested feature as asked | The job behind it, then judge whether the request is the answer |
| One solution, defended | Two or three, a first choice and a backup |
| "People said they would use it" | What they did; ask about the last time, not the next |
| Asking current users only | Those who left and those who never started |
| Research after the decision, "to validate" | A test that can fail clearly, while it can still change the decision |
| Reading the signals after the results | Pass marks and actions written first |
| Weeks of problem framing | A short framing; the time goes on approaches |
| Value only | Every row of the viability check, each answered, consulted or ruled out |
| A test that costs as much as building | The cheapest rung that can answer the question |

## Works with

- `crafting-products`: truth before polish, and a point of view rather than the most probable answer.
- `defining-outcomes`: what success means once a direction is chosen.
- `sequencing-bets`: when several directions or initiatives compete for time.
- `writing-specs`: the document for the chosen direction.
- `exploring-directions`: the approaches drawn in the real interface.
- `settling-decisions`: the choices the user owns.
- `writing-briefs`: the direction explained to leaders.
- `sorting-feedback`: the notes from a usability test.
- Outside the set: Marty Cagan (the four risks and the widened viability; confirming the problem is quick and the solution is the work; why people leave or never start), Teresa Torres (continuous discovery and assumption tests), Bob Moesta (jobs to be done and the forces behind switching), Robby Stein (interviews about real moments, and the diagnosis loop), Itamar Gilad (confidence graded by evidence), Shreyas Doshi and Annie Duke (pre-mortems that end in commitments), Ryan Singer (appetite).
