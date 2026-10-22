# Notes app: "Make it shorter" (current build, with testers)

**Entry point.** A sparkle icon on a purple-to-pink gradient pill with a soft glow, labelled "Make it shorter", in the note toolbar.

**Behaviour.** Tapping it shows a spinner for about 4 seconds, then replaces the note's text in place with the result. The original text is not stored and there is no Undo.

**Again.** Tapping the action a second time on the shortened note shows a toast: "This already reads well."

**First use.** A one-time sheet says: "Your notes never leave your device."

**Implementation.** The iOS app calls the model provider's API directly over HTTPS. The API key is in the app bundle (Config.plist) so testers can use it without an account. Every request uses the largest model the provider offers.

**Quality.** Shipped to testers on Monday after the internal demo went well. There is no test set and no written pass mark.

**Sample from a tester:**

Original note:
> Garden club, Saturday 9:30 at the community hall. Bring gloves and the spare trowel. Seed swap starts at 11, bring labelled envelopes. Parking is behind the library, not the hall.

Result after "Make it shorter":
> Garden club Saturday at the hall. Bring gloves. Seed swap at 11.
