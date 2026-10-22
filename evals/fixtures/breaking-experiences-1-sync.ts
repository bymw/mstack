// Pantrybook web client: list sync (excerpt)
type Change = { itemId: string; field: string; value: unknown };

const queue: Change[] = []; // pending offline changes, kept in memory

export async function addItem(listId: string, name: string) {
  const item = { id: crypto.randomUUID(), name, addedAt: Date.now() };
  render(listId, item);
  await send(`/lists/${listId}/items`, { name, addedAt: item.addedAt });
}

export async function editField(listId: string, change: Change) {
  if (!navigator.onLine) { queue.push(change); return; }
  await send(`/lists/${listId}/changes`, change);
}

async function send(url: string, body: unknown, attempt = 1): Promise<void> {
  const res = await fetch(url, { method: "POST", body: JSON.stringify(body) });
  if (res.status === 401) { window.location.href = "/signin"; return; }
  if (!res.ok && attempt < 3) return send(url, body, attempt + 1);
}

window.addEventListener("online", async () => {
  for (const change of queue) await send(`/changes`, change);
  queue.length = 0;
});

declare function render(listId: string, item: unknown): void;
