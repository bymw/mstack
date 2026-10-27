# Assigning a role

Read this at steps 1 and 3. It holds the questions that give a move its role, the inventory to fill in, and how to propose a new role. It holds no values: durations, curves and springs live in the project's motion tokens, or in DEFAULTS.md when there are none.

## The question that comes first

**What did the person just do, and what is this move telling them about it?**

Motion communicates one of these:
- where something came from (origin)
- where it went (destination)
- that this is the same thing as before (continuity)
- what sits above what (hierarchy)
- that something happened (confirmation)
- that something changed state

If a move communicates none of these, it is decoration on a screen someone is reading a number on. Remove it.

## From the act to the role

The names below are the usual vocabulary. Use the project's own names where it has them.

| The person… | The move says… | Usual role |
| --- | --- | --- |
| puts a finger on something that goes somewhere | "this is live under your finger" | press |
| picks one option among several | "the choice moved here" | select |
| changes a segment, period or filter, and content changes under the control | "same place, new content" | swap: a crossfade in place, no travel |
| opens a destination | "the new page is in front; the old one is behind it" | push: the platform's native transition, Back its exact reverse |
| advances inside a flow | "next step, same task" | step |
| opens a sheet or a menu over the page | "this sits on top and goes back where it came from" | present |
| starts a task that takes over the screen | "you are in a task now" | flow |
| is told something that arrived | "something new, here" | notify |
| opens a group in place | "more of the same thing" | expand |
| gets the outcome of something they waited on | "here is the answer, where the wait was" | resolve: the mark, then its words |
| waits on the system | "still working" | wait: the only role that loops |
| sees one glyph become another in place | "the same control, changed" | morph, for glyphs only, never for words |

A move that fits two roles is usually two moves: a press, then a push.

## Rules that hold for every role

- **Springs for anything a finger or pointer drags**, so a flick or a second tap carries into the motion already running. A tween restarts from rest.
- **Surfaces never bounce.** Small controls may carry a little.
- **Sideways motion takes the reading direction.** In a mirrored layout, a push arrives from the other side.
- **The first arrival may animate. A revisit rests.** Something already on screen when the page opened answered no act.
- **Every role has a reduced form**, defined with the role and not left to a global switch. A global setting that strips transforms makes a layer that arrives by travel alone cut in.
- **No figure the person decides on moves by itself.** A changing figure updates in place; it never counts up or down.

## The inventory

Fill one entry per move, from a probe or a recording, never from reading code alone: screen, trigger, element, property, measured duration and curve (or spring), whether the exit reverses it, reduced form, role, and whether a token is used.

Then group the rows by role. Within a role, every row must show the same motion. A role with two motions is a finding.

## Proposing a new role

Only when an act exists that no role answers. Bring it to the user as one question with `settling-decisions`:
- the act, in the person's words
- why no existing role fits, naming the nearest one and what it would get wrong
- the proposed motion, as a recording in the real interface
- where else in the product the same act happens, so the role is not one screen's exception

Once agreed, the role goes into the tokens, the design-system page and a decision entry, in one change.
