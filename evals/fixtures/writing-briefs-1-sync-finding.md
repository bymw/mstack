# Engineering note: sync conflict in the notes app

Written by the sync engineer for the team. Launch of version 2 (shared notebooks) is planned for 14 November.

## What happens
If the same note is edited on two devices while one of them is offline, the device that syncs last wins and the other device's edits are dropped without any warning. Reproduced in QA on iPad + iPhone, 5 out of 5 attempts.

## Why
SyncEngine.merge() resolves conflicts last-writer-wins at note level, not per paragraph. Shared notebooks (the v2 headline) will make two people editing the same note far more common.

## Evidence
- Support has 4 tickets this month mentioning "lost text" (TCK-1182, TCK-1190, TCK-1204, TCK-1211). Not yet confirmed they are this bug.
- Someone in the team channel guessed "probably 5% of users hit this". No data behind it.

## Options
A. Ship 14 Nov as is.
B. Ship 14 Nov with shared notebooks turned off; ship them once the fix lands.
C. Move the whole launch until the fix lands.

Fix: paragraph-level merge plus a "kept both versions" notice. Estimate 2 to 3 weeks (my estimate, not reviewed by the team).

## The question
The VP of Product asked in chat: "Is the sync thing serious, and do we need to move the launch?"
