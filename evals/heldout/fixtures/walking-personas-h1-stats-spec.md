# Meditation app: Stats tab (v1 spec, for Friday's demo)

Platforms: iPhone and iPad. Supports light and dark, Dynamic Type.

## What the tab shows, top to bottom

1. **Title:** "Your progress"
2. **Weekly ring:** minutes meditated this week (Monday to Sunday) against a goal of 70 minutes. The goal is fixed for v1. The number inside the ring shows minutes, e.g. "42 / 70".
3. **Current streak:** large number, "N days". A day counts if at least one session finished that day. Days are computed from each session's stored local start time.
4. **Last 7 days:** bar chart, one bar per day, height = minutes. The y-axis scales to the tallest bar.
5. **Totals row:** "Total sessions" and "Total hours", e.g. "312 sessions · 54 h".
6. **Longest session:** e.g. "45 min".
7. **Favourite time of day:** the hour block with the most sessions, e.g. "Mornings (6 to 9)".
8. **Mood trend:** line chart of the mood check-in (1 to 5) people can answer after a session. The check-in is optional and off by default.
9. **Badges:** grid of 12 badges (e.g. "First session", "7-day streak", "100 sessions", "1,000 minutes"). Locked badges are shown greyed out with no hint of how to earn them.
10. **Footer message:** "Great job, keep it up!" (always shown).

## Data notes

- Sessions are stored with their local start time and duration in seconds. A session left running in the background can record a very long duration (we've seen 9 h).
- Deleting a session removes it from all stats.
- Sessions sync between devices; the same account can be on an iPhone and an iPad.
