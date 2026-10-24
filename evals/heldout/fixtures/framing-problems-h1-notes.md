# Podcast player: notes that came with the export

## Message from the head of product (team chat, Oct 6)

> Week-1 retention fell off a cliff after the September 8 redesign. It went from 41% to 27% in one week and it's still sinking. We should roll back to the old player before it gets worse.

## Dashboard tile "Week-1 retention" (screenshot, transcribed)

| Week | Week-1 retention |
| --- | --- |
| Aug 18 | 41% |
| Aug 25 | 41% |
| Sep 1 | 40% |
| Sep 8 | 27% |
| Sep 15 | 24% |
| Sep 22 | 24% |
| Sep 29 | 25% |

## Analytics changelog (internal wiki page, last edited Sep 16)

- Sep 8: Player redesign (v5.0) released to 50% of new installs. 100% of new installs from Sep 22.
- Sep 8: Paid social campaign started (growth team). Budget doubled on Sep 22, cut by a quarter on Sep 29.
- Sep 15: "Active" event changed from `app_open` to `episode_played_60s` so it reflects real listening. Not backfilled.

## Export notes

- `active_in_week_1`: the person triggered the "active" event at least once in days 1 to 7 after sign-up.
- `app_version`: the player version the person was assigned at install.
