# Repwise: simulation controls and first-workout notes

Repwise is a strength-training tracker. Targets: iPhone and iPad.

## Simulation panel (Settings > Developer > Personas)
Each preset reloads the app and copies a link such as `repwise://sim?preset=active`.

| Preset | What it sets up |
| --- | --- |
| New | Fresh install. Starts at the onboarding welcome screen. |
| Active | Onboarding done, 42 workouts over 4 months, 2 routines. |
| Power | Onboarding done, 900 workouts, every badge, 30 routines (the maximum). |

There is no preset for failed syncs or a missed-workout streak break.

## What happens at the end of onboarding
Finishing onboarding automatically adds a "Sample workout" dated today, with 3 exercises, so the History tab is not empty. Home then shows "1 workout this week · Keep it up!"

## The first-workout experience (spec)
- Home shows "Start your first workout" with a short explanation when the person has no workouts.
- History, with no workouts, explains what will appear there.
- After the first real workout, Home shows a one-time summary and offers to save it as a routine.

## Report from usability testing prep
"I couldn't get an account that's set up but has no workouts, so I couldn't test the first-workout experience at all." (usability researcher)
