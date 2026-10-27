# UX techniques

Read this when designing or reviewing a flow or a screen. Each technique comes with what it is for and how to apply it. Reach for the simplest one that solves the problem.

## Reduce what people have to do

- **Smart defaults.** Prefill whatever the system can know or safely guess, and let people change it. A good default removes a decision for most people and costs the rest one tap. Never default what the system cannot know (a payment method, a recipient, a consent).
- **Infer, don't ask.** Region from the device, name and email from the account, time zone from the system, a city from a postcode.
- **Progressive disclosure.** The common path first; advanced options one level deeper (a disclosure, a counted row, a later screen). Defaults good enough that most people never open the advanced level.
- **Defer.** Ask for anything not needed now later, at the moment it becomes useful (a profile photo when they first post, notifications when the first reply arrives).
- **Hick's law.** Fewer options, a recommended one first, the rest behind "More".
- **Tesler's law.** Move irreducible complexity into the system, not onto the person.

## Make the next step obvious

- **One primary action.** One prominent control per screen, always in the same place; everything else quieter.
- **Fitts's law.** The primary action large and near the hand or pointer; destructive actions away from it.
- **Recognition over recall.** Show options, recent items and suggestions instead of asking people to remember or type.
- **Jakob's law.** Use the platform's patterns (sign-in sheets, pickers, share sheets, settings layouts) so nothing needs learning.
- **Visible system status.** Every action gets an immediate response; every wait says what is happening.
- **Clear exits.** Every screen answers "how do I get out?" with Back, Close or Cancel in the platform's place.

## Chunk and sequence

- **Chunking.** Group related fields (name with email, street with city) and split unrelated ones. Three to five fields per step is a comfortable chunk on a phone; a larger screen may show a few more, never everything.
- **One question per screen for decisions, chunks for facts.** A choice that needs thought gets its own screen; facts people know by heart can share one.
- **Value first.** Let people try the core of the product before an account where possible (a guest mode, a demo document, a first result).
- **Goal gradient.** Quick, easy steps last when order is free; real progress, never fake.
- **Peak-end rule.** Make the first success feel good and end the flow somewhere alive: where the person started, or on what they made.

## Prevent errors, then forgive them

- **Constrain input.** The right keyboard (`inputmode`, content types), pickers for dates and lists, steppers for small numbers, autofill and one-time-code autofill.
- **Forgiving formats.** Accept phone numbers, card numbers and dates in any reasonable shape; format them for the person.
- **Inline validation.** Check a field when the person finishes it, not on every keystroke and not on submit. Say what to fix, beside the field.
- **Undo over confirmation.** Let people act and reverse it; confirm only what is destructive and irreversible.
- **Never lose input.** Back, close, a failed request and a lost connection all keep what was typed.

## Show only what is true

- **Honest empty states.** Say what will appear and how to start; never placeholder content that looks real.
- **Skeletons in the exact shape** of what arrives; spinners only for actions.
- **Honest waits.** The pressed control responds at once; no loading indicator below about 0.3 s, then a status word, a spinner after 1 s, reassurance at 3 s and 10 s; never a fake percentage.
- **Optimistic UI** where failure is rare and reversible: show the result at once, reconcile quietly, and say clearly if it failed.

## Accounts and permissions

- **Platform sign-in** (Sign in with Apple, passkeys, other providers the product supports); magic links or one-time codes over passwords where a password is not needed.
- **Pre-permission sentence.** One line on what the permission enables, just before the system prompt, at the moment of need.
- **Graceful refusal.** The product works without it, says what is missing, and links to the exact setting.
- **Handoff.** A code to scan or a link by email to continue on another device.

## On every device

- **Phone:** one column, one chunk, the action within thumb reach, the keyboard never hiding the action or the error.
- **iPad:** use the width for context (the list beside the detail), not for more fields per step.
- **Mac and the web:** keyboard first (Tab order, Return to continue, Escape to cancel), visible focus, a comfortable reading width; extra space becomes margin, not more content.
