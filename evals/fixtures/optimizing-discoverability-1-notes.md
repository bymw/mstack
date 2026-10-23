# Tally landing page: context from the team

- Tally is a habit tracker for iPhone, iPad, Mac and the web. Site: https://www.tallyhabit.app (also reachable at https://tallyhabit.app, which serves the same page with a 200).
- The page is a React single-page app; the built HTML is attached. After JavaScript runs, the hero shows the headline "Build habits that last" over the CSS background image, then three feature sections, an FAQ accordion and a pricing table.
- The hero image /img/hero-screens.png is 2.8 MB. Feature screenshots are PNGs between 900 KB and 1.6 MB, all with `loading="lazy"`, including the first one, which is the largest element on mobile.
- app.4f9c2.js is 3.1 MB uncompressed.
- Field data from Search Console: mobile LCP 4.6 s, INP 180 ms, CLS 0.22.
- robots.txt today:

```
User-agent: *
Disallow:

User-agent: GPTBot
User-agent: ClaudeBot
User-agent: PerplexityBot
User-agent: OAI-SearchBot
Disallow: /
```

- The founder read that adding llms.txt and more FAQ schema is "the new SEO" and wants both done first.
