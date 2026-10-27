# The moves, in order

Read this at step 3. Run the moves in this order. Each is cheaper and safer than the next, so a later move is used only when the earlier ones are not enough; a screen still crowded after them splits. Each move lists what it may cost the person, and what it must never cost.

`writing-ux-copy` holds the same idea at the scale of a string. Use it for every string the moves below touch.

## 1. Cut repetition

**What:** remove the second copy of a fact. A description that restates its title. A caption that repeats the row. A title that repeats the tab the person just tapped. The same figure on the hero and in the first row below it. A line that narrates what the person just watched happen.

**May cost:** nothing. If the person loses anything, it was not a repeat.

**Must not cost:** the record. A confirmation's narration can go; the persistent record of a submission, an access change or a decision stays where records live.

**Check:** read the screen aloud. Is anything said twice?

## 2. Shorten titles and labels

**What:** the title names the subject, status or decision. The description adds the one fact the title cannot carry. Labels compress, because the interface supplies the context.

**May cost:** words.

**Must not cost:** meaning. A title that will not fit its bar is a component problem, never a reason to make it vague.

**Check:** is the shortened title still unambiguous out of context, in a notification or read by a screen reader?

## 3. Default instead of asking

**What:** where the system knows the answer, or any answer is safe and changeable later, prefill it and let the person change it. Example: a reminder step prefilled from the goal's target and date, with every part changeable, and Skip for now beside it.

**May cost:** one tap for the person who wants something else.

**Must not cost:** the decision itself. Never preselect what the system cannot know: a personal choice, a recipient, a consent, an agreement. Never turn a set of choices into one switch that cannot be changed.

**Check:** if the default is wrong for this person, can they see it and change it before it commits?

## 4. Put detail behind a counted row

**What:** move secondary detail behind one row that says what is there and how much: "History · 12". Show one figure and one line of context where several figures compete.

**May cost:** a tap to reach the detail.

**Must not cost:** the whole list. A list capped behind View all with no count hides how many there are; a short preview with a counted row, or the whole list, does not. Never hide a figure the person acts on at this moment, and never hide the thing that tracks progress.

**Check:** does the count tell the person whether the tap is worth it?

## 5. Merge steps that ask one decision

**What:** two steps that ask parts of the same decision become one step. Equally, a step that asks two unrelated decisions splits.

**May cost:** a longer step.

**Must not cost:** a decision. A flow made shorter by dropping a decision comes back, usually the same day. A long explanation is shortened (move 2), not split; splitting a crowded screen is the last move.

**Check:** count the decisions asked before and after. The number must not fall unless a default (move 3) took one, with its reason.

## 6. Land where the person started, or on what they made

**What:** a flow ends where it was launched, or on the thing it made, so the person sees the result: a new goal lands on the list it was created from, not on a page they never visited.

**May cost:** a pushed detail page the person did not ask for.

**Must not cost:** the next step. A major completion still says what was done and offers the useful next action (add the first item, or later), then lands where the person began or on what they made.

**Check:** after the flow, is the person looking at the place they left or the thing they made, with the result visible?

## 7. Draw off as a state, not as empty

**What:** a feature the person has not turned on shows the whole screen with the switch off: what it is, what it would do, how to start it. Never a near-empty page with a link.

**May cost:** nothing.

**Must not cost:** truth. Never name a thing that does not exist yet (a space that turning the feature on would create), and never state a promise that is untrue while the feature is off.

**Check:** would a person who has never heard of this feature understand it from this screen?

## Last resort: split the screen or redesign the component

When moves 1 to 7 are not enough, a screen that is still crowded splits into steps, each with one mission; more screens beat a crowded one. Otherwise the component itself is wrong for the content: a bar too narrow for any honest title, a card that cannot hold the one figure that matters. Propose the component change as its own `getting-sign-off` row, or as `exploring-directions` if there is more than one answer. In a project with a shared kit, a component change is a foundation change, made once for every caller.

## The still-reachable checklist

Run it after the moves, before presenting.

- [ ] Every capability the feature had is reachable, and the taps to reach it are counted.
- [ ] Every decision is still asked, or defaulted with the reason the system can know it.
- [ ] Every state (off, empty, error, loading, maximum) still has its screen.
- [ ] Every flow still offers the next step where it ends.
- [ ] Nothing is preselected that the system cannot know.
- [ ] No string became vague, and none truncates at the smallest supported width.
- [ ] Every move that contradicts a recorded decision is flagged for `settling-decisions`.
