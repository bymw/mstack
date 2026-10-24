# Bug tracker web app (React, TypeScript): every button in the codebase

Lint: ESLint with a shared config in `eslint.config.js`. Tests: Vitest + Testing Library.

## src/components/PrimaryButton.tsx

```tsx
export function PrimaryButton({ children, onClick, fullWidth = false, disabled = false }: Props) {
  return (
    <button onClick={onClick} disabled={disabled}
      style={{ background: '#1f883d', color: '#fff', padding: '8px 16px', borderRadius: 6,
               width: fullWidth ? '100%' : undefined, opacity: disabled ? 0.5 : 1 }}>
      {children}
    </button>
  );
}
```

## src/components/BigButton.tsx

```tsx
export function BigButton({ label, onPress, loading = false }: { label: string; onPress: () => void; loading?: boolean }) {
  return (
    <button onClick={onPress} disabled={loading} className="big-btn">
      {loading ? <Spinner size={16} /> : label}
    </button>
  );
}
// .big-btn { background: #2da44e; color: #fff; padding: 14px 24px; font-size: 16px; border-radius: 8px; }
```

## src/ui/Button.tsx (newest, added last month)

```tsx
type Props = { variant?: 'primary' | 'secondary'; size?: 'md'; onClick?: () => void; disabled?: boolean; children: React.ReactNode };
export function Button({ variant = 'primary', size = 'md', ...rest }: Props) {
  return <button className={`btn btn-${variant} btn-${size}`} {...rest} />;
}
// .btn-primary { background: #1f883d; color: #fff; }  .btn-secondary { background: #f6f8fa; color: #1f2328; border: 1px solid #d0d7de; }
// .btn-md { padding: 8px 16px; border-radius: 6px; font-size: 14px; }
```

## Callers

| File | What it uses |
| --- | --- |
| src/issues/IssueHeader.tsx | `<PrimaryButton onClick={save}>Save</PrimaryButton>` |
| src/issues/NewIssueForm.tsx | `<PrimaryButton fullWidth disabled={!valid} onClick={submit}>Create issue</PrimaryButton>` |
| src/onboarding/Welcome.tsx | `<BigButton label="Get started" onPress={next} />` |
| src/onboarding/InviteTeam.tsx | `<BigButton label="Send invites" onPress={send} loading={sending} />` |
| src/projects/ProjectToolbar.tsx | `<Button variant="secondary" onClick={openSettings}>Settings</Button>` |
| src/projects/NewProject.tsx | `<button className="btn btn-blue" onClick={create}>New project</button>` (`.btn-blue` is defined in legacy.css) |
| src/settings/DeleteAccount.tsx | `<button style={{ background: '#d1242f', color: '#fff', padding: '8px 16px' }} onClick={confirmDelete}>Delete account</button>` |
| src/settings/ApiKeys.tsx | `<button style={{ color: '#d1242f', border: '1px solid #d1242f' }} onClick={revoke}>Revoke</button>` |

## What we agreed in design review

One `Button` component. Variants: primary, secondary, destructive. Sizes: medium (today's 8 px / 16 px) and large (today's BigButton). Loading and full width supported. Nothing else.
