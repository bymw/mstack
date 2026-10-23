# Plant-care app marketing site (launches next week)

One page at the root of the domain. Built as a client-side React app.

## index.html (as served)

```html
<!doctype html>
<html>
<head>
  <title>App</title>
  <meta name="viewport" content="width=device-width">
  <link rel="icon" href="/favicon.ico">
  <script src="/bundle.js" defer></script>
</head>
<body>
  <div id="root"></div>
</body>
</html>
```

## robots.txt (as served)

```
User-agent: *
Disallow: /
```

## What the page shows once bundle.js runs

- Hero: "Keep every plant alive." with a 3.2 MB PNG of plants (no alt text).
- Three feature sections: smart watering reminders, plant identification from a photo, care guides for 1,200 plants.
- Pricing: free, or Plus at 2.99 a month.
- FAQ with 8 questions.
- App store download badges as images, linking to the store pages.
- No sitemap. No other pages yet; care guides live only inside the app.
