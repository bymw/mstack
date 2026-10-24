# Whiteboard app: invite a teammate (as built today)

Platforms: web app (desktop and mobile browsers), iPhone and iPad apps. Teams are on a paid plan with a fixed number of seats.

## Steps

1. **Admin invites.** Team settings → Members → Invite. The admin types one or more email addresses and presses Send. The dialog closes. The member list does not show pending invites.
2. **Email.** The invitee gets "You're invited to join {team name}" with a button "Accept invite". The button opens a web link `/invite/{token}`.
3. **Opening the link.**
   - Signed in on the web: they join the team and land on the team's board list.
   - Not signed in: they see the sign-up page with the invite email prefilled. The email field can be edited, but sign-up only joins the team if the email matches the invite exactly.
   - There is a "Log in" link on the sign-up page. Logging in with a different account than the invited email shows the person's own boards; the invite is not applied.
4. **After sign-up.** Email verification is required. The verification email links to the web app's home, which is the "Create your first board" screen. The invite is applied in the background, but the team only appears after a page refresh.
5. **Expiry.** Invite tokens expire after 48 hours. An expired link shows a page with the text "Invalid link" and nothing else.
6. **Phones.** The iPhone and iPad apps don't handle invite links yet, so links open in the mobile browser. Mobile web shows a full-screen "Get the app" page with a store button; there is a small "Continue in browser" link at the bottom.
7. **Seats.** If the team has no free seats, accepting the invite fails without a message and the person lands on their own (empty) board list.
8. **Admin side.** Admins get no notification when an invite is accepted, expires or fails.
