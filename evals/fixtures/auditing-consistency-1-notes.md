# Inkwell: design system and decisions (excerpt)

Targets: iPhone, iPad, web.

## Kit
- `ConfirmSheet`: the inset bottom sheet for confirmations. Inset 8, radius 28, 24 to the first text.
- `Dialog` with `variant="card"`: centred card. Documented as "for confirmations on web only" in the kit README, but the README has not been updated since the iPad app shipped.
- `Button` variants: primary, plain, ghost, danger, danger-outline.

## Decisions log
- D-3: Signing out on the web uses the browser's own `confirm()` dialog, because the session check runs before the app shell loads. Kept on purpose.
- D-9: Destructive buttons say what they do ("Delete note", not "OK").

## Also in the codebase (not attached)
- `SignOut.web.tsx` calls `window.confirm("Sign out of Inkwell?")`.
- `LeaveSharedNotebook.tsx` renders `<ConfirmSheet>` with a `danger` button "Leave notebook".
