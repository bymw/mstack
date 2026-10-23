# Proposal from our growth contractor: "AI visibility sprint" for the Fieldnote docs site

Fieldnote is a note-taking app; its documentation lives at docs.fieldnote.app (server-rendered, about 140 pages, already indexed in Google and Bing).

Proposed work, in order:
1. Add /llms.txt and an llms-full.txt with every page concatenated, as "the robots.txt for AI".
2. Rewrite every docs page into chunks of no more than 75 words, each under its own H3 phrased as a question, because "LLMs only read small chunks".
3. Add FAQPage schema to all 140 pages to "win rich results and AI Overview citations".
4. Generate 600 new pages, one per long-tail question variant from our keyword tool ("how to export notes on mac", "export notes mac os", "fieldnote export to pdf mac"...), using AI.
5. Update the "last updated" date on every page each Monday so engines see the site as fresh.
6. Add `<meta name="robots" content="noarchive">` site-wide "to protect our content" while staying visible in Copilot.
7. Buy the contractor's "AI visibility score" dashboard to track progress.

We'd like a clear yes or no on each item, with what to do instead where it's a no.
