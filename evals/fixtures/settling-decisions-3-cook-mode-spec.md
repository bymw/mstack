# Spec: Cook mode (recipe app)

## Problem
People cooking from a recipe scroll a long page with wet hands and lose their place.

## Scope
- A "Start cooking" button on every recipe opens Cook mode.
- Cook mode shows one step per screen, large type, with Next and Back.
- A step that names a time ("simmer 10 minutes") shows an inline timer that starts on tap.
- Ingredients for the current step are listed under the step text.
- Closing Cook mode returns to the recipe.

## Out of scope
- Voice control.
- Scaling servings inside Cook mode.

## Checks
- Every step of a 12-step recipe is reachable with Next and Back.
- A timer started on step 3 is still running when the person is on step 5.
