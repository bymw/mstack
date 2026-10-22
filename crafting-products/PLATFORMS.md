# Platform conventions

Read this when a screen is designed, reviewed or built for a specific device. The same task keeps the same name, meaning and outcome on every device; geometry, input and chrome adapt. Each device gets an experience designed for it, on one shared system underneath.

## Shared across every device

- **Type:** the system font (SF Pro on Apple platforms, the system stack on the web), with optical sizing. Semantic text styles that grow with the person's text size (Dynamic Type on Apple platforms, `rem` on the web). Tracking follows size: slightly negative for display, about zero for body, slightly positive for small text and uppercase labels. Leading runs inversely to size (display about 1.05 to 1.15, body about 1.4 to 1.5). Body text stops at about 65 characters per line. Tabular numerals for figures that change or line up.
- **Icons:** one symbol per idea, the same on every device (SF Symbols on Apple platforms, a matching set on the web). Outline beside text, quiet grey unless the icon is the thing to press.
- **Targets:** at least 44 by 44 pt for touch; extend the hit area rather than enlarging the visual.
- **Appearance:** light and dark are equals. Respect Reduce Motion, Reduce Transparency and Increase Contrast, and check them before any milestone.
- **Feedback kinds:** status, completion, warning, error. Validate inline, not on submit.
- **Wayfinding:** where am I, where can I go, what is here, how do I get out. Specific labels ("Library") beat generic ones ("Home").
- **Brand assets:** the product's current mark and icons from the repository, never a redrawn or outdated version.
- **Agency:** prefer Undo to confirmation. Confirm only what is destructive and cannot be undone.

## iOS

- **Structure:** a tab bar for the top-level places, navigation stacks inside each, sheets for focused tasks. Pushed pages go back; sheets close. Keep the platform's push transition.
- **Navigation chrome:** the current system back button and toolbar materials. The primary action sits where the thumb reaches it, away from the way out.
- **Sheets:** the system sheet with detents for tasks that keep the context visible; a full-screen cover only for a task that takes over.
- **Lists and grouping:** inset grouped lists on a ground one step away from the cards (white on a light grey, about 1.12:1 in light mode).
- **Gestures:** swipe back from the leading edge always works. Every control presses on touch-down. State follows the finger during the gesture, not after it settles.
- **Haptics:** at the causal moment, never as the only feedback. Selection ticks for detents, a light impact when something snaps or commits, notifications for success and error.
- **Size:** design for the smallest supported iPhone first, then check the largest.

## iPadOS

- **Not a big phone.** Use the width: a sidebar or split view for navigation and content side by side, popovers instead of sheets for small choices, multi-column layouts where content allows.
- **Balanced composition.** Avoid an unrelated pair of panes; centred, balanced layouts read better than a narrow column stranded on a wide screen.
- **Every size class.** Full screen, split view, slide over and Stage Manager windows, both orientations.
- **Pointer and keyboard.** A trackpad and keyboard may be attached: hover effects as hints, keyboard shortcuts for frequent actions (shown in the shortcut overlay), focus that works.

## macOS

- **Settings windows:** a sidebar of sections (as in current System Settings) once there are more than three or four panes; toolbar tabs for a few. Either way, each pane is grouped content on white cards over the window's grey ground.
- **Native window structure:** standard window chrome and controls (close always top-left), a sidebar for places, a toolbar for actions on the current view, an inspector for detail. No custom window chrome.
- **Density:** a precise pointer allows denser layouts and smaller controls than touch, but the hierarchy stays as clear.
- **Menus:** every command lives in the menu bar with its shortcut; context menus repeat the relevant ones. Settings live in the Settings window, grouped into a few named sections ordered by importance, each with a short description.
- **Keyboard first:** everything reachable from the keyboard, with visible focus. Escape closes, Return confirms the default button. Keyboard-triggered actions never animate.
- **Hover and pointer:** hover reveals and highlights, but no action is reachable by hover alone.
- **Materials:** heavier material for structure (sidebar), lighter for interactive elements. A scroll-edge effect instead of a hairline, and only where chrome overlaps content.

## Web

- **Responsive, not shrunk:** designed layouts at phone, tablet and desktop widths, checked at 320 px and the widest layout, at 200% zoom, in both themes.
- **Touch and pointer coexist** (a tablet with a trackpad): use capability queries, never user-agent or width sniffing. Gate hover styles behind `(hover: hover) and (pointer: fine)`; touch gets `:active`.
- **Native feel on phones:** `-webkit-tap-highlight-color: transparent` with a real `:active` state on every control; `touch-action: manipulation`; inputs at 16 px or more so the page never zooms; the right keyboard (`inputmode`, `type`, `enterkeyhint`, `autocapitalize`); `100dvh` for app shells and `100svh` for heroes; `viewport-fit=cover` with `env(safe-area-inset-*)` on fixed bars; `overscroll-behavior` set on purpose; a `theme-color` per colour scheme.
- **Keyboard and focus:** every control reachable by Tab with a visible focus ring; Escape closes overlays; focus returns to the trigger.
- **Links and buttons:** a link goes somewhere, a button does something. Underlines only for links.
- **Performance is feel:** animate only `transform` and `opacity`, never `transition: all`, and test on a mid-range phone, not only a desktop.

Emil Kowalski's `mobile-native` and `apple-design` skills go deeper on the web and on Apple's design principles.
