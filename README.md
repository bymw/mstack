# Skills for Product Builders

Twenty-three Agent Skills that help Claude shape, design, build and ship excellent products, on iPhone, iPad, Mac and the web. They work as a team, hold every piece of work to Apple's restraint and Linear's discipline, and run in Claude Code and Codex.

**23 skills** · **4 stages** · **iPhone, iPad, Mac and the web** · **MIT**

[Who it's for](#who-its-for) · [The skills](#the-skills) · [Install](#install) · [Inside a skill](#inside-a-skill) · [Evaluations](#evaluations)

## Who it's for

People who want to build excellent things, whatever their title.

- **Product manager or leader**: `framing-problems`, `shaping-direction`, `defining-outcomes`, `sequencing-bets`, `writing-specs`
- **Design engineer**: `designing-visuals`, `designing-flows`, `designing-motion`, `writing-ux-copy`
- **Engineer**: `breaking-experiences`, `diagnosing-feel`, `unifying-patterns`, `writing-specs`
- **Founder or solo builder**: `crafting-products`, `optimizing-discoverability`, then whatever the work calls for

## The skills

Every skill does one job and hands the rest to a teammate. [`crafting-products`](crafting-products/SKILL.md) is the foundation: one quality bar, one vocabulary, and the map of who leads what.

### 1 · Shape

- **[`framing-problems`](framing-problems/SKILL.md)**  
  Turns raw material (an export, logs, a handover, people's accounts) into a problem statement anyone understands in one read, every number checked.
- **[`shaping-direction`](shaping-direction/SKILL.md)**  
  Turns a vague idea or feature request into a direction worth testing, weighed against all four risks, with the cheapest test to prove it wrong.
- **[`defining-outcomes`](defining-outcomes/SKILL.md)**  
  Defines success as a change in what people do: one metric, a countermetric and checkpoints, set before the work starts.
- **[`sequencing-bets`](sequencing-bets/SKILL.md)**  
  Orders more ideas than there is time for into Now, Next and Later, with a stop rule for each bet.
- **[`writing-specs`](writing-specs/SKILL.md)**  
  Writes the spec builders and agents work from: scope, every state, the data model and API, rollout and checks.

### 2 · Design

- **[`designing-visuals`](designing-visuals/SKILL.md)**  
  Gives a screen one focal point, a clear hierarchy and consistent spacing, and checks it rendered.
- **[`writing-ux-copy`](writing-ux-copy/SKILL.md)**  
  Writes interface words that get to the point without going vague.
- **[`designing-flows`](designing-flows/SKILL.md)**  
  Shapes multi-step flows so every step has one mission and one action, and nothing is lost.
- **[`designing-motion`](designing-motion/SKILL.md)**  
  Keeps transitions and loading smooth, well timed and calm, never rushed or flashy.
- **[`building-ai-features`](building-ai-features/SKILL.md)**  
  Makes AI features trustworthy: honest labels, nothing sent without a yes, and a quality bar before shipping.
- **[`decluttering-screens`](decluttering-screens/SKILL.md)**  
  Simplifies a crowded screen without removing anything people can do.
- **[`exploring-directions`](exploring-directions/SKILL.md)**  
  Shows two to four genuinely different directions in the real interface, and recommends one.

### 3 · Review

- **[`auditing-consistency`](auditing-consistency/SKILL.md)**  
  Finds every place the same job is done differently, and proposes one answer.
- **[`walking-personas`](walking-personas/SKILL.md)**  
  Walks a flow as a brand-new, light, heavy and messy user, on every device.
- **[`diagnosing-feel`](diagnosing-feel/SKILL.md)**  
  Turns "it doesn't feel right" into a measured cause, a fix and a guard.
- **[`breaking-experiences`](breaking-experiences/SKILL.md)**  
  Builds simulation controls, breaks the product on purpose, and keeps every break as a test.

### 4 · Decide and ship

- **[`getting-sign-off`](getting-sign-off/SKILL.md)**  
  Gets approval one change at a time, with today and the proposal side by side.
- **[`settling-decisions`](settling-decisions/SKILL.md)**  
  Settles open questions one at a time, each with real options and one recommendation.
- **[`unifying-patterns`](unifying-patterns/SKILL.md)**  
  Builds an agreed consolidation so the old version can never come back.
- **[`sorting-feedback`](sorting-feedback/SKILL.md)**  
  Sorts what people said into what to act on, grounded in the product.
- **[`writing-briefs`](writing-briefs/SKILL.md)**  
  Explains work to a leader or partner who isn't technical, recommendation first.
- **[`optimizing-discoverability`](optimizing-discoverability/SKILL.md)**  
  Makes a site easy to find, read and cite by search engines and AI assistants, checked against current official guidance.

## Install

**Claude Code, for all your projects:**

```bash
git clone https://github.com/bymw/skills.git ~/Github/skills
mkdir -p ~/.claude/skills
for d in ~/Github/skills/*/; do [ -f "$d/SKILL.md" ] && ln -s "$d" ~/.claude/skills/; done
```

**Codex:** run the same loop into `~/.agents/skills`. **One project:** copy the skill folders into its `.claude/skills/`. **Claude apps:** zip a skill folder and upload it in Claude's settings.

Each skill works on its own. A few use host features when they exist (a published review page, the question tool) and fall back to a local page or plain text when they don't. [`house-rules.md`](house-rules.md) is the short set of preferences I keep in `~/.claude/CLAUDE.md`; treat it as an example to adapt.

## Inside a skill

Every specialist skill has the same shape, so they read as one set. The foundation, `crafting-products`, holds the principles, shared terms, team map and screen check instead.

```
skill-name/
├── SKILL.md          name and description, then:
│                     two failure modes (the first is worse)
│                     rules, each with its reason
│                     method, step by step
│                     output format
│                     gotchas (instead of this, do that)
│                     works with (the teammates it hands to)
└── REFERENCE.md      optional detail, read only when the skill points to it
```

```
skills/
├── README.md
├── LICENSE
├── house-rules.md
├── evals/                  three scenarios and six trigger checks per skill
├── crafting-products/      SKILL.md, PLATFORMS.md, READING.md
├── framing-problems/       SKILL.md
├── shaping-direction/      SKILL.md
├── defining-outcomes/      SKILL.md
├── sequencing-bets/        SKILL.md
├── writing-specs/          SKILL.md
├── designing-visuals/      SKILL.md
├── writing-ux-copy/        SKILL.md
├── designing-flows/        SKILL.md, TECHNIQUES.md
├── designing-motion/       SKILL.md, DEFAULTS.md, ROLES.md
├── building-ai-features/   SKILL.md
├── decluttering-screens/   SKILL.md, MOVES.md
├── exploring-directions/   SKILL.md, AXES.md
├── auditing-consistency/   SKILL.md, JOBS.md
├── walking-personas/       SKILL.md, PERSONAS.md
├── diagnosing-feel/        SKILL.md, MEASURE.md, frames.swift
├── breaking-experiences/   SKILL.md, BREAKS.md
├── getting-sign-off/       SKILL.md, CAPTURE.md, review-page.html
├── settling-decisions/     SKILL.md
├── unifying-patterns/      SKILL.md, GUARDS.md
├── sorting-feedback/       SKILL.md
├── writing-briefs/         SKILL.md, SHAPES.md
└── optimizing-discoverability/  SKILL.md, SIGNALS.md, CRAWLERS.md
```

## Evaluations

Every skill has three test scenarios and at least six trigger checks in [`evals/`](evals/), in the structure Anthropic recommends: a realistic request, any input files, and the behaviours a good answer must show. Each scenario runs with the skill and without it, and the output is graded against those behaviours. The trigger checks confirm each description picks its own requests and leaves its neighbours' alone. See [evals/README.md](evals/README.md) to run them.

Each skill is tested against a no-skill baseline. The latest results, and how they were measured, are in [evals/RESULTS.md](evals/RESULTS.md).

## Credits

Written to [Anthropic's skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) and the open [Agent Skills specification](https://agentskills.io/specification). The product skills paraphrase the public work of Marty Cagan, Teresa Torres, Katie Dill, Robby Stein, Shreyas Doshi, Itamar Gilad and Ryan Singer; the motion work builds on [Emil Kowalski's skills](https://github.com/emilkowalski/skills) and Apple's [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines).

MIT licensed. Made by [Marcus Wiberg](https://www.marcuswiberg.com).
