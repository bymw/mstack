---
name: crafting-products
description: Sets the shared quality bar, vocabulary and team map for product work on iPhone, iPad, Mac and the web, held to Apple's restraint and Linear's discipline. Use before designing, reviewing, building or writing about any product, screen, flow or feature, and when the user asks for world-class work or says something feels off. Points to the specialist skill for each part.
license: MIT
---

# Crafting products

The bar every other skill in this set works to, the words they share, and how they work together. Read it first for any interface work; then load the specialist skill for the part in front of you. When the question is what to build at all, the Shape skills come first: a well-crafted answer to the wrong problem still fails.

**The bar:** a person understands the screen in three seconds and knows the one thing to do next. It looks, reads and moves like a native product made by a serious company. Every job is done the same way wherever it appears, on every device. Every detail, down to a point of spacing or a frame of motion, is deliberate.

**The feeling:** calm, instant, precise, trustworthy. People come to get something done, not to read or explore. Simplicity is the ultimate sophistication; premium means edited.

**A point of view, not the most probable answer.** Templates and AI default to what is popular: generic, interchangeable "zombie UI" nobody cared about. Every piece of work starts from this product's own people, brand and point of view, and aims one level deeper than the person can see. When the product has no written point of view, draft three or four principles, each a trade-off with a believable opposite ("start simple; complexity is opted into", not "be simple"), get the user's yes, and cite them in every decision and review. Craft has two halves: it works with no friction, and it creates a feeling.

A project's own operating contract (CLAUDE.md, DESIGN.md, a design system, a decisions log) wins over this skill. Read it first and cite its values.

## Two failure modes, and the first is worse

1. **Plausible and wrong.** A screen, figure, default, claim or behaviour that looks right but that the data, the spec or the system does not support: history the data does not hold, a preselected option the system cannot know, a privacy claim broader than the truth, an AI action that does less than its label. It ships confidence nobody earned and costs trust.
2. **Correct and unconsidered.** True, but cluttered, inconsistent, crowded, flat, rushed or jumpy. Recoverable, but it reads as low fidelity, and reviewers stop trusting the rest.

## The principles

Each principle names the skill that owns the detail.

1. **One screen, one job, one primary action.** More screens beat a crowded one. Every step of a flow has one mission you can say in one sentence. (`designing-flows`)
2. **Progressive disclosure.** The common path first; detail and advanced options one level deeper. Defaults good enough that most people never open Settings. Remove before you add. (`designing-flows`, `decluttering-screens`)
3. **Simple without losing anything.** Simplify by defaulting, shortening and merging, never by removing a capability, a needed decision or the next step; that gets reversed, usually the same day. (`decluttering-screens`)
4. **Structure, not decoration.** One focal point, three levels of importance at most, space before lines and boxes, contrast spent where it matters. Beautiful because it is structured. Restraint is not austerity: rare moments (empty, first run, success) carry warmth and a head start, and a bare screen fails the bar like a cluttered one. (`designing-visuals`)
5. **Words are interface.** The fewest words that stay true: to the point, never vague, never cluttered, written for this screen. (`writing-ux-copy`)
6. **Motion has a job, and it is smooth.** It explains a change, follows the hand or confirms input. Every transition is well timed, seamless and calm: never rushed, hectic or flashy, and nothing moves at rest. (`designing-motion`)
7. **One job, one answer.** A second way of doing the same job is a bug. The same task keeps the same name, meaning and outcome on every device, and a change to a shared feature ships on every device in the same change. (`auditing-consistency`, `unifying-patterns`)
8. **Native to each device.** iPhone, iPad, Mac and the web each get a layout designed for them on one shared system; a tablet is not a big phone. Conventions per platform are in [PLATFORMS.md](PLATFORMS.md); read it when designing for a specific device.
9. **Truth before polish.** Draw only what the data supports, in words as well as screens: no illustrative figure ("20 minutes on Sunday", "1 in 5") that the source did not give; never preselect what the system cannot know; ask where the spec is silent. Empty states say what will appear and how to start. Claims name their scope. (`building-ai-features` for AI features)
10. **Nothing jumps.** Controls keep their width when labels change, space for results is reserved, placeholders match what arrives, and nothing on a page changes by itself.
11. **Every state is designed.** First run, empty, loading, partial, error, offline, permission denied, a setting off at system level, light and dark, the smallest and largest size. Waits are honest, never a fake percentage. (`walking-personas`)
12. **Measured and proven on the device.** Put a number behind taste arguments (spacing, contrast, frame timing, counts). Judge feel on the real device or simulator at scale 1, including the oldest supported hardware. (`diagnosing-feel`) When a device, simulator or renderer is not available, say exactly what was not verified rather than claim it.
13. **Every fix leaves a guard, and every standard lives in the system.** A rule (type, lint, audit or test) seen failing on the old code, and the decision written as "X, not Y, because Z". Standards are encoded where people and agents build (tokens, components, templates, written rules), so the system scales intent, not just consistency. (`unifying-patterns`)

## Terms used across the set

| Term | Meaning |
| --- | --- |
| the user | The person asking Claude for the work. |
| person, people | Whoever uses the product being designed. |
| screen | One view on any device: a page, sheet, window or dialog. |
| flow, step | A sequence of screens toward one goal; one screen in it. |
| mission | The one thing a screen or step exists for, in one sentence. |
| primary action | The single most prominent control on a screen. |
| focal point | Where the eye lands first. |
| state | A condition a screen can be in: empty, loading, error, full, off. |
| job | What a person is doing ("leave a flow", "enter a value"), named independently of the component. |
| canonical | The one agreed answer to a job, kept in the shared kit. |
| role | A named kind of motion ("push", "present", "press"), with its tokens. |
| row | One proposed change on a sign-off page. |
| severity | High: data lost, wrong, leaked, stuck or untrue; Medium: confusing or slow; Low: cosmetic. |
| direction | One of two to four genuinely different answers to a design problem. |
| devices | iPhone, iPad, Mac and the web. "Every device" means all of them that the product targets. |
| outcome | A change in what people do, measured, as opposed to an output that ships. |
| bet | Work committed to on incomplete evidence, with a size and a stop rule. |
| appetite | The most time a piece of work is worth, set before the solution; scope bends to fit it. |
| four risks | Value (will they choose it), usability (can they use it), feasibility (can it be built), viability (does it work for the business: legal, privacy, security, safety, cost, sales, support, partners). |

## How the skills work together

Each skill does one job deeply and hands the rest on. Common plays:

| The work | Lead | Then |
| --- | --- | --- |
| Decide what to build, or whether an idea is worth it | `shaping-direction` | `defining-outcomes`, `exploring-directions`, `settling-decisions` |
| Set goals or say how success is measured | `defining-outcomes` | `settling-decisions` |
| Order more ideas than there is time for | `sequencing-bets` | `settling-decisions`, `writing-briefs` |
| Write a spec, PRD or plan for builders or agents | `writing-specs` | `designing-flows`, `walking-personas` |
| Build or change a screen | `designing-visuals` | `writing-ux-copy` for the words, `designing-motion` for transitions, `walking-personas` for states |
| Design a multi-step flow (sign-up, onboarding, setup, checkout) | `designing-flows` | `writing-ux-copy`, `designing-visuals`, `walking-personas` |
| Explore an idea with no obvious answer | `exploring-directions` | `settling-decisions`, then `getting-sign-off` |
| Get sign-off on proposed changes | `getting-sign-off` | `settling-decisions` for open rows, then build |
| Something feels off (lag, jump, flash, rushed) | `diagnosing-feel` | `designing-motion` |
| Plan or review motion | `designing-motion` | `diagnosing-feel` to prove it |
| Find and fix inconsistency | `auditing-consistency` | `getting-sign-off`, `settling-decisions`, `unifying-patterns` |
| Simplify a feature | `decluttering-screens` | `getting-sign-off`, then build |
| Design or ship an AI feature | `building-ai-features` | `writing-ux-copy`, `designing-flows` |
| Break a feature on purpose, find edge cases, build a simulator | `breaking-experiences` | `walking-personas`, then the skill that owns each fix |
| Turn feedback into actions | `sorting-feedback` | `settling-decisions`, `getting-sign-off` |
| Explain work to a non-technical reader | `writing-briefs` | |

When reviewing, tag each finding with the skill that owns its fix, and leave the detailed redesign to that skill unless the user asked for it here. For every screen built or changed in this task, run `designing-visuals`' check and `writing-ux-copy`'s check before calling it done, and `designing-motion`'s checklist on anything that moves, when those skills are installed.

## Working with the user

- **Visual first.** Show real screens, not descriptions. Say whether each image is today or a proposal.
- **Concept before code.** When the answer is not obvious, iterate on a high-fidelity canvas built from the product's real components until the user approves, then build. Match fidelity to the question: a question about structure or order can be settled in rough blocks first, so feedback is not pulled toward colour and detail.
- **Start from the user's thinking.** On direction, strategy and priority, when the user has a view, build on it and challenge it with evidence rather than replacing it with a generated answer.
- **Change only what was asked.** Read feedback literally; propose anything bigger as a separate option and wait for a yes.
- **Answer first.** Recommendation or result in the first line, then the example, then stop. Commit to a position; state an assumption once.
- **Structure text for the eye; it is a screen too.** Information architecture matters more than length. Open with a one-line headline and the answer or summary, then sections in the order the reader needs them. Give each kind of content the form that reads fastest:

  | Content | Form |
  | --- | --- |
  | Options, comparisons, metrics, plans over time | A table of four columns or fewer |
  | A data model, API, schema, event list or command | A code block |
  | A sequence or procedure | Numbered steps |
  | Reasoning or a recommendation | Two or three short sentences |
  | Findings | Grouped under High, Medium and Low headings |

  Say what the work needs, technical detail included, and nothing more: no restated context, no padding, no long runs of bullets or walls of prose. Complete detail comes after the main points, never in the first table. The research behind this, and the rules that follow from it, are in [READING.md](READING.md); read it before writing any document or long answer.
- **One question at a time,** with real options and one recommendation (`settling-decisions`). Never settle a product question silently.
- **Push back with evidence,** in one sentence plus the concrete fix. Never inflate a claim or invent a number.
- **Edit after building; done is not the same as good.** Before handing anything over, use it end to end like the person would, check it solves the problem and hangs together, and push it to complete. When a result is only acceptable, say what would make it world-class.

## The screen check

Run this on every screen before calling it done, not only the first one.

| Instead of | Do |
| --- | --- |
| A mock drawn to look like the product | Capture the product or render its real components |
| Two prominent actions on one screen | One primary action; the rest quieter or on the next step |
| Everything visible at once | The common path first, detail one level deeper |
| A second way to do a job that already has one | The canonical answer, changed everywhere if it is wrong |
| A figure, default or claim the data cannot back | What is known, with the gap flagged |
| Layout that shifts as content or labels change | Reserved space and fixed widths |
| A phone layout stretched onto iPad, Mac or the web | A layout designed for each device |
| Hover as the only way to an action, or no press state on touch | A visible affordance, press on pointer-down, keyboard access |
| A hard cut, a flash or a rushed transition | A calm, well-timed transition from `designing-motion` |
| Colour as decoration | Neutral surfaces, one accent, colour for state |
| A happy path only | Every state designed, every wait honest |
| A fix with nothing to catch its return | The fix plus a rule seen failing on the old code |

## Works with

Every skill in the set treats this one as its foundation. Outside the set: Katie Dill's call to avoid "zombie UI" (have a point of view, encode standards in the system, refuse to confuse done with good); Apple's Human Interface Guidelines and WWDC design talks ("Designing Fluid Interfaces", "The Details of UI Typography") for platforms; Emil Kowalski's skills (`npx skills add emilkowalski/skills`) for motion and design-engineering craft.
