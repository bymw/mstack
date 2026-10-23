# Recipe app: duplicate push notifications, last night

## Service log (simplified)

```text
19:02  deploy notifications-service v88  config: provider_timeout 10s -> 2s
19:30  job "Tonight's dinner idea" started  devices_targeted=52300
19:30  provider latency p95=3.1s
19:36  provider latency p95=3.0s
19:41  provider latency p95=0.4s
19:44  job finished
       devices by send attempts: 1=48180  2=1210  3=830  4=760  5=540  6=780
       every attempt sends with a new message_id (no duplicate key)
       devices with more than one notification: ios=1980 android=2140
19:58  on-call paged by support
```

Provider status page, 19:28 to 19:43: "Degraded performance: elevated latency." No outage was posted.

Support: 37 tickets about repeated notifications, 33 from Android users and 4 from iOS users.

## What three people wrote this morning

> Backend engineer: The push provider had an outage last night. Nothing on our side.

> Mobile engineer: Looks like an Android bug. The app must be showing the same notification several times.

> Support lead: Only Android users were affected.
