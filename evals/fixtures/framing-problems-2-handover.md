# Team calendar app: Shared Availability, handover folder

Left by the previous product manager. Status: released to 3 internal teams as a beta.

## Spec (v2, July)

- Teammates can see each other's availability as Busy and Free blocks on the week grid.
- Availability is visible to everyone in the team.
- Event titles are never shown to anyone but the event's owner.
- Busy means an accepted event. Declined and tentative events do not count.

## Decisions log

> 2026-08-20. Availability is shared only with people in the same team who have turned on "Share my availability". The setting is off by default, because the works council asked that nobody's calendar becomes visible without their consent.

> 2026-09-04. All-day events count as Busy only when marked "Busy" by their owner.

## Backlog

| Ticket | Title | Status |
| --- | --- | --- |
| SA-101 | Show free/busy blocks in week view | Done |
| SA-102 | "Share my availability" setting, off by default | Not started |
| SA-103 | Show event title on hover for teammates | Done |
| SA-104 | Busy blocks for all-day events | In progress |
| SA-105 | Free/busy overlay in week view | In progress |
| SA-106 | Teammate availability overlay on the week grid | Not started |
| SA-107 | Busy should include tentative and out-of-office events | Not started |
| SA-108 | Export availability to the room-booking partner | Not started |
| SA-109 | Busy blocks show in the wrong time zone for teammates abroad (reported by 3 teams) | Open |
| SA-110 | Analytics events for availability views | Not started |

## Thread excerpt, #shared-availability

> Engineer (Sep 12): heads up, in the code Busy already includes tentative and out-of-office, that's what people expect.

> Partnerships (Oct 2): the room-booking partner needs the availability export by 15 November for their pilot with two customers. Can we commit?

> Previous PM (Oct 2): should be fine.
