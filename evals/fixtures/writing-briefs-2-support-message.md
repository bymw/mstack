# Message from the head of support (reading-list app)

> Hi! A few readers have written in asking why their "Up next" list reordered itself after the update. Was this on purpose? What should I tell them? And if it's a bug, do we have a date for the fix?

## Internal context (from the engineer, not for sending)

- Update 3.2 changed the default sort for lists from manual order to "recently added". It was meant to apply only to new lists, but it also applied to existing lists that had never been reordered by hand. Not intended.
- Lists that someone had reordered by hand kept their order. Nothing is lost.
- Readers can put a list back with Sort > My order.
- The fix (restore manual order for affected lists) is written and waiting for review. No release date yet.
