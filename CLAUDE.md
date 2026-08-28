# Business Management Notes

Single HTML file of business management notes (VCE), tracked in git instead of
manually-numbered copies. History was backfilled from ~47 old `business-notes-vNN.html`
snapshots on 2026-08-28 — `git log` is a real, backdated timeline, not just a
migration commit.

## Files

- `business-notes.html` — the one live, tracked file. Never fork this into
  `business-notes-v38.html` etc. — commit changes to it directly.
- `update-notes.sh` — run after downloading a fresh export straight into this
  folder (as `business-notes-vNN.html` or similar). It diffs it against the
  tracked file, commits, pushes to GitHub, and deletes the downloaded copy.
  Aliased as `update-notes` in `~/.zshrc`.
- `reference/2023-business-management-study-design.docx` — the official VCE
  Business Management study design. Useful for cross-checking whether notes
  cover a given area/outcome, or for matching terminology.
- Remote: `origin` → `github.com/swiftothecore/business-management-notes` (private).

## Workflow

- Normal edit: modify `business-notes.html`, then `git add business-notes.html
  && git commit -m "..." && git push`.
- New export downloaded: run `update-notes.sh` (or the `update-notes` alias)
  instead of doing it by hand.
