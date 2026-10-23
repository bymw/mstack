---
name: optimizing-discoverability
description: "Makes websites, web apps and landing pages easy to find, read and cite by search engines and AI assistants (Google, Bing, ChatGPT, Claude, Perplexity): content readable without JavaScript, deliberate crawler policy, titles and metadata, structured data, images and speed, checked against current official guidance. Use when building, launching or auditing a public page, or asked about SEO, AI search or llms.txt. Not for App Store listings."
license: MIT
---

# Optimizing discoverability

A page nobody can find does not exist, and a page an assistant cannot read never gets cited. Search engines and AI answer engines now draw on the same foundations: a page that is crawlable, indexable, fast, clearly written and honestly described is eligible everywhere. Most of what is sold as "AI optimization" is the same work under a new name, and some of it is folklore. This skill does the real work, checked against what Google, Bing, OpenAI, Anthropic and others currently publish.

This skill covers being found, read and cited: crawling, indexing, metadata, structured data, crawler policy, media and speed. The words on the page come from `writing-ux-copy`, its layout from `designing-visuals`, and requirements for builders from `writing-specs`. The numbers, limits and their sources are in [SIGNALS.md](SIGNALS.md); crawler names, robots.txt patterns and the status of llms.txt and newer standards are in [CRAWLERS.md](CRAWLERS.md). Read both before auditing or building.

## Two failure modes, and the first is worse

1. **Invisible or misread.** The main content exists only after JavaScript runs, AI search bots are blocked by robots.txt or a CDN default, a stray `noindex` or wrong canonical removes the page, the title lives in an image. Nothing else matters until a crawler can read the page.
2. **Optimizing for folklore.** Keyword stuffing, a page for every query variant, FAQ markup for rich results that no longer exist, text chopped into fragments "for AI", dates bumped without changes, llms.txt or a vendor score treated as a lever. It wastes the work, and some of it breaks spam policies that now cover AI answers too.

## Rules

1. **People first, one page per intent.** Each page answers one need with first-hand, specific content, the key facts near the top. There is no ideal length and no word count to hit. Why: every major engine says relevance and helpfulness win, and its AI features are built on the same ranking systems.
2. **Readable without JavaScript.** The main content, links (`<a href>`), title, canonical and robots rules are in the HTML the server sends; render on the server or pre-render. Meaningful status codes: a missing page returns 404, not a 200 with "not found". Why: many AI crawlers fetch scripts but do not run them, and Google may skip rendering a page marked `noindex` or not returning 200.
3. **Decide crawler policy on purpose.** Treat search agents, training agents and user-triggered fetchers separately, using the names in CRAWLERS.md, and check the CDN or firewall as well as robots.txt. Whether to allow training is the owner's call (`settling-decisions`); search and user agents stay allowed unless the owner says otherwise. Why: blocking a training agent rarely costs visibility, while blocking a search agent or a CDN default can make a site vanish from AI answers.
4. **Titles and descriptions describe this page.** Unique per page, specific, with the site name at the start or end, and the title matching the most prominent visible heading. Typical display lengths are guidance for how they look, not rules. Why: engines rewrite vague or duplicated titles and descriptions, and missing ones can reduce eligibility for AI grounding.
5. **One canonical URL per page,** the same in redirects, `rel=canonical` and the sitemap; never canonicalize with robots.txt or `noindex`. Localized pages carry complete, reciprocal `hreflang`. Why: conflicting signals split a page into duplicates that rank and get cited as neither.
6. **Structured data matches what is visible.** JSON-LD for types the engine still supports (SIGNALS.md), Organization and WebSite on the home page, every required property, no invented reviews or ratings. It earns rich results; it is not required for AI answers and guarantees nothing there. Why: markup that disagrees with the page is a policy violation, and markup for retired features is wasted.
7. **Passages that stand on their own.** Name the product, people and places explicitly and consistently, state facts and definitions plainly, date what changes, use a table when the data is tabular. Do not chop text into fragments or write in a special style "for AI". Why: clear passages help readers and grounding alike; artificial chunking and phrasing are named as myths by Google.
8. **Images and media that crawlers can index and pages that stay fast.** Content images are `<img>` with contextual alt text, width and height, AVIF or WebP with a fallback, and `srcset`; the main image loads eagerly with `fetchpriority="high"`, everything below the fold lazily. Video has a stable watch page, captions and a transcript. Why: CSS background images are not indexed, and a lazy-loaded hero slows the largest paint.
9. **Fast and stable for real people.** Meet the Core Web Vitals thresholds at the 75th percentile of field data on mobile and desktop, keep each HTML, CSS and JavaScript file well under the crawler size limit, with critical content early. Why: speed is a ranking input that never beats relevance, but a slow, jumpy page loses the people who arrive.
10. **Sharing and identity metadata are complete:** Open Graph with a 1200×630 image and its alt text, a crawlable PNG or ICO favicon, and a web app manifest for apps. Why: the share card and the icon are the page's first impression in chats, search results and AI answers.
11. **Fresh means changed.** Update content when facts change, keep `lastmod` accurate, notify Bing-family engines with IndexNow, and never change a date without changing the page. Why: engines reward real freshness and treat cosmetic date changes as a warning sign.
12. **Measure with the engines' own tools.** Search Console (including its generative AI report), Bing Webmaster Tools (including AI Performance) and server logs for bot fetches; no third-party tool sees inside an engine's ranking or AI systems. Why: guesses about AI visibility are cheap and usually wrong.
13. **Guidance moves; date every claim.** Every number in SIGNALS.md and CRAWLERS.md carries the date it was checked. Before stating one as current, recheck any source older than about six months, and say what was verified and when. Why: crawler names, supported markup and AI controls changed several times in 2025 and 2026 alone.

## Method

1. **List the pages and their intent:** one line per page saying what it answers and for whom.
2. **Fetch each page as a crawler:** the raw HTML from the server, its status code, title, canonical, robots rules and whether the main content and links are present without JavaScript.
3. **Check access:** robots.txt and the CDN or firewall settings against CRAWLERS.md, and that sitemaps list only canonical URLs.
4. **Check metadata and structured data** against SIGNALS.md, and validate markup with the engine's own testing tool.
5. **Check media and speed:** images, video, field Core Web Vitals and file sizes.
6. **Read the content as a person and as a passage:** one intent, facts early, entities named, nothing hidden behind interaction.
7. **Check measurement:** Search Console and Bing Webmaster Tools are verified, and logs can show bot fetches.
8. **Report, then hand off:** fixes go to the skill or builder that owns them; the crawler-policy decision goes to `settling-decisions`.

## Output

**Headline:** one sentence, for example "Pricing page: invisible to AI crawlers (content renders in JavaScript), 3 High, 4 Medium, 2 Low."

**Findings,** grouped under High (cannot be crawled, indexed or cited, or breaks a policy), Medium (weakens ranking, snippets or sharing) and Low (polish):

| Finding | Where | Fix | Source, checked |
| --- | --- | --- | --- |

**For a new page or site,** the same checks as a launch list with each item ticked or open. **Not verified:** anything that needs field data, a live crawl or access the audit did not have.

## Gotchas

| Instead of | Do |
| --- | --- |
| Content that appears only after JavaScript | The main content in the server's HTML |
| "Block all AI bots" | Search, training and user agents decided separately, CDN included |
| Google-Extended to keep out of AI Overviews | `nosnippet`, `noindex` or Search Console's generative AI control |
| FAQ or HowTo markup for rich results | Supported types only; FAQ results ended in 2026 |
| llms.txt as the AI strategy | Crawlable, indexed, clear pages; llms.txt optional for docs |
| Text chopped into fragments for AI | Clear sections and headings people can read |
| A page for every phrasing of a query | One strong page per intent |
| Bumping dates to look fresh | Change the content, then the date |
| The hero image lazy-loaded or as a CSS background | An eager `<img>` with `fetchpriority="high"` |
| A vendor's "AI visibility score" | Search Console, Bing AI Performance and server logs |

## Works with

- `crafting-products`: truth before polish, applied to how a page describes itself.
- `writing-ux-copy`: titles, descriptions, headings and alt text are interface words.
- `designing-visuals`: the hero image and layout that stay fast and stable.
- `writing-specs`: discoverability requirements and checks in the spec, before the build.
- `breaking-experiences`: crawler fetches and status codes kept as automated checks.
- `settling-decisions`: whether to allow AI training is the owner's call.
- Outside the set: Google Search Central, Bing Webmaster Guidelines, OpenAI's and Anthropic's crawler documentation, web.dev and MDN.
