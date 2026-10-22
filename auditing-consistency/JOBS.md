# Jobs that drift, and what to measure

Read this in step 1 to pick the neighbouring jobs, and in step 2 to know what to read off each screen. Each job lists its usual drift, the values to measure, and a canonical answer that has held up on iOS, iPadOS, macOS and the web. Use the "Held up" lines as a starting point and adapt them to the product in front of you.

**Contents:** Getting around · Surfaces · Actions · States · Lists · Words and type · Motion

## Getting around

**Go back from a pushed page.**
- Drift: a chevron in a disc here, an arrow there, a × on a page that was pushed.
- Measure: the glyph, its size, its position, and its hit target (44pt minimum).
- Held up: the platform's current system back button on every pushed page. A pushed page goes back; it never closes.

**Leave a flow.**
- Drift: × on the left in some flows and on the right in others, or ← and × together.
- Measure: the side, the glyph per step, and whether both controls show at once.
- Held up: one leading control: × on the first step, ← after it, never both, never trailing.

**Name the page.**
- Drift: some tabs carry a title and others do not; inner pages are inconsistent.
- Measure: whether a title is present, and its position, size and alignment.
- Held up: a tab carries no title, because the highlighted tab says where you are. An inner page always does, centred.

**The top of the screen.**
- Drift: white tops on some pushed pages, dark on the others; status bar ink that does not follow.
- Measure: the background behind the status bar, per screen and per arrival path.
- Held up: one default for pushed pages and flows, with the opt-out written next to its reason.

**Where a flow lands when it finishes.**
- Drift: on the new object, on a list, on Home.
- Measure: the screen after completion, for each entry point.
- Held up: a flow ends where it was launched.

## Surfaces

**Present a confirmation or a choice.**
- Drift: centred dialog cards beside bottom sheets.
- Measure: the presentation type, the scrim, the corner radius and the gap to the screen edge.
- Held up: every confirmation is the inset bottom sheet. The dialog prop that asked for a card was deleted.

**Open a sheet.**
- Drift: the content starts at a different height on every sheet, and the grabber is sometimes counted and sometimes not.
- Measure: the distance from the sheet's top edge to the first card or text, and whether the grabber sits inside that distance.
- Held up: one opening line: 24pt to a card, 32pt to text, the grabber paid for inside.

**Head a section.**
- Drift: different type roles, insets that try to align with icons, gaps of 12 here and 16 there.
- Measure: the type role, the colour, the start inset and the gap to its card.
- Held up: a quiet label 8pt above its card, at the card's own start edge.

**Group content on a ground.**
- Drift: white on white, grey on a slightly greyer grey, a hairline darker than the card's edge.
- Measure: the card fill against the ground (contrast ratio), the shadow and the divider colour.
- Held up: white cards on a light grey ground, about 1.12:1, the step native grouped lists use.

## Actions

**The primary action.**
- Drift: different heights, widths capped on some screens, finishes that look inverted.
- Measure: height, width (full or capped), corner, finish and press state.
- Held up: 48pt boxed buttons at full width, lit from above, and a press that sinks.

**A destructive action.**
- Drift: several red variants (solid, outlined, link).
- Measure: the count of variants and where each is used.
- Held up: one red button, plus one red link reserved for sitting beside a primary.

**Press feedback.**
- Drift: hover styles on a touch screen, controls with no press state, no visible keyboard focus.
- Measure: computed styles while a pointer is held down on each control.
- Held up: on touch, every control presses and nothing depends on hover; on Mac and the web, hover is a hint, every control is reachable by keyboard and shows focus.

**Enter a value.**
- Drift: two or more layouts, with what the value applies to sitting above, below or in chips.
- Measure: the order of context, figure, chips, keys and action.
- Held up: one entry screen for every way a value is entered.

## States

**Say it worked.**
- Drift: glossy 3D ticks, discs and marks at several sizes.
- Measure: the mark, its size, its colour, and the title style.
- Held up: one success mark; marks share one grammar (shape says the family, glyph says the state, colour confirms).

**Say it stopped.**
- Drift: a different stop screen per lifecycle; warning colour used for states that need nothing.
- Measure: the mark, the colour, the title colour and the button width.
- Held up: one stop screen. A state that needs nothing from the person is quiet ink.

**Empty or off.**
- Drift: an off feature drawn as an empty page; "No data" strings.
- Measure: what the screen shows with the feature off, and with it on but empty.
- Held up: off is a state with its own content, not emptiness.

**Loading.**
- Drift: spinners for content, skeletons that do not match what arrives, fake loading over data already held.
- Measure: the skeleton's height against the loaded height, and the loading time on held data.
- Held up: the skeleton is the shape of what arrives; spinners are for actions only.

## Lists

**A tappable row.**
- Drift: chevrons on some rows and not others, chevrons beside values.
- Measure: whether a chevron is present, its colour and contrast, and whether the row is tappable.
- Held up: no chevron beside a value; chevrons at 3:1 or better.

**Pick one, pick many.**
- Drift: checkboxes for pick-one, a preselected first option.
- Measure: the mark shape and the default state.
- Held up: a ring for pick-one, a square for pick-any; nothing preselected that the system cannot know.

## Words and type

**One name per concept.**
- Drift: Upcoming here, Scheduled there; Edit beside Change.
- Measure: every label for the concept, across the entry point, the title and the actions.
- Held up: one word per thing, with the glossary as the source.

**Hero figure.**
- Drift: hand-set sizes and weights on one tab.
- Measure: the type role or computed size, weight and tracking.
- Held up: one hero style from the kit.

## Motion

**The same move, the same motion.**
- Drift: nine ways to push a page, Back as a cut, about 50 durations.
- Measure: what moves after each tap, its duration, curve or spring, and whether Back reverses it.
- Held up: a small vocabulary of roles over one duration ramp and two springs. Use `designing-motion` and `diagnosing-feel` for depth.
