# Grocery list app: codebase excerpt (React, TypeScript, Tailwind)

Repository layout: `src/kit/` is the shared design kit; `src/features/` holds feature code. Static gates: `npm run check` (tsc, eslint, `scripts/lint-ui.mjs`). Docs: `docs/decisions.md`, `docs/design-system/button.md`.

## src/kit/Button.tsx

```tsx
type Variant = "primary" | "secondary" | "ghost" | "danger";

type Props = {
  variant?: Variant;
  tone?: "default" | "alert"; // "alert" turns a primary button red
  className?: string;
  children: React.ReactNode;
  onClick?: () => void;
};

const styles: Record<Variant, string> = {
  primary: "h-11 rounded-xl px-4 font-medium bg-blue-600 text-white",
  secondary: "h-11 rounded-xl px-4 font-medium bg-gray-100 text-gray-900",
  ghost: "h-11 rounded-xl px-4 font-medium bg-transparent text-blue-600",
  danger: "h-11 rounded-xl px-4 font-medium bg-red-600 text-white",
};

export function Button({ variant = "primary", tone = "default", className = "", children, onClick }: Props) {
  const base = tone === "alert" && variant === "primary" ? styles.danger.replace("bg-red-600", "bg-red-500") : styles[variant];
  return <button className={`${base} ${className}`} onClick={onClick}>{children}</button>;
}
```

## src/features/lists/DangerButton.tsx

```tsx
export function DangerButton({ children, onClick }: { children: React.ReactNode; onClick?: () => void }) {
  return (
    <button className="h-10 rounded-lg px-3 font-semibold bg-red-700 text-white shadow-sm" onClick={onClick}>
      {children}
    </button>
  );
}
```

## Callers

```tsx
// src/features/lists/ListSettings.tsx
<DangerButton onClick={deleteList}>Delete list</DangerButton>

// src/features/lists/ItemRowMenu.tsx
<Button variant="primary" tone="alert" onClick={removeItem}>Remove item</Button>

// src/features/account/AccountScreen.tsx
<button className="h-11 rounded-xl bg-red-600 px-4 text-white font-medium" onClick={signOutAll}>Sign out everywhere</button>

// src/features/sharing/ShareSheet.tsx
<Button variant="danger" onClick={stopSharing}>Stop sharing</Button>

// src/features/onboarding/StartOver.tsx
// Kept low-emphasis on purpose: people mid-setup should not be pushed toward wiping it (decision D-21).
<Button variant="ghost" className="text-red-600" onClick={startOver}>Start over</Button>
```

## Decisions store export (collection `decisions`, from the sign-off page)

```json
[
  { "id": "destructive", "choice": "agree", "note": "One red button. Kit 'danger' wins. Keep the onboarding Start over as it is." },
  { "id": "icon-size", "choice": "discuss", "note": "Are 20 pt icons too small on iPad?" },
  { "id": "link-colour", "choice": "no", "note": "Leave link colour alone for now." }
]
```
