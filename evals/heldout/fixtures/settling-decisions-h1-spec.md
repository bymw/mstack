# Shared trips v1 (draft spec)

Travel planner app: iPhone, iPad, web. Today a trip belongs to one person. This adds collaborators.

## What we know

- The trip owner can invite collaborators by link or by email.
- Collaborators see the itinerary, bookings and packing list.
- Works offline; changes sync when back online. Each change is stored per field.
- Ships with the November release if engineering can start next week.

## Open questions

1. **Permissions:** can collaborators edit, or only view? Or does the owner choose per person? TBD
2. **Leaving:** when a collaborator leaves or is removed, what happens to the items and bookings they added? TBD
3. **Offline conflicts:** if two people edit the same field offline, what wins? Engineering needs this to pick the sync model. TBD
4. **Limit:** maximum collaborators per trip. Design wants 10, engineering says any number is fine. TBD
5. **Notifications:** do collaborators get notified about changes? Which ones? TBD
6. **Inviting others:** can collaborators invite more people, or only the owner? TBD
7. **Name:** "Shared trips" or "Trip crew" (marketing's suggestion). TBD
