# What to vary, and how to build each control

Read this before building controls or planning a hunt. People (nothing yet, thin, typical, maximum, messy), edge content and edge devices are defined in [../walking-personas/PERSONAS.md](../walking-personas/PERSONAS.md); seed and vary those from there. This file covers the system around them. If `walking-personas` is not installed, seed at least nothing, one item, typical and the cap, with the longest realistic content, on the smallest and largest supported screens.

**Contents:** the axes · combinations most likely to break · controls on the web · on iPhone and iPad · on the Mac · on the server · turning breaks into checks

## The axes

| Axis | Values to try |
| --- | --- |
| Data | None, one, typical, the cap, past the cap; edge content from PERSONAS.md; emoji and pasted rich text; 0, negative, huge and fractional numbers |
| Network | Offline, slow (high latency, low bandwidth), dropped mid-request, back online, captive portal |
| Server | Error responses, timeouts, partial or out-of-order data, a slow dependency, a rate limit, a newer or older API version |
| Session | Expired mid-action, signed out on another device, account deleted, role changed |
| Time | A time zone change, daylight saving switch, midnight and month end, a device clock far ahead or behind, a long gap since the last open |
| Place and language | Other locales and number formats, a region where the feature is not offered; longer translations and the other reading direction as in PERSONAS.md |
| Permissions | Never asked, denied, granted then revoked, limited (selected photos, approximate location), off at system level |
| Device | Edge devices from PERSONAS.md; dark mode, Reduce Motion, Reduce Transparency, low storage and low battery |
| Interruption | Back during a save, a double tap, the app killed or backgrounded mid-flow, a call or notification, rotation or resize, the keyboard covering the action |
| Concurrency | Two people editing the same thing, the same person on two devices, a change arriving while someone types, a retry landing after success |

## Combinations most likely to break

Run these pairs first; each has broken real products many times.

- Anything saved, meeting a dropped network or an expired session.
- Anything shared or synced, meeting concurrency or offline editing.
- Anything timed (reminders, streaks, schedules, "today"), meeting a time zone change, midnight or daylight saving.
- Anything gated by a permission, meeting denied, revoked or limited.
- Any list or total, meeting none, one or the cap.
- Any flow, meeting an interruption and a return.

## Controls on the web

- **People and data:** URL parameters or a debug panel that load a seeded persona (`?persona=maximum&seed=42`), backed by seed scripts against a test database.
- **Network and server faults:** intercept requests at the boundary, for example a test proxy or service worker in the app, or Playwright's `page.route` and `context.setOffline(true)` in tests; throttle with browser developer tools.
- **Time, place and permissions:** in tests, Playwright's `page.clock` for time, and browser context options for `locale`, `timezoneId`, `geolocation` and `permissions`; in the app, an injectable clock rather than calls to the system time.
- **Device:** viewport presets, 200% zoom, forced colours and `prefers-reduced-motion` emulation.

## Controls on iPhone and iPad

- **People, data and faults:** launch arguments and environment variables read in debug builds only (`-persona maximum`, `-fail-sync timeout`), plus a debug menu in debug builds; network faults through a custom `URLProtocol` in debug builds; slow networks through the Network Link Conditioner.
- **Permissions:** `xcrun simctl privacy booted grant|revoke|reset <service> <bundle-id>`.
- **Device state:** `xcrun simctl ui booted appearance dark`, `xcrun simctl ui booted content_size <size>`, `xcrun simctl status_bar booted override ...`, `xcrun simctl location booted set <lat>,<lon>`, `xcrun simctl push booted <bundle-id> <payload.json>`.
- **Time:** an injectable clock in the app; never rely on changing the simulator's own clock.

## Controls on the Mac

- Launch arguments and `defaults write <bundle-id> <key> <value>` for debug settings; window size presets; the Network Link Conditioner; a debug menu in debug builds.

## On the server

- Per-request fault flags honoured only in test environments (a header that forces a timeout, an error or a slow response).
- Seed scripts that build each persona from scratch, idempotent and rerunnable.
- An injectable clock, so time can move forward in a test without waiting.

## Turning breaks into checks

- **One check per break,** driving the same control: Playwright for the web, XCUITest for iPhone, iPad and Mac, integration tests for the server.
- **Seen failing first** on today's code, then passing on the fix; record both runs.
- **Generated input** where the input space is large: a property-based testing library for the stack, with the failing case kept as a fixed regression test.
- **Name each check after the break** ("shared list keeps an edit made offline when another member deletes the item"), so a failure reads as the person's problem.
