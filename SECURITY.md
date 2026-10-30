# Security checklist

Last reviewed October 29, 2026. The app is one web page on GitHub Pages; accounts, synced gardens, messages, Growing Circles and saved reports live in Supabase. Every table is protected by row-level security, so the database itself decides who can read or change each row, even if someone skips the app.

## Do these once (only you can)

1. **Run the security update.** In Supabase, open SQL Editor, choose New query, paste everything from `security-update.sql`, and press Run. The last result lists each table; every row should say `true`. It is safe to run again.
   Then do the same with `circles-update.sql` (Neighbor Exchange: neighborhoods, replies, claims, private messages and post photos).
2. **Turn on email confirmation.** Authentication → Sign In / Providers → Email: keep "Confirm email" on.
3. **Lock the sign-in addresses.** Authentication → URL Configuration: set Site URL to `https://thegardenfolks.com` and list only your own addresses under Redirect URLs.
4. **Keep the admin's authenticator app on.** The admin only counts as admin after the authenticator step. Save the recovery codes somewhere safe, away from your phone.
5. **Check sign-in rate limits.** Authentication → Rate Limits: keep the defaults or lower them. Turn on bot protection (CAPTCHA) if it's offered on your plan.
6. **Leaked-password protection.** If your Supabase plan offers it (Authentication → Passwords), turn it on.
7. **Protect text-message sign-in from fraud.** In Twilio: Messaging → Settings → Geo permissions, allow the United States only. Set a monthly spending limit or alert. Scammers trigger floods of codes to expensive numbers ("SMS pumping"), and these two settings stop it.
8. **Two-step sign-in everywhere.** Turn on two-factor sign-in for GitHub, Supabase, Twilio, your domain registrar and the email account they all send to.
9. **Never share these.** The Supabase `service_role` key and the Twilio Auth Token never go in the app, a chat, an email or GitHub. If one ever leaks, rotate it in that service right away.
10. **Backups.** Supabase backs up paid projects daily. On the free plan, download a copy now and then (Database → Backups, or Table Editor → Export).

## What the app does

- **Database rules:** each customer reads only their own garden, entries and messages; only the admin (after the authenticator step) can change gardens or read the interest list. Saved reports are readable only by the account that saved them, and they are encrypted before upload.
- **Growing Circles:** members see the members of their own circles only (everyone sees how many members a circle has). Only the circle's creator or the admin can hide or un-flag a post. Members can't make themselves leaders.
- **Neighbor Exchange:** a neighborhood's posts, photos and replies are visible only to its members. A ZIP code search shows signed-in people the neighborhood names and post titles there, never names, details or photos. Private messages can be read only by the two neighbors, and by the admin only after one of them reports it. Only a member can claim an offer, only for themselves. Each person can post at most 30 times and send 150 replies and 150 messages a day. The same neighborhood name can't be made twice in one ZIP code.
- **Invite links** use long random codes and stop working after 60 days if nobody claims them.
- **The public interest form** accepts at most 20 sign-ups every 10 minutes and limits the length of every field.
- **Size limits** stop any one account from filling the database.
- **Content Security Policy:** the page may only load scripts from itself (and the receipt reader from jsdelivr), and may only send data to Supabase and the weather, map and photo services it uses. Injected code can't send data anywhere else.
- **Text from people is escaped** before it's shown, so names, notes and messages can't run code. The report editor keeps only plain text from pastes, and saved reports are cleaned before they're shown again.
- **No outside libraries** are loaded except the receipt reader, which loads only when someone scans a receipt.
- **Privacy by design:** no street addresses, apartment numbers or payment details are stored; photo location data is removed; the microphone is never used; the camera turns on only after a warning.

## Limits to know

- GitHub Pages can't send security headers, so the policy is set with a `<meta>` tag. That can't stop another site from showing the app inside a frame. Moving to a host such as Cloudflare Pages or Netlify would allow those headers.
- The page allows its own inline scripts (it's a single file), so the Content Security Policy limits where data can go more than it limits what can run.
- This is a careful review, not a professional penetration test. Before many paying clients use it, a paid test is worth considering.
