# Team wiki web app: search results loading today

Typical response time: about 80 ms. Slow responses: up to 2 s. A request goes out on every keystroke.

## search.js

```js
const input = document.querySelector('#search');
const results = document.querySelector('#results');
const spinner = document.querySelector('#spinner');

input.addEventListener('input', async (e) => {
  results.innerHTML = '';                 // clear old results
  spinner.style.display = 'block';
  const res = await fetch('/api/search?q=' + encodeURIComponent(e.target.value));
  const data = await res.json();
  spinner.style.display = 'none';
  data.items.forEach((item, i) => {
    const el = renderResult(item);        // returns an <li class="result">
    el.style.animation = `slideIn 600ms ease-in ${i * 120}ms both`;
    results.appendChild(el);
  });
});
```

## search.css

```css
#results { list-style: none; margin: 0; padding: 0; }
.result { padding: 12px 16px; border-bottom: 1px solid #eee; overflow: hidden; }

@keyframes slideIn {
  from { opacity: 0; max-height: 0; margin-top: 40px; }
  to   { opacity: 1; max-height: 120px; margin-top: 0; }
}

#spinner { display: none; width: 24px; height: 24px; margin: 24px auto;
  border: 3px solid #ddd; border-top-color: #333; border-radius: 50%;
  animation: spin 400ms linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
```

Results show up to 10 items. Each item is a title, a path and a two-line snippet.
