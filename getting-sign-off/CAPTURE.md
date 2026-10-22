# Capturing real screens for both sides

Read this when you reach steps 2 and 3. The web rig below was learned on a component-based web prototype rendered inside a device canvas; native apps follow after it. Adapt the selectors to the project you are in.

## The rig on the web

- **Drive the running dev server with Playwright** (or the in-app browser for a handful of shots). Set the viewport so the screen renders at 1:1: the device's real width for a responsive page, or, for a canvas that draws a device inside a page, a viewport large enough to leave it at scale 1 (1600×1100 leaves a 375×812 phone at scale 1).
- **Screenshot the device element or the viewport, not the whole page:** `page.locator('<screen selector>').screenshot({ type: 'jpeg', quality: 85 })` with `deviceScaleFactor: 2`.
- **Record rings as you capture.** Read `getBoundingClientRect()` of the element that changes, minus the screen element's own rect, so they are in screen points. Store them with the row.
- **Keep the rig out of the product.** Name probe scripts `_probe-*.mjs`, check they are gitignored, and delete your own files by name when done. Never use a glob, because some probe files in a repo may be tracked.
- **Persona, state and brand** usually come from query parameters or local storage. Set them before the first navigation, and set the same ones for both sides.

## iOS and iPadOS apps

- **Run the app in the Simulator** on the device the row needs (the smallest supported iPhone, an iPad in the size class that matters), with the same account, data and state on both sides. Use launch arguments or a debug menu to set state; never hand-edit it.
- **Capture:** `xcrun simctl io <udid> screenshot b-<id>.png`, then convert to JPEG. Set the status bar to a clean, identical state first: `xcrun simctl status_bar <udid> override --time 9:41 --batteryState charged --batteryLevel 100`.
- **Rings** come from the view's frame in points, read with the view debugger or an accessibility query, not guessed from pixels.
- **The proposed side** is a build of a branch, or a SwiftUI preview of the real view with the change, rendered at the same device size.

## macOS apps

- **Capture one window, not the screen:** `screencapture -l <window-id> -o b-<id>.png` (find the window id with a short Swift call to `CGWindowListCopyWindowInfo`), at the same window size and position on both sides. `-o` drops the shadow so the pair aligns.
- **Same appearance, same accent colour, same window size** on both sides; check light and dark if the row is about colour or material.
- **The proposed side** is a branch build, or a SwiftUI preview of the real view at the same size.

## Making the proposed side on the web, in order of preference

1. **A CSS override** for a token, spacing, colour or radius change: inject a `<style>` with the new values. This is the most honest form, because it is exactly what the build will do.
2. **DOM edits in place.**
   - Hide app-owned nodes with `style.display = 'none'`. Never remove them: React and similar frameworks will crash on their next render.
   - Insert new nodes built from the product's own class strings, harvested from an existing element that already looks right.
   - Copy markup from a sibling rather than writing it by hand.
3. **Real components rendered in the page.** This works when the dev server exposes modules.
   - Find the exact dependency URLs the app loaded: `performance.getEntriesByType('resource')`, for example the framework's runtime and renderer bundles in the dev server's dependency cache, with their version hashes.
   - Import them by those exact URLs, so your components share the app's single runtime instance.
   - Then import the component by its path, insert a host node after the hidden original, and mount the component there with the framework's own render call.
4. **A branch build.** If none of the above can show the change honestly (a new flow step, a motion change, a layout the DOM cannot fake), build it on a branch, run that branch's server on another port, and capture there.

Do not edit product source files just to take a capture. Safety checks may refuse it, and it leaves the working tree dirty. Use the page-level methods, or a branch.

## Traps

- **Hidden copies.** `getByText(...).first()` can hit a hidden copy under a flow. Tap by role and accessible name.
- **Animations caught mid-move.** Wait for motion to settle. To freeze a CSS animation for a still, take `document.getAnimations()`, then `pause()` each one and set its `currentTime`. Two trees frozen at the same moment diff pixel for pixel.
- **Dark mode.** It may be a class on `html` rather than `prefers-color-scheme`. Check how the app switches before emulating.
- **Sign-in gates and cold modules.** Wait until the app, not a loading or sign-in screen, is showing. The first tap on a dev server carries module loading time.
- **The in-app browser pane.** When hidden it stalls `requestAnimationFrame` and pauses CSS animations, and it can reopen narrow, which triggers mobile fallbacks. Set the size explicitly and use timers, not rAF.
- **Fonts.** `-apple-system` alone may not resolve in headless Chromium. Check that the captured type matches the device before trusting a type comparison.
