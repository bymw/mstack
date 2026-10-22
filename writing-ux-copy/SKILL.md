---
name: writing-ux-copy
description: Writes and reviews every word in an interface (titles, buttons, labels, errors, empty states, onboarding, permissions, notifications, AI actions) so it is short, precise and consistent. Use whenever interface text is written or changed, even if copy was not mentioned, or the user says copy is too long, vague or unclear. Not for briefs or replies to people (writing-briefs).
license: MIT
---

# Writing UX copy

People do not open a product to read. They come to get one thing done and move on, so every word either helps them do that or slows them down. The copy gets to the point, says exactly what it means, and stops: the fewest words that stay complete and true.

This skill covers the words on screen. The structure of a flow comes from `designing-flows`, the layout around the words from `designing-visuals`.

## Two failure modes, and the first is worse

1. **Unclear, untrue or borrowed.** A label a first-time user cannot decode, a claim broader than the truth, an invented error cause, a past tense before the thing is confirmed, "turn it on in Settings" without saying where, or words lifted from a reference screenshot that belong to another product. It costs trust, and trust is the product.
2. **Cluttered.** Too many words or the same thing twice: a description restating its title, a slogan where an instruction belongs, intensifiers, a paragraph where a sentence would do. People stop reading, and the one line that mattered is lost.

## Rules

1. **Start from the screen's mission.** State in one sentence what the screen is for and the one thing the person does next. Every string serves that mission, or it goes.
2. **Write for this screen; never lift words from a reference.** A screenshot or competitor screen shows structure, density and tone. Its words were written for another product and another job, so write fresh copy from this screen's mission in this product's glossary.
3. **Every string means, reports or directs:** what something is, what happened, or what to do next.
4. **Title and description do different jobs.** The title names the task or outcome, starting with a verb for actions ("Create a project", not "Welcome to Projects"). The description adds only what the title cannot carry. Most screens need no description.
5. **Shorter, never vaguer.** Cut repetition, filler, reassurance and hedges, then anything the interface already shows; stop when the next cut would lose meaning. When plain and short conflict, plain wins. If a title still does not fit, change the layout, not the meaning or the type size.
6. **The same words on every device,** written for the smallest screen first: the title fits one line at the smallest width, the description two at most. A larger screen gets more space around the words, not more words.
7. **One name per thing,** in the entry point, title, buttons, settings and help, from one glossary. Keys and controls are named the way the device prints them.
8. **Say what the thing is, and only what is known.** Describe what happens, not a category ("Find duplicate files and remove them", not "Smart cleanup"). Errors name the cause when it is known. Tense matches the state ("Saving…", then "Saved"). Privacy and accuracy claims name their scope.
9. **Calm, assured, precise.** Natural, with contractions. Report results; no praise, slogans, blame, coaching, exclamation marks or cleverness. No intensifiers ("really", "very", "simply", "just"), no formulas ("not X, but Y", a reflexive list of three), no internal jargon. Guide in one line and trust people's intelligence.
10. **Plain, international English.** One idea per sentence, active voice, everyday words a non-native reader knows, the product's chosen spelling throughout. No em dashes; use a full stop, comma, colon or parentheses.
11. **Example content is a real use case.** Sample text and demo data are moments the audience recognises from their own day. Use widely spoken languages and plausible situations, and never invent people or conversations just to fill a picture.

## Calibration: too long, too vague, right

| Element | Too long | Too vague | Right |
| --- | --- | --- | --- |
| Sign-up title | "Welcome! Let's get your account set up so you can start" | "Get started" | "Create your account" |
| Description under it | "It only takes a minute and you can change everything later in Settings." | "Quick and easy." | Nothing; the title and fields say it. |
| Permission | "We'd love to send you notifications so you never miss anything important that happens." | "Allow notifications?" | "Get a notification when someone replies." |
| Empty state | "You don't have any projects yet. Projects help you organise your work. Create one to get started!" | "Nothing here" | "No projects yet" / "Create one to keep related files together." |
| Error | "Oops! Something went wrong while we tried to save your changes. Please try again later." | "Error" | "Couldn't save. Check your connection and try again." |
| Button | "Continue to the next step" | "Next" (when the next step matters) | "Continue", or the result: "Send Code" |
| Setting | "Enabling this option will allow the app to automatically back up your data on a regular basis." | "Auto backup" | "Back up automatically" / "Every night, over Wi-Fi." |
| Success | "Great job! Your file has been uploaded successfully!" | "Done" | "Uploaded" |

What the right column shares: it names the thing, says the outcome, and stops.

## Length and form

| Element | Form |
| --- | --- |
| Button | 1 to 3 words in Title Case, naming what pressing it does now ("Save", "Send Invite", "Turn On"), never a state ("Start", then "Done" while it runs, never "Listening"). An ellipsis only when more input is needed first. No arrows. |
| Title | 2 to 6 words, no full stop, one line at the smallest width. |
| Description | One short sentence, or nothing. |
| Field label | The noun ("Email"), always visible; a placeholder is never the only label. |
| Helper text | Only for a rule the person would otherwise break, shown before they break it. |
| Error | What failed, then how to recover, in 1 to 2 sentences, beside the field or action. |
| Empty state | A title plus one sentence: what will appear and how to start, then the primary action and a quiet head start (a template, an example, an import). |
| Confirmation | The action and its consequence ("Delete 3 notes? This can't be undone."), with buttons that repeat the verb. |
| Settings row | What it does for the person, plus any trade-off. "Recommended" only for a real recommendation. |
| Permission | One sentence on what it enables for the person, at the moment it is needed. |
| Notification | The news first, in the fewest words; never a teaser. |
| Changelog | What is better, from the person's side ("You can now…"); "faster" only with real numbers. |

## Method

1. **Write the mission** of each screen in one sentence.
2. **Read the screen whole,** every string in order and in the state it appears in. If there is a reference screenshot, note its structure and set its words aside.
3. **Give each string a job** (means, reports, directs). Cut strings with no job and strings that repeat another.
4. **Write the shortest true version** using the rules and the calibration table, checking each concept against the glossary.
5. **Run the six checks on every string:** context (makes sense arriving cold, from a notification, through a screen reader), useful detail (adds something the layout does not), action (next step obvious), economy (no word can go), truth (claims, tense and cause exactly as true as the system), comprehension (a first-time user understands it unaided).
6. **Check every state and device:** empty, error, loading and full; the smallest width and largest text size; the longest supported translation (about 30% longer). Nothing a person needs truncates.
7. **Detail pass:** the ellipsis character (…) rather than three dots; consistent capitalisation (Title Case buttons, sentence case elsewhere); numbers, dates and units formatted for the locale with no line break inside them; no double spaces; quotation marks and apostrophes consistent across the product.

## Output

**For new copy:** the screen's mission, then the copy laid out the way it appears on the screen (title, body, controls in order), so it can be judged as a screen rather than a list. Character counts only where space is tight.

**For a review:** the screen first, then the changes grouped under High, Medium and Low, every one included:

| Today | Proposed | Why |
| --- | --- | --- |
| "Oops! Something went wrong" | "Couldn't save. Check your connection and try again." | Says what failed and how to recover |

Then new or changed glossary terms, and anything that needs a product decision (`settling-decisions`).

## Gotchas

| Instead of | Do |
| --- | --- |
| Words copied from a reference screenshot | Fresh copy from this screen's mission |
| A welcome, reassurance or "it's easy" line | The task itself |
| "Submit", "OK" or "Yes" on an action | The verb for the result |
| "Something went wrong" | What failed and how to recover |
| "Saved" before it is saved | "Saving…" until confirmed |
| More words because the screen is bigger | The same words with more space |
| Shortening until it is vague | The shortest complete line; change the layout if it still does not fit |
| "Turn it on in Settings" | The exact place, or a button that opens it |
| Essential information only in a tooltip | On the screen |

## Works with

- `crafting-products`: the bar and terms this skill works to.
- `designing-visuals`: words and layout are one hierarchy; the title is usually the focal point. Run its check alongside this one.
- `designing-flows`: each step's mission, which this skill's copy serves.
- `building-ai-features`: AI action labels promise exactly what the result does.
- `decluttering-screens`: cutting repetition across a whole feature.
- `auditing-consistency`: one name per concept across the product.
- `writing-briefs`: words for people outside the product.
- Apple's Human Interface Guidelines, "Writing".
