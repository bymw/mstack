# The personas, and what to ask on every screen

Read this when choosing personas, setting them up and walking.

**Contents:** the core five · add when the flow meets them · the questions on every screen · a walk record

## The core five

Walk these for any flow that holds a person's data, history or settings. Each catches a different class of fault.

| Persona | Who they are | What they catch |
| --- | --- | --- |
| **Nothing yet** | Signed up, nothing added, no history, nothing set up | Empty voids; features that do not explain themselves; figures that assume history; a next step that needs something they do not have yet |
| **Thin** | First activity: one item, one action, nothing else set up | Lists of one; charts with one point; averages of nothing; "since last month" with no last month |
| **Typical** | Real data and a real history, the person the specification describes | The baseline every other walk is compared against |
| **Maximum** | Every collection at its largest and every cap reached | Overflow, truncation, long lists with no structure, a cap reached with no explanation, performance |
| **Messy** | An ordinary history with a few things wrong: failed, rejected and blocked actions, an expired credential, a limit gone past | Error states that were never seen; colour for failed against needs-care; retry offered where it is not safe |

## Add when the flow meets them

- **The reported persona.** Whoever someone could not simulate, or met a fault as. Walk them first.
- **Lifecycle states.** Restricted, locked, under review, closed. Does the flow stop properly, and does it say how to get access back?
- **Feature off.** A feature the person never turned on, and one they turned off again. Off is a state with its own content.
- **Edge content.** Realistic worst cases, never random: a very long name and a two-letter one, a 60-character email, counts of 0, 1 and 1,284, translations about 30% longer, the other reading direction, the largest text size.
- **Edge devices.** The smallest supported phone, an iPad in split view, a narrow and a very wide Mac window, a 320 px browser, 200% zoom, the oldest supported hardware.
- **Product stages,** where a product has them: new to it, set up but holding nothing, active.

## The questions, on every screen

1. **Would this person know what this is?** A feature seen for the first time explains itself in place, without a link.
2. **Is anything shown that they could not have?** A total, an item, a history, a figure computed from data they lack.
3. **Is off drawn as empty?** A feature that is off shows what it is and how to start it.
4. **Is something preselected that the system cannot know?** A personal choice, a recipient, a consent.
5. **Did it fail, or is it empty?** Check failure before empty.
6. **Does the next step exist,** and can this person take it? A next step that needs something they do not have yet says so.
7. **Does Back go where they came from?** Not to a page they never saw, and never in a loop.
8. **Does anything overflow at maximum?** Truncated names, wrapped chips, a list with no count, a cap with no explanation.
9. **Is every figure in the right form?** Number format, units, sign, the decimals the context needs.
10. **Is every string true for this person?** A sentence written for the established person may be false for the new one.
11. **Where would this person feel unsafe, anxious, embarrassed or behind?** A moment of doubt is a finding even when everything works.

## A walk record

Keep one per persona, so the walk can be reopened and repeated.

```
Persona:  Nothing yet
Link:     http://localhost:<port>/<route>?<exact query the product's controls wrote>
Confirmed on first screen: <name> · <a total> · <one count>
Path:     <entry> → <screen> → … → <end> → Back → <where it landed>
Findings: #1, #4
```
