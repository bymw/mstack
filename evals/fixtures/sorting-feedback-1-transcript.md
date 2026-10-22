# Team calendar app: sign-off session, 20 minutes, transcript excerpt

Speakers: Product lead (PL), Sales lead (SL), Support lead (SU), Designer (DE).

PL: Okay, the new week view. Overall I like it. Can we make the Today button easier to find? It's tucked inside the overflow menu.
SL: My big one: can we add public booking links, like the scheduling tools have? Prospects ask for it in every demo.
DE: Time zones still confuse people, I think. When someone in another city books, you can't tell whose time it is.
PL: Honestly, it would be fun if the calendar had colour themes someday.
SU: The ticket I see most is "the meeting moved and I didn't notice." They get the update, but the event looks exactly the same as before.
SL: Bigger teams keep asking for an admin console. I don't know what it would take to build.
PL: Maybe we should redo the whole week view layout while we're at it?
SU: Oh, and small thing, new teams with nobody invited yet just see an empty week. A few wrote in thinking it was broken.
SL: If we had booking links I think we'd close more deals, easily.
PL: Let's wrap there.

---

## Product context (for grounding)

- Release 1.4 (shipped 3 October) shows the event's time zone next to its time whenever it differs from yours, and a "Your time / Their time" toggle on the event sheet.
- The Today button is in the overflow menu on iPhone, and in the toolbar on iPad and the web.
- An updated event looks identical to an unchanged one; there is no "changed" marker.
- Empty week for a team with no members invited: blank grid, no message.

## Decisions log (excerpt)

> 2026-09-02. No public booking links in version 1, because the product is for teams who already work together; booking strangers brings spam and availability rules we are not taking on this year.
