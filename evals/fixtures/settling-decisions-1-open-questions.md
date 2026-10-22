# Fitness tracker: open questions after the workout screens audit

1. Should the workout timer screen close from the leading or the trailing corner? (11 screens close leading, 6 trailing.)
2. Should "Discard workout" ask for confirmation, or discard at once with an Undo?
3. What colour is the primary button on the workout summary screen?
4. Do we keep the separate "Quick start" tab at all, or fold it into the Workouts tab as a button at the top?
5. Quick start tab icon: bolt or play?
6. Quick start default duration: 20 or 30 minutes?
7. Should the rest timer vibrate when it ends?

---

## Excerpt: design system, Buttons page

> The primary action on any screen uses the accent fill (blue). One primary per screen. Destructive actions use the red text style, never a red fill.

## Excerpt: spec, "Rest timer"

> When a rest timer ends, the phone plays a short haptic and the end-of-rest sound, unless the system is muted, in which case only the haptic plays.

## Excerpt: decisions log

> 2026-09-30. Workouts tab is the home tab, not Quick start, because most sessions start from a saved plan.
