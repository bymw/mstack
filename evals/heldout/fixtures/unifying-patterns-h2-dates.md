# Task app (React Native + web, TypeScript): date formatting today

Lint: ESLint (`eslint.config.js`). Tests: Jest. `moment` is in package.json; Export.tsx is the only file that imports it.

## src/lib/dates.ts (the standard from last quarter)

```ts
// "Oct 23" this year, "Oct 23, 2025" other years.
export function formatDate(d: Date, now = new Date()): string {
  const sameYear = d.getFullYear() === now.getFullYear();
  return d.toLocaleDateString(undefined, sameYear
    ? { month: 'short', day: 'numeric' }
    : { month: 'short', day: 'numeric', year: 'numeric' });
}
```

## Places added since then

```tsx
// src/tasks/TaskRow.tsx
<Text>{task.due.toLocaleDateString()}</Text>

// src/export/Export.tsx
import moment from 'moment';
const line = `${task.title},${moment(task.due).format('DD/MM/YYYY')}`;

// src/calendar/DayHeader.tsx
<Text>{`${date.getMonth() + 1}/${date.getDate()}`}</Text>

// src/reminders/ReminderSheet.tsx
const label = new Intl.DateTimeFormat('en-US', { weekday: 'long', hour: 'numeric', minute: '2-digit' }).format(reminder.at);
// shows e.g. "Thursday 9:30 AM"
```

Nothing in lint or tests checks date formatting.
