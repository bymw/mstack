# Bike-sharing app: AI-drafted support replies, last 30 days

Every incoming support chat gets an AI-drafted reply. An agent sends it as is, edits it, or discards it.

## By reply type

| Reply type | Drafts | Sent unchanged | Edited | Discarded | Mean model confidence | Most common edit |
| --- | --- | --- | --- | --- | --- | --- |
| Ride receipt resent | 512 | 498 | 12 | 2 | 0.97 | Greeting |
| "We received your photos, a teammate will review them" | 301 | 296 | 3 | 2 | 0.96 | None |
| "Your refund of €X is approved" | 220 | 31 | 176 | 13 | 0.93 | Wrong amount, or refund not yet approved |
| "Bike fault noted, you won't be charged for the damage" | 88 | 10 | 61 | 17 | 0.91 | Removed "you won't be charged" |
| "Your account is unlocked" | 140 | 120 | 15 | 5 | 0.95 | Account was not unlocked yet |
| Rider reports an injury | 9 | 0 | 3 | 6 | 0.88 | Agent phoned the rider instead |

## Intake bot

Before the draft is written, an intake bot reads the chat and fills in the booking number and bike number. In a sample of 50 chats it got the bike number wrong 7 times and the booking number wrong 2 times. The drafts use these fields.

## From the operations lead

> The model is 94% accurate on our internal benchmark. Agents spend half their day pressing Send on drafts. Let it send on its own.
