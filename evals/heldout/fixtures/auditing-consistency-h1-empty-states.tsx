// Four empty states from our bug tracker web app, copied from where they live.

// ---- src/issues/IssuesEmpty.tsx ----
export function IssuesEmpty() {
  return (
    <div style={{ padding: 48, textAlign: 'center' }}>
      <BugIcon size={64} color="#9aa0a6" />
      <h2 style={{ fontSize: 20, marginTop: 16 }}>No issues yet</h2>
      <p style={{ color: '#6b7280' }}>Issues you create will show up here.</p>
      <Button variant="primary">New issue</Button>
    </div>
  );
}

// ---- src/projects/ProjectsEmpty.tsx ----
export function ProjectsEmpty() {
  return (
    <div className="empty">
      <img src="/img/empty-folder.png" width={120} />
      <h3>Nothing here!</h3>
      <p>Looks like you haven't made any projects. Why not create one?</p>
      <a href="/projects/new" className="link">Create a project →</a>
    </div>
  );
}

// ---- src/search/NoResults.tsx ----
export const NoResults = ({ query }: { query: string }) => (
  <div style={{ padding: '24px 16px' }}>
    <p style={{ fontWeight: 600 }}>0 results for "{query}"</p>
    <p className="muted">Try different keywords.</p>
  </div>
);

// ---- src/inbox/InboxZero.tsx ----
export function InboxZero() {
  return (
    <Center py={64}>
      <SearchIcon size={32} />
      <Text size="lg" weight="bold">You're all caught up 🎉</Text>
      <Button variant="secondary" size="sm">Refresh</Button>
    </Center>
  );
}

// ---- src/styles/global.css (excerpt) ----
// .empty { padding: 32px; text-align: center; }
// .empty h3 { font-size: 18px; margin: 12px 0 4px; }
// .muted { color: #8b8b8b; }
