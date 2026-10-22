// Inkwell. Long-press a tag in the sidebar > Remove tag.
// Hand-rolled: does not use the kit.
export function RemoveTag({ open, tag, onConfirm, onCancel }) {
  if (!open) return null;
  return (
    <div style={{ position: "fixed", left: 0, right: 0, bottom: 0, background: "#fff",
                  borderTopLeftRadius: 16, borderTopRightRadius: 16, padding: 20 }}>
      <p style={{ fontSize: 15 }}>Remove the tag "{tag}" from all notes?</p>
      <button style={{ background: "#e5484d", color: "#fff", height: 44, width: "100%", borderRadius: 10 }}
              onClick={onConfirm}>Remove</button>
      <button style={{ height: 44, width: "100%" }} onClick={onCancel}>Cancel</button>
    </div>
  );
}
