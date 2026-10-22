# Walk report excerpt: Repwise (iPhone and iPad), simulation gaps

The simulation panel offers three presets: `repwise://sim?preset=new`, `active` and `power`.

Cannot simulate:
1. **Set up, no workouts.** Onboarding always adds a "Sample workout", so this persona never exists. The spec's "Start your first workout" screen has never been seen.
2. **Messy.** No preset produces failed syncs, a broken streak or an expired Health access grant.
3. **Maximum with long names.** The power preset caps routines at 30 but uses short names only.

Researcher: "I need these for next week's usability round, on a TestFlight build."

Codebase notes: onboarding lives in `OnboardingCoordinator.swift`; sync in `SyncService.swift` (URLSession); Health access in `HealthBridge.swift`; the sim panel in `SimPanel.swift` (compiled only in Debug and TestFlight configurations).
