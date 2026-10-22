// Inkwell. Shown when archiving a notebook from the notebook list.
import { ConfirmSheet, Button } from "@inkwell/kit";

export function ArchiveSheet({ open, onConfirm, onCancel }) {
  return (
    <ConfirmSheet open={open} inset={8} radius={28} paddingTop={24}>
      <h2 className="type-headline">Archive this notebook?</h2>
      <p className="type-body">You can restore it from Settings at any time.</p>
      <Button variant="danger" height={48} fullWidth onClick={onConfirm}>Archive notebook</Button>
      <Button variant="plain" height={48} fullWidth onClick={onCancel}>Cancel</Button>
    </ConfirmSheet>
  );
}
