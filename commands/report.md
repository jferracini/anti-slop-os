---
description: Turn a critique into a friendly visual HTML report with a score
argument-hint: "[paste critique | screen ref]"
---

Build a visual report for: $ARGUMENTS

Use the `anti-slop-os` skill. Take the critique just produced (or the one referenced /
pasted) and render it as a friendly HTML page.

1. Read `critique/report-template.html` (or `.anti-slop/critique/report-template.html` if
   present) and fill every `{{PLACEHOLDER}}` with the real critique data.
   - **Never invent a score or a finding.** Use only what the critique produced. If there
     is no critique yet, run one first (`/critique` or `/nu-critique`) — do not fabricate.
   - Set the score band (`good` 8–10 / `warn` 5–7 / `bad` 0–4) and the meter width.
   - Nu report: keep the 5 NuDS principles + Token compliance. Non-Nu: swap the principle
     rows for audit layers (Type, Color, Spacing, Layout, Motion, A11y) and delete the
     token section.
2. Save the filled file as `slop-report.html` in the project root.
3. Tell the user to open it (`open slop-report.html`).

The template is itself the anti-slop standard: do not add gradients, glow or
emoji-as-icon while filling it.
