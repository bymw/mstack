# Fitness tracker app: notes that came with the export

## Message from the head of product (Monday)

> Conversion fell from 15% to under 10% in three weeks. I think the new annual price we introduced in W37 did this. I want answers by Friday and a plan to fix pricing.

## Growth dashboard definition

- Conversion = paid_conversions / trials_started, per week, all platforms combined.
- trials_started counts every trial event the apps send.

## Finance weekly report (W40)

- "Install-to-paid conversion is flat at 4.1% for the eighth week running."
- Finance's conversion = paid subscriptions / app installs.

## Release notes

- Android 4.2 (released start of W38): new onboarding screens; analytics moved to the new event schema, where the trial event is called `trial_start`.
- iOS 5.7 (released start of W37): bug fixes.

## Engineering channel, W39

> Android dev: during the schema migration the legacy `trial_started` event is still firing next to the new one. Removing it is planned for 4.3.

## Pricing

- New annual price introduced in W37 on the web checkout only. App store prices did not change.
- The export above covers the Android and iOS apps only.
