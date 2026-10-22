---
name: walking-personas
description: Walks a flow end to end as worst-case personas (nothing yet, thin, typical, maximum, messy) on every target device, finding empty voids, dead ends, wrong defaults and broken Back paths. Read-only. Use when the user asks what a brand-new user sees, wants every state checked or a critical journey scored, or before a demo, sign-off or usability round. Not for a fault felt on the device (diagnosing-feel).
license: MIT
---

# Persona walk

A flow is usually built and reviewed as one person: the established one with a real history, because that is who the demo account is. The faults live with the others. A new person opened an automation feature and found a switch and nothing else, with no idea what the feature was. Someone who had just added their first item still saw a summary figure from someone else's history. Nobody could start as a person who was set up but held nothing, so a usability round could not test the first purchase. Each was found late, by someone walking as that person.

This skill covers walking a flow as a small set of worst-case personas and reporting what each meets. It does not fix (findings go to `getting-sign-off`) and does not invent states the specification does not hold. The personas, the questions to ask on every screen and the walk record are in [PERSONAS.md](PERSONAS.md); read it before choosing personas.

## Two failure modes, and the first is worse

1. **Walking as the demo account only.** Every screen works, because the data is the data it was built on. The voids and impossible states ship, and the first to meet them is a stakeholder in a sign-off or a participant in a usability round.
2. **Combinatorial noise.** Every persona times every state times every toggle, reported as a wall. Real faults drown. A few personas that matter, walked whole, beat seventeen states skimmed.

## Rules

1. **Pick the few personas that matter:** nothing yet, thin, typical, maximum, messy where things can fail, plus the one just reported. Add a lifecycle or edge persona only where the flow meets it.
2. **Every persona is a link.** Record exactly how each was set up, as an address or settings anyone can reopen, and confirm it on the first screen (a name, a total, a count).
3. **Walk end to end at true size on every target device:** from the entry the person would really use (for a whole journey that may be a search, the website, an email or the docs, not the product's first screen), through every branch, to the screen after the flow ends, then Back out again.
4. **Ask the same questions on every screen,** not only the first (PERSONAS.md): would they know what this is; is anything shown they could not have; is off drawn as empty; is something preselected the system cannot know; does the next step exist; does Back go where they came from; does anything overflow at maximum.
5. **Check failure before empty.** A list that failed to load never reads as "nothing here".
6. **Ground every finding in the specification.** Where it is silent, the finding is a question, not a bug.
7. **A persona the product cannot reach is a finding,** reported as a simulation gap. Never hand-edit state to get there.
8. **Read-only.** Probe scripts and notes are fine; product source is not touched.
9. **A critical journey is scored and walked again.** When asked to check a journey rather than one flow, score each step as works, easy and error-free, or surprisingly great, and say when to walk it again (after nearby areas ship), because quality decays as the rest of the product changes.

## Method

1. **Frame** the flow, its entry points and where it ends. Choose the personas and say why each matters here; walk a reported one first.
2. **Set up each persona** with the product's own simulation controls, copying the link they produce rather than composing it, and confirm it on the first screen.
3. **Walk** every screen and branch (on, off, cancel, Back, the end) on each target device, capturing screens with the capture guide in the `getting-sign-off` skill and noting the answers to the questions as you go.
4. **Vet** each finding against the specification and the decisions log. Remove only what is by design; merge the same finding across personas into one that lists every persona it affects; report every other finding with its severity.
5. **Report, then offer the page:** per persona, then offer to build the `getting-sign-off` page from the findings. Product questions go to `settling-decisions`.

## Output

**Headline:** one sentence, for example "Onboarding, 5 personas on iPhone and iPad: 3 faults for Nothing yet, 1 for Maximum, 1 persona we cannot simulate."

**Findings, grouped under High, Medium and Low,** every one included, each as one line: the screen, what the persona meets, the proposed fix, and the personas it affects. Screens are shown, not described, where possible.

**Then the walk records:**

| Persona | Link | Devices | Findings |
| --- | --- | --- | --- |

**Cannot simulate:** each persona the product cannot represent. **Not walked:** honest gaps (a device, a language, a lifecycle state).

The reply ends with the offer to build the `getting-sign-off` page.

**Before sending, check the report against this list:**

- [ ] The headline names the personas, the devices and the fault count per persona
- [ ] Each persona has its one-line reason and the link copied from the product's controls
- [ ] The walk records table has its Devices column filled for every persona
- [ ] Maximum and Messy were walked, or are listed under Cannot simulate with why
- [ ] Spec silences are questions for `settling-decisions`, not findings declared as bugs

## Gotchas

| Instead of | Do |
| --- | --- |
| Walking only as the demo account | Nothing yet, thin, typical, maximum and messy, plus the reported one |
| A finding from one screenshot | The walk from entry to end, and Back |
| An empty list reported as empty when it failed | Failure checked before empty |
| A persona described in words only | A link that reopens exactly that persona |
| Walking one device | Every device the product targets |
| A total, item or history the person could not have, let pass | An impossible state is a finding |

## Works with

- `crafting-products`: principles 9 and 11, and the shared terms.
- `designing-flows`: the "Nothing yet" walk is the first run of every flow.
- `getting-sign-off`: the findings become its rows.
- `decluttering-screens`: off is a state, not an empty screen.
- `auditing-consistency`: when a finding is one job done several ways.
- `diagnosing-feel`: when the fault is felt rather than seen.
- `settling-decisions`: product questions the walk raises.
- Emil Kowalski's `break-ui` stress-tests one component with worst-case data; this skill uses worst-case people across a flow.
