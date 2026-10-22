# Forkful: Shopping list sync (screens and spec excerpt)

Forkful is a meal planner. Targets: iPhone, iPad and web. The feature lets a household share one shopping list built from the week's meal plan.

## Spec
- Settings > Shopping list sync has a switch. Turning it on creates a shared list and offers to invite household members.
- The Plan tab shows a "Shopping list" row that opens the list.
- When sync is on, items ticked by anyone disappear for everyone.

## Screens as built, by state

### Never turned on
- Settings > Shopping list sync: the title, then the switch (off). Nothing else on the screen.
- Plan tab: the "Shopping list" row reads "Shopping list · Synced with 0 people".
- Opening the list: an empty white page with the title "Shared list".

### On, two members
- Settings: switch on, members Ana and Luis listed, "Invite" row.
- Plan tab: "Shopping list · Synced with 2 people".
- List: 14 items from the plan.

### Turned off again (after being on with two members)
- Settings: switch off, nothing else.
- Plan tab: "Shopping list · Synced with 2 people".
- List: the 14 items, editable. Ticking an item no longer syncs. No banner.
- Turning the switch back on: a fresh empty shared list is created; the 14 items are not carried over. The other two members are not re-invited.

## Simulation controls
The prototype's debug menu offers: "Sync: never on", "Sync: on (2 members)", "Sync: turned off". Each writes a link such as `/plan?sync=off-after-on`.

## Decisions log
- D-4: Turning sync off must never delete anyone's list.
