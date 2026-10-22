# Recipe app: card corners

Repository: React, TypeScript, Tailwind. Shared kit in `src/kit/`. Static gates: `npm run check` (tsc, eslint, `scripts/lint-ui.mjs`). Targets: iPhone, iPad and the web.

## Decisions store export (collection `decisions`)

```json
[{ "id": "card-radius", "choice": "agree", "note": "Every card uses the kit card radius (16). Photo viewer stays square." }]
```

## src/kit/tokens.css

```css
:root { --radius-card: 16px; --radius-pill: 9999px; --card-pad: 16px; }
```

## src/kit/Card.tsx

```tsx
export function Card({ children }: { children: React.ReactNode }) {
  return <div className="rounded-[var(--radius-card)] p-[var(--card-pad)] bg-white shadow-sm">{children}</div>;
}
```

## Card-like elements today

```tsx
// src/features/browse/RecipeCard.tsx  (Browse grid, 2 columns)
<div className="rounded-[12px] p-4 bg-white shadow-sm">...</div>

// src/features/collections/CollectionCard.tsx
<Card>...</Card>

// src/features/plan/MealPlanCard.tsx  (Meal plan week strip, fixed height 88 pt, 7 cards in a row)
<div style={{ borderRadius: 10, padding: 12 }} className="bg-white shadow-sm h-[88px]">...</div>

// src/features/recipe/PhotoViewer.tsx
// Exception: full-bleed photo, edge to edge, no corners (decision D-09).
<div className="rounded-none bg-black">...</div>

// src/kit/Avatar.tsx
<img className="rounded-full w-8 h-8" />

// src/features/browse/FilterChip.tsx
<button className="rounded-full px-3 h-8 bg-gray-100">...</button>
```
