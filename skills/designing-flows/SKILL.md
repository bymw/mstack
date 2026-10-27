---
name: designing-flows
description: "Shapes multi-step flows (sign-up, onboarding, permissions, setup, checkout, invites) so each step has one mission and one action, value comes before asks, and nothing is lost. Use whenever a flow, wizard, form or sequence of screens is designed, built or reviewed. Not for single-screen layout (designing-visuals)."
license: MIT
---

# Designing flows

People move through a flow to get somewhere else. They do not want to learn the product or make decisions they did not come to make. Flows that work feel like a short conversation: one question, one answer, the next, each step with a reason to exist that fits in one sentence and an answer that takes seconds. Flows that fail feel like a form: several things to do on one screen, choices nobody understands yet, permissions before value.

More is less. A step that does one thing is faster than half of a step that does two.

This skill covers the sequence of steps and what each one asks. The words on each step come from `writing-ux-copy`, each screen's structure from `designing-visuals`, and the transitions between steps from `designing-motion`. The techniques it draws on are in [TECHNIQUES.md](TECHNIQUES.md); read it when choosing how to remove, defer or chunk a question.

## Two failure modes, and the first is worse

1. **Asking before giving, or asking too much.** Sign-up, profile questions and permission prompts arrive before any value; a field asks for what the system could know; a permission has no reason, or a refusal breaks the product. People leave, or deny what they would have granted at the right moment.
2. **Crowding.** Two missions on one step to save a screen, several ideas in one picture, numbered step chips, helper text on every field, a choice that could have been a default. People slow down and miss the one thing that mattered.

## Rules

1. **Every step has one mission, written down:** what the person decides or does here, and why now. A step whose mission you cannot write goes; a step with two splits.
2. **One primary action per step,** in the same place on every step. Other choices are quiet (a text button or a row), never a second prominent button.
3. **Ask only what you cannot know, when it matters.** Default what the system knows, infer what it can (region, name from the account), defer what is not needed yet. Every question visibly changes the experience and can be changed later.
4. **Value before asks.** Show what the product does before asking for an account, a payment or a permission, as far as the product allows.
5. **Small, fast steps.** Each takes seconds. Chunk long input into a few related fields per step: never one giant form, and never one field per screen for things people know by heart.
6. **Forward is obvious, back is safe.** Continue lights up when the step is complete and waits; the flow never advances by itself. Back keeps what was entered. A closed flow resumes where it stopped.
7. **Prevent errors, then forgive them.** The right keyboard, pickers, formats accepted in any shape. Validate each field as it is finished, never on submit, and say what to fix beside the field.
8. **Progress only when it helps.** None for a short flow; a few named stages for a long one; never a dot per step or numbered chips.
9. **Sign-in is one way in:** the platform's own sign-in (Sign in with Apple, passkeys, plus the providers the product supports) on every device. Closing the sheet is not an error. Never ask for what the account already provides.
10. **Permissions at the moment of need,** one at a time, each with one sentence on what it enables. The product survives a refusal: it still works, says what is missing, and links to the exact system setting. A permission revoked later is flagged in the app where the person will see it, and permissions have their own section near the top of Settings.
11. **Every path ends cleanly, and nothing contradicts.** Every control leads somewhere; where two paths do the same thing, one goes; with nothing to accept there is no Accept button. A screen never says "Ready" while something is outstanding, and the person never repeats what the flow already did.
12. **Work and context survive** navigation, Back and a failed request. Save commits; Cancel discards only the current edit. A consequential action sits beside the facts it acts on.
13. **End somewhere alive:** where the person started, or on what they made, with the one next step. A first success is acknowledged once, quietly.
14. **Onboarding shows results and the whole value.** One use case per screen, done rather than read about, all key use cases shown and not only the first. The first screen makes the core value obvious at a glance. Onboarding is skippable and can be found again.

## The step card

Write one for every step before designing it. If a line is hard to fill, the step is not ready.

<example>
Step:      3 of sign-up
Mission:   Confirm the email belongs to them, so the account can be recovered.
Action:    Enter the 6-digit code.
Asks:      The code, autofilled from the message where the platform allows.
Defaults:  None.
Skippable: No. Resend after 30 s; change email as a quiet link.
Copy:      "Check your email" / "Enter the code we sent to you@example.com."
</example>

## Method

1. **Map the flow** from every entry point to the screen after the end, with what each step asks and gives, and every way out.
2. **Write a step card for every step,** not only the first few. Strike steps with no mission; split steps with two.
3. **Remove and reorder.** Cut every question the system can answer, move asks after value, move permissions and sign-in to the moment of need, merge two steps only when they ask parts of one decision.
4. **Design every branch:** new and returning; each permission granted, denied and revoked; validation errors; offline; closed and resumed; skipped; a second device; the smallest window and largest text size.
5. **Plan the transitions** between steps with `designing-motion`: forward and back move as one calm, consistent motion; Continue responds on the first frame; a step that waits on the network shows honest progress in place.
6. **Walk it** with `walking-personas` as "Nothing yet" on each target device, timing each step. Anything that takes more than a few seconds to understand goes back to step 2.
7. **Present** one `getting-sign-off` row per changed step, or `exploring-directions` for a new flow. Build only what is agreed.

## Output

**Headline:** one sentence, for example "Sign-up: 7 steps to 4, 3 questions defaulted, notifications moved to the first reply."

**The flow at a glance,** one line per step in order:

| Step | Mission | Action |
| --- | --- | --- |
| Check your email | Confirm the address, so the account can be recovered | Enter the code |

**Then each step,** in order: its screen (rendered where possible) or its card with the copy, and the branches it covers. **Open questions,** each with a recommendation, for `settling-decisions`.

**Before sending, check the flow against this list:**

- [ ] A step card for every step, the first and last included, with every field filled
- [ ] No permission, account or payment prompt before the step that needs it; each has its refusal path
- [ ] Branches designed: new and returning, each permission granted and refused, declined or expired, offline, closed and resumed, a second device
- [ ] On Mac and the web: keyboard first with visible focus, and extra width used as margin or context, not more fields
- [ ] The flow ends somewhere alive, with the result of the flow visible and one next step

## Gotchas

| Instead of | Do |
| --- | --- |
| A form with every field at once | A few related fields per step |
| One field per screen for name and email | Facts people know by heart together |
| Validation on submit | Inline, as each field is finished |
| Numbered step chips or a dot per step | Nothing, or a few named stages |
| A carousel that advances by itself | The person sets the pace |
| Every permission up front | Each at the moment of need, with one sentence why |
| Onboarding that explains a feature | The person does it and sees the result |
| Losing input on Back or close | Kept, and resumable |
| Ending on an empty screen | Where they started, or on what they made, with the next step |

## Works with

- `crafting-products`: principles 1 to 3 and 11, and the shared terms.
- `writing-ux-copy`: the words on each step, including permission copy. Run its check on every step.
- `designing-visuals`: the structure that makes each step's one action obvious.
- `designing-motion`: transitions between steps.
- `walking-personas`: the "Nothing yet" walk on every device.
- `decluttering-screens`: when an existing flow has grown too much.
- `building-ai-features`: when the flow introduces an AI feature.
- `writing-specs`: the flow at sketch level, which this skill designs step by step.
- Apple's Human Interface Guidelines: "Onboarding", "Accounts", "Entering data", "Privacy".
