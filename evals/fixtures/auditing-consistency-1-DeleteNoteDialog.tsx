// Inkwell (notes app). Shown when deleting a note from the note screen.
import { Dialog, Button } from "@inkwell/kit";

export function DeleteNoteDialog({ open, onConfirm, onCancel }) {
  return (
    <Dialog open={open} variant="card" style={{ borderRadius: 8, padding: 20, maxWidth: 320 }}>
      <h2 style={{ fontSize: 17, fontWeight: 600 }}>Delete note?</h2>
      <p>This note will be deleted permanently.</p>
      <div style={{ display: "flex", gap: 8, justifyContent: "flex-end" }}>
        <Button variant="ghost" onClick={onCancel}>Cancel</Button>
        <Button variant="danger-outline" height={40} onClick={onConfirm}>Delete</Button>
      </div>
    </Dialog>
  );
}
