# Signals, limits and their sources

Read this when auditing or building a public page. Each line is marked **[O]** official guidance, **[P]** common practice no engine requires, or **[W]** weak or unproven. Sources were checked on 2026-10-23; recheck any older than about six months before calling it current.

**Contents:** what engines say about AI answers · crawling and indexing · titles, descriptions and robots rules · canonical, hreflang and sitemaps · structured data · images and video · speed and size · sharing and identity · content and policies · measurement · sources

## What engines say about AI answers

- **[O] Google AI Overviews and AI Mode** use the normal index and ranking systems. A page needs to be indexed and eligible for a snippet; there are no extra technical requirements, no special markup and no AI text files. Google calls "AEO" and "GEO" still SEO. (Google AI optimization guide, updated 2026-07-10)
- **[O] Google myths list:** chunking text into small pieces, writing in a special style for AI, llms.txt, and seeking inauthentic mentions do not help. Pages built for every fan-out query variant can be scaled content abuse. (same)
- **[O] Bing and Copilot** share one crawling, indexing and ranking foundation; SEO fundamentals apply to grounding. Bing asks for explicit facts and definitions, consistent entity names, one topic per URL, key information early, headings and semantic HTML. (Bing Webmaster Guidelines, rewritten about 2026-02)
- **[O] ChatGPT search** needs `OAI-SearchBot` allowed and the host or CDN not blocking OpenAI's published IPs; it also uses search partners. Placement is not guaranteed. (OpenAI help, about 2026-10)
- **[W] What drives citation:** relevance and topical match are the most reproducible factors. Lab studies show statistics, quotations and structure shift credit once a page is already retrieved, but no technique shows a stable cross-platform effect on being retrieved in the first place. (arXiv 2311.09735; survey arXiv 2607.14035, 2026-07)

## Crawling and indexing

- **[O]** Googlebot processes the first **2 MB of each HTML, CSS or JavaScript file, uncompressed**; other Google crawlers default to 15 MB, PDFs 64 MB. Keep critical content and links early; avoid huge inline JSON or hydration payloads. (Google crawler overview, 2026-02 clarification)
- **[O]** Server rendering or pre-rendering is recommended because not every bot runs JavaScript. Only `<a href>` links are discovered; use the History API, not URL fragments. (JavaScript SEO basics, 2026-03-04)
- **[O]** Google may skip rendering a page marked `noindex`, so removing `noindex` with JavaScript may not work; non-200 pages may not be rendered. (2025-12 to 2026-03)
- **[O]** Single-page apps: send soft 404s to a real 404 URL or add `noindex`.
- **[O]** Mobile-first: mobile and desktop carry the same content, headings, structured data, titles, descriptions and robots rules; never lazy-load primary content behind a swipe, click or typing. (2025-12-10)
- **[O]** Gzip, deflate and Brotli are supported; HTTP/2 has no ranking benefit; ETag is preferred for caching. (2026-06-12)
- **[W]** Several AI crawlers have been observed fetching JavaScript files without running them. (Vercel crawl-log study, 2024-12)

## Titles, descriptions and robots rules

- **[O]** `<title>`: unique, descriptive, site name at start or end with a delimiter, matching the most prominent visible heading; no stuffing, no "Home". Google sets no length limit and truncates as needed. (Title links, 2025-12-10)
- **[O]** Meta description: unique, page-specific, with concrete facts (author, date, price); no length limit; Google often writes the snippet from page content instead. (Snippets, 2026-04-20)
- **[P]** About 50 to 60 characters for titles and 150 to 160 for descriptions fit common displays.
- **[O]** Robots rules Google supports: `noindex`, `nofollow`, `none`, `nosnippet`, `indexifembedded`, `max-snippet:N`, `max-image-preview:[none|standard|large]`, `max-video-preview:N`, `notranslate`, `noimageindex`, `unavailable_after`. Ignored: `noarchive`, `nocache`. (2026-03-24)
- **[O]** `nosnippet` and `max-snippet` also limit use as direct input to AI Overviews and AI Mode; `data-nosnippet` works on `span`, `div` and `section` only and must not be toggled with JavaScript.
- **[O]** At Bing, `NOARCHIVE` keeps a page out of Copilot and grounding, and `NOCACHE` limits Copilot to URL, title and snippet. (Bing guidelines, 2026-02)

## Canonical, hreflang and sitemaps

- **[O]** Canonical strength: redirects, then `rel=canonical`, then the sitemap. Absolute URLs, one per page, the same everywhere; on JavaScript sites the canonical is in the HTML and never changed by script. (2026-07-10)
- **[O]** `hreflang`: one method only; each page lists itself and every alternate with return links; ISO 639-1 language, optional ISO 3166-1 region ("en-GB", never "UK"); include `x-default`. (2026-09-21)
- **[O]** Sitemaps: up to 50 MB uncompressed or 50,000 URLs per file, then a sitemap index; absolute UTF-8 URLs; `lastmod` used only when consistently accurate; `priority` and `changefreq` ignored. Reference it with a `Sitemap:` line in robots.txt. (2026-07-08)
- **[O]** Bing: 301 for moves, 302 only for changes under two days, 404 for deleted URLs, sitemaps with canonical URLs only. (Bing guidelines, 2026-02)

## Structured data

- **[O]** JSON-LD recommended; mark up only visible main content; include required properties; rich results are not guaranteed; spammy markup loses rich result eligibility. (2026-07-10)
- **[O]** Types Google currently supports: Article, Breadcrumb, Carousel, Course list, Dataset, Discussion forum, Education Q&A, Employer aggregate rating, Event, Image metadata, Job posting, Local business, Math solver, Movie, Organization, Product, Profile page, Q&A, Recipe, Review snippet, Software app, Speakable, Subscription and paywalled content, Vacation rental, Video. (Search gallery, 2026-10-16)
- **[O] Retired:** FAQ rich results stopped on 2026-05-07; HowTo since 2023; Practice problem, Course info, Estimated salary, Learning video, Special announcement and Vehicle listing docs removed 2025 to 2026. Leaving old FAQPage markup is harmless but earns nothing.
- **[O]** Organization on the home or About page, logo at least 112×112, with `sameAs`; WebSite with `name` and `url` on the home page only; Article `author` with a name and a `url`, ISO 8601 dates with a timezone, images in 16×9, 4×3 and 1×1 of at least 50,000 pixels. (2025-12 to 2026-09)
- **[O]** Not required for AI answers at Google; at Bing it "may support clearer grounding" but guarantees nothing.

## Images and video

- **[O]** Indexed formats: BMP, GIF, JPEG, PNG, WebP, SVG, AVIF; the extension matches the type. CSS background images are not indexed; use `<img>`, including inside `<picture>`, with a fallback `src`. (2026-03-02)
- **[O]** Alt text is the most important image metadata: contextual, never stuffed. Descriptive file names; the same URL when an image repeats; image sitemaps may list CDN URLs.
- **[O]** Preferred image for a page: `primaryImageOfPage`, a `mainEntity` image or `og:image`; avoid logos, text-heavy images and extreme ratios. Discover: at least 1200 px wide and `max-image-preview:large`. (2026-03)
- **[O]** Serve AVIF or WebP with a JPEG or PNG fallback through `<picture>`; set `width` and `height` on every image. (MDN, 2026-10-08)
- **[O]** `loading="lazy"` below the fold only, never on the largest image; `fetchpriority="high"` on the largest image; `low` for offscreen carousel images. (web.dev)
- **[O]** Video: an indexed watch page where the video is the main content, stable thumbnail and video URLs, VideoObject with `name`, `thumbnailUrl`, `description`, `uploadDate` and `contentUrl` or `embedUrl`; captions and transcripts. (2025-12-18)
- **[O]** AI-generated images in Merchant Center carry the IPTC value `TrainedAlgorithmicMedia`.

## Speed and size

| Core Web Vital, 75th percentile of field data | Good | Poor |
| --- | --- | --- |
| Largest Contentful Paint | 2.5 s or less | over 4.0 s |
| Interaction to Next Paint | 200 ms or less | over 500 ms |
| Cumulative Layout Shift | 0.1 or less | over 0.25 |

- **[O]** Measured separately for mobile and desktop. Used by ranking systems, but relevance wins; do not chase perfect lab scores. (Page experience, 2026-09-22; web.dev)
- **[O]** Fonts: WOFF2, subset, `font-display: optional` or `swap`, `size-adjust` on fallbacks, few families, `system-ui` where it fits, SVG instead of icon fonts. (web.dev)
- **[O]** Lighthouse aims for under about 1,600 KiB per page and flags over 5,000 KiB. The 2025 median mobile home page was about 2,164 KB. (Lighthouse; Web Almanac 2025)
- **[O]** Lighthouse 13 (2025-10) replaced many audits with "insights"; update tooling that reads old audit IDs.

## Sharing and identity

- **[O]** Open Graph required: `og:title`, `og:type`, `og:image`, `og:url`; add `og:description`, `og:site_name`, `og:locale`, `og:image:width`, `og:image:height`, `og:image:alt`. (ogp.me)
- **[O]** Share image 1200×630 (1.91:1), at least 600×315, under 8 MB; change the URL when the image changes, since it is cached by URL. (Meta)
- **[O]** Google may use `og:image` as a page's preferred image. (2026-03)
- **[P]** `twitter:card` set to `summary_large_image`; X falls back to Open Graph values. X's own documentation is no longer maintained.
- **[O]** Favicon on the home page with `rel="icon"` or `apple-touch-icon`, square, larger than 48×48, stable URL. SVG is not in Google's supported list, so ship a PNG or ICO beside any SVG icon. (2026-08-28)
- **[O]** Web app manifest linked from every page: `name`, `short_name` (12 characters or fewer), icons at 192 and 512 plus a maskable icon, `start_url`, `display`, `theme_color`, `background_color`, `id`. (web.dev)

## Content and policies

- **[O]** Trust matters most in E-E-A-T; accurate bylines where readers expect them; explain how content was made, including AI use, where readers would ask. No ideal length. (2026-10-05)
- **[O]** Fact-check AI-written titles, descriptions, structured data and alt text. (2026-10-01)
- **[O]** Spam policies cover manipulating AI responses: scaled content abuse, site reputation abuse, expired domain abuse, cloaking, doorways, hidden text, keyword stuffing, link spam (paid links `sponsored` or `nofollow`), back button hijacking. Accordions, tabs and screen-reader text are not hidden-text spam. (2026-08-28)
- **[O]** Bing names content engineered to trigger citations and prompt injection as abuse. (2026-02)
- **[O]** Descriptive link text, every indexable page linked from at least one other page, `ugc` for user content. (2025-12-10)
- **[O]** Semantic HTML, a logical heading order and real `<button>` and `<a>` elements help search, AI agents and assistive technology alike. (Google, Bing, web.dev)

## Measurement

- **[O]** Google Search Console: AI Overviews and AI Mode traffic is counted under "Web" in Performance; a separate generative AI report arrived in 2026-06. No third-party tool sees inside Google's ranking or AI systems.
- **[O]** Bing Webmaster Tools AI Performance (2026-02): citations, cited pages and grounding queries across Copilot and partners.
- **[O]** IndexNow notifies Bing, Yandex, Seznam, Naver, Yep and others in one submission (key file at the root, up to 10,000 URLs per request); Google does not take part.
- **[P]** Server logs show which bots fetched which pages, and whether a CDN is blocking them.

## Sources

Google Search Central (developers.google.com/search/docs and developers.google.com/crawling), Bing Webmaster Guidelines (bing.com/webmasters), OpenAI crawler documentation (developers.openai.com/api/docs/bots), Anthropic crawler help (support.claude.com), web.dev, MDN, ogp.me, Meta for Developers, indexnow.org.
