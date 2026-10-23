// Grocery app: shared shopping lists.
// Every device keeps a full local copy of the list and syncs with the server
// every 30 s when online. On sync, the device sends its copy, the server merges
// it with the stored copy using merge() below, stores the result and sends it back.

export type Item = {
  id: string;
  name: string;
  checked: boolean;
  updatedAt: number; // ms since epoch, set on the device that made the change
  deleted?: boolean;
};

export function merge(local: Item[], remote: Item[]): Item[] {
  const byId = new Map<string, Item>();
  for (const item of remote) byId.set(item.id, item);
  for (const item of local) {
    const other = byId.get(item.id);
    if (!other || item.updatedAt > other.updatedAt) byId.set(item.id, item);
  }
  return [...byId.values()].filter((i) => !i.deleted);
}

export function addItem(list: Item[], name: string): Item[] {
  return [...list, { id: crypto.randomUUID(), name, checked: false, updatedAt: Date.now() }];
}

export function toggle(list: Item[], id: string): Item[] {
  return list.map((i) => (i.id === id ? { ...i, checked: !i.checked, updatedAt: Date.now() } : i));
}

export function rename(list: Item[], id: string, name: string): Item[] {
  return list.map((i) => (i.id === id ? { ...i, name, updatedAt: Date.now() } : i));
}

export function remove(list: Item[], id: string): Item[] {
  return list.filter((i) => i.id !== id);
}
