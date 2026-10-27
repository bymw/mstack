# Crawlers, access controls and new standards

Read this when writing robots.txt, deciding what AI systems may use, or asked about llms.txt. Checked 2026-10-23; agent names change, so recheck each vendor's page before publishing a policy.

**Contents:** the three kinds of agent · agents by vendor · a robots.txt pattern · controls that are not robots.txt · llms.txt and newer standards

## The three kinds of agent

| Kind | What it does | If blocked |
| --- | --- | --- |
| **Search** | Indexes pages so an assistant or engine can find and cite them | The site can vanish from that product's answers |
| **Training** | Collects pages to train models | Future training excludes the site; answers usually unaffected |
| **User-triggered** | Fetches a page because a person asked about it | Often ignores robots.txt by design; blocking may still reduce visibility |

## Agents by vendor

| Vendor | Search | Training | User-triggered |
| --- | --- | --- | --- |
| Google | `Googlebot` (also feeds AI Overviews and AI Mode) | `Google-Extended` (a token, not a crawler: Gemini training and grounding) | `Google-Agent` and others, which generally ignore robots.txt |
| Microsoft | `Bingbot` (also feeds Copilot) | none separate | none listed |
| OpenAI | `OAI-SearchBot` | `GPTBot` | `ChatGPT-User` (robots.txt may not apply) |
| Anthropic | `Claude-SearchBot` | `ClaudeBot` | `Claude-User` |
| Perplexity | `PerplexityBot` | none stated | `Perplexity-User` (generally ignores robots.txt) |
| Apple | `Applebot` (follows Googlebot rules if not named) | `Applebot-Extended` (a token: training only) | none listed |
| Meta | `meta-webindexer` | `meta-externalagent` | `meta-externalfetcher` |
| Amazon | `Amzn-SearchBot` | `Amazonbot` (general crawler) | `Amzn-User` |
| DuckDuckGo | `DuckAssistBot` | none | none |
| Mistral | none | `MistralAI-Training` | `MistralAI-User` |
| Common Crawl | none | `CCBot` (widely used for training) | none |

Each vendor's settings are independent: OpenAI documents allowing `OAI-SearchBot` while disallowing `GPTBot`. Changes take about 24 hours at OpenAI and Perplexity, 72 at DuckDuckGo.

## A robots.txt pattern

Visible in search and AI answers, with training left to the owner. Search and user agents stay allowed; the training lines are the owner's call.

```
# Search and AI answers
User-agent: Googlebot
User-agent: Bingbot
User-agent: OAI-SearchBot
User-agent: Claude-SearchBot
User-agent: Claude-User
User-agent: PerplexityBot
User-agent: Applebot
User-agent: meta-webindexer
User-agent: DuckAssistBot
Allow: /

# Model training: include only if the owner opts out
User-agent: GPTBot
User-agent: ClaudeBot
User-agent: Google-Extended
User-agent: Applebot-Extended
User-agent: CCBot
User-agent: meta-externalagent
User-agent: MistralAI-Training
Disallow: /

User-agent: *
Allow: /

Sitemap: https://example.com/sitemap.xml
```

- Google reads only `user-agent`, `allow`, `disallow` and `sitemap`, up to 500 KiB, cached about a day; `crawl-delay` is ignored by Google and Apple (Anthropic honours it). The longest matching rule wins.
- robots.txt does not remove pages from an index; use `noindex` and leave the page crawlable so the rule can be seen.
- A 5xx on robots.txt pauses Google's crawling; a 4xx (other than 429) means no restrictions.

## Controls that are not robots.txt

- **CDN and firewall.** Check bot settings, not only robots.txt. Cloudflare split AI controls into Search, Agent and Training in 2026-07, and from 2026-09-15 new domains block Training and Agent bots on pages with ads by default; mixed-use crawlers can be caught. Make sure published bot IP ranges are not blocked.
- **Google AI features.** `Google-Extended` does not keep a site out of AI Overviews or AI Mode. Use `nosnippet`, `max-snippet`, `data-nosnippet` or `noindex`, or the site-wide generative AI control in Search Console (available everywhere since 2026-08-31; it does not affect normal ranking).
- **Bing and Copilot.** `NOARCHIVE` keeps pages out of Copilot and grounding; `NOCACHE` limits them to URL, title and snippet.
- **Apple.** `nosnippet` opts out of Siri and Search answer use; disallowing `Applebot-Extended` opts out of training only.

## llms.txt and newer standards

- **llms.txt** (llmstxt.org, proposed 2024): a Markdown file at `/llms.txt` listing key pages, meant for agents at inference time. Google says it is not needed for Search and neither helps nor hurts. OpenAI and Anthropic have made no statement that their crawlers read other sites' llms.txt. Log studies show most such files are never requested. **Verdict: optional, useful for documentation and developer sites where coding agents read docs; not a discoverability lever.** Chrome's experimental Lighthouse "Agentic Browsing" category checks for it, which concerns agent readiness, not ranking.
- **IETF AI preferences** (`Content-Usage` in robots.txt or an HTTP header): still Internet-Drafts in 2026-09, not deployed standards.
- **Cloudflare Content Signals** (`Content-Signal:` lines): inserted by Cloudflare's managed robots.txt; no major crawler is confirmed to honour them, and Google's parser ignores unknown fields.
- **RSL** (licensing terms referenced from robots.txt): crawler support unconfirmed.
- **WebMCP** (exposing site actions to agents): early, in a Chrome origin trial.

Treat everything in this section as optional until an engine documents that it uses it.
