# Shared folders: decisions so far

Product: Quill, a notes app on iPhone, iPad, Mac and the web.

Direction (agreed last week): let a person share one folder with up to 10 people so a household or small group can keep notes together. Chosen over sharing single notes, because interviews showed groups keep 5 to 20 related notes (trip plans, a renovation) and re-share each note one by one today.

Outcome (from the outcomes session): share of shared folders where at least two people edit within 14 days. Countermetric: notes deleted by someone other than their author, limit 2% of edited notes.

Known facts
- 38% of support tickets last quarter were "how do I share several notes at once".
- Notes sync through the existing sync service; conflicts today are last-write-wins per note.
- Sharing must work offline-first: edits made offline sync when back online.

Agreed
- Two roles only: can edit, can view.
- The folder owner can remove people; removed people lose access immediately.
- No public links in this version.

Still open
- What happens to a shared folder when its owner deletes their account.
- Whether nested folders inside a shared folder are shared too.

Appetite: 6 weeks, one team. Two builders and one coding agent will build it.
