# Recording: timeline header, "choppy when I scroll"

Product: Loomly, a photo journal app for Mac (SwiftUI). Timeline window with a parallax header that shifts as the list scrolls.
Reporter: on a 14-inch MacBook Pro (120 Hz ProMotion), release build from the beta channel.
Clip: timeline-scroll.mov, recorded with QuickTime at 120 fps, trackpad scroll of about 1.2 s.

| time_s | gap_ms | change (header region) | note |
| --- | --- | --- | --- |
| 0.500 | 8.3 | 1.9 | list and header moving |
| 0.508 | 8.3 | 0.0 | list moved, header did not |
| 0.517 | 8.3 | 2.0 | both moved |
| 0.525 | 8.3 | 0.0 | list moved, header did not |
| 0.533 | 8.3 | 2.1 | both moved |
| ... | ... | ... | the same alternating pattern for the whole scroll |

The list itself moves on every 8.3 ms frame. The header changes on every other frame.

Reporter's note: "Fine on my external 60 Hz monitor. Choppy on the laptop screen."
Developer's note: "I tried it in a debug build on my 60 Hz iMac and it's smooth, so maybe it's the reporter's machine. Could be the Simulator would show it?"
Oldest supported Mac: 2019 13-inch MacBook Air (60 Hz).
