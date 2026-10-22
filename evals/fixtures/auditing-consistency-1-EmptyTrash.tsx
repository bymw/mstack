// Inkwell. Settings > Trash > Empty trash.
import { Dialog } from "@inkwell/kit";

export function EmptyTrash({ open, count, onConfirm, onCancel }) {
  return (
    <Dialog open={open} variant="card" style={{ borderRadius: 14, padding: 24 }}>
      <h2 style={{ fontSize: 20, fontWeight: 700 }}>Empty trash</h2>
      <p>{count} notes will be erased.</p>
      <a href="#" style={{ color: "#d33", fontWeight: 600 }} onClick={onConfirm}>Empty trash</a>
      <a href="#" onClick={onCancel}>Not now</a>
    </Dialog>
  );
}
