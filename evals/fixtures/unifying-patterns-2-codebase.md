# Plant care app: the old toggle is back

Repository: React, TypeScript, CSS modules. Shared kit in `src/kit/`. Static gates: `npm run check` (tsc, eslint, `scripts/ui-rules.mjs`, which already holds the project's UI lint rules). Main branch: `origin/main`.

## docs/decisions.md (excerpt)

> 2026-08-12. Toggles: the standard toggle, not the green pill, because the green pill read as a different control from every other toggle in Settings and two people in testing thought it was a status badge. Replaces the "legacy" appearance.

## src/kit/Toggle.tsx (on main today)

```tsx
type Props = {
  checked: boolean;
  onChange: (next: boolean) => void;
  label: string;
  appearance?: "standard" | "legacy"; // legacy kept for now, see consolidation 12 Aug
};

export function Toggle({ checked, onChange, label, appearance = "standard" }: Props) {
  return (
    <label className={styles.row}>
      <span>{label}</span>
      <button
        role="switch"
        aria-checked={checked}
        className={appearance === "legacy" ? styles.greenPill : styles.standard}
        onClick={() => onChange(!checked)}
      />
    </label>
  );
}
```

`src/kit/Toggle.module.css` has `.standard`, `.greenPill` and `.greenPillKnob`.

## src/features/reminders/WateringReminders.tsx (merged last week)

```tsx
<Toggle label="Remind me to water" checked={remind} onChange={setRemind} appearance="legacy" />
<Toggle label="Skip on rainy days" checked={skipRain} onChange={setSkipRain} appearance="legacy" />
```

## Other callers

All 14 other `<Toggle>` calls in Settings, Plant detail and Notifications pass no `appearance`.
