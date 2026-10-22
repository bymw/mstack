# Recording: onboarding carousel, "dots feel laggy"

Product: Dayleaf, a journaling app (web, installed to the iPhone home screen).
Recorded by: a tester, on iPhone 13 mini, iOS 18, using the home-screen web app (not a Safari tab).
Clip: onboarding-dots.mov, 60 fps screen recording, 4.0 s.
Gesture: one swipe from card 1 to card 2.

## What the frames show (extracted with frames.swift, --from 1.8 --to 3.0)

| time_s | gap_ms | change | what is on screen |
| --- | --- | --- | --- |
| 1.90 | 16.7 | 0.4 | card 1 at rest, dot 1 filled |
| 1.95 | 16.7 | 3.1 | finger down, card 1 starts moving left |
| 2.08 | 16.7 | 6.8 | finger lifts, card 2 about 60% in view |
| 2.20 | 16.7 | 4.2 | card 2 about 90% in view, dot 1 still filled |
| 2.31 | 16.7 | 1.0 | card 2 fully in view and settled, dot 1 still filled |
| 2.31 to 2.76 | 33.4 to 150.0 | 0.0 | nothing moves |
| 2.76 | 450.0 | 2.6 | dot 2 fills, dot 1 empties (one-frame change) |
| 2.78 | 16.7 | 0.0 | at rest |

No frame gap exceeds 16.7 ms while the card is moving.

## Tester's note
"Swiping itself is smooth, it's the dots. They feel like they're thinking about it. In Chrome on my laptop it seemed fine."
