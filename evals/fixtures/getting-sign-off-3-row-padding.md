# Fitness tracker: list row padding

Dev server: http://localhost:5173 (React, Vite). Device canvas draws a 375x812 phone; screen element is `[data-screen]`.
Persona and data come from query parameters: `?persona=typical&seed=4`.

Token today, in `src/kit/tokens.css`:

```css
:root {
  --row-pad-y: 10px;   /* vertical padding inside every list row */
  --row-pad-x: 16px;
  --row-gap: 0;
}
```

Every list row uses the kit's `ListRow`, which reads `--row-pad-y`.

Screens with list rows (route, rows on first screen for persona=typical):
- /workouts: 9 rows (the screen people open most)
- /history: 12 rows
- /settings: 11 rows
- /exercise-picker: 14 rows
- /friends: 6 rows

Request from the product designer: "Rows feel cramped. Try 14px."
