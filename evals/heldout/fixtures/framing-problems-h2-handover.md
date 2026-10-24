# Offline sync: handover (written on my last day, sorry it's rushed)

Field inspection app, iPhone + iPad. Inspectors fill in checklists and take photos on site, often with no signal. Everything goes into the OQ and syncs when back online.

## Where we are

- OQ rewrite is on `sync-v2`. Checklists work end to end. Photos still go through the old path because the chunked upload isn't done (maybe 60%?).
- LWW on checklist fields is in and works. Photos have no conflict handling at all, if two people attach to the same item the second one overwrites. Haven't told anyone yet.
- QA tested iPhone only. iPad not tested. The split view on iPad uses a different save path I think.
- The Tuesday build has the new OQ behind the `sync_v2` flag, off for everyone except our test accounts.

## Numbers

- Sync failures affect ~12% of inspectors (from the pilot kickoff deck).
- 3 of the 40 pilot inspectors reported lost photos in September.
- Error logs: 212 failed syncs out of 9,800 attempts last month.

## Commitments

- I told the pilot inspectors' supervisor we'd have the photo fix by Nov 15.
- Release train: next cut is Nov 3, the one after is Nov 24. App review takes 1 to 2 days.

## Open stuff

- We sort of agreed to drop photo compression to save time? Need to confirm with design, I don't think it was written down.
- Backend lead wants to move the upload endpoint to the new storage service "at some point", which would change the chunked upload API.
- Retry policy: currently retries forever every 30 s. Battery complaints from 2 inspectors. Exponential backoff ticket exists, not started.

## People

- Backend lead: owns the upload endpoint.
- QA: one person, shared with two other teams.
- Design: owns the photo flow.
- Pilot supervisor: the person I made the Nov 15 promise to.
