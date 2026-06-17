# INPUT ROUTER — where the design comes from

Single front door for any design input. Detect the type, follow **only the matching
route** (do not load the others), and on any failure use that route's fallback. Then run
the normal critique protocol.

**Hard rule:** never invent content. Critiquing something imagined is exactly the slop
this skill exists to prevent. No real artifact → stop and ask.

---

## Detection

| Input | Route |
|---|---|
| `figma.com/...` URL | **A — Figma** |
| Any other URL (`http/https`) | **B — Web** |
| Image (`.png` `.jpg` `.jpeg` `.webp`) or pasted screenshot | **C — Image** |
| `.pdf` | **D — PDF** |
| Google Slides / Docs / Keynote / PPT | **E — Document** |
| Local code / HTML file | **F — Code** |

---

## Route A — Figma

1. Parse the URL: `fileKey` and `node-id` (convert `-` to `:` in the node-id).
2. Use the Figma MCP: `get_code` and `get_image` on `fileKey` + `node-id`.
3. **If the MCP returns empty: STOP.** Do not guess from the file name. Report what you
   extracted (fileKey, node-id, name) and ask for a screenshot of the frame, or for the
   user to check access/selection in Figma.
4. With the result, run the critique protocol against the real code + image.

Fallback (no Figma MCP): ask for a screenshot of the frame
(`Cmd+Shift+E` in Figma → PNG @2x) and follow Route C.

## Route B — Web

Try in order:
1. **Playwright MCP** (`browser_navigate` + `browser_screenshot`) — preferred.
2. **Playwright CLI**: `npx --yes playwright screenshot --full-page "<url>" /tmp/slop-shot.png`
   and read the PNG.
3. **Manual screenshot** — ask the user (full-page capture).

If the URL is `localhost`, also read the source for the matching route and add a
**Code layer** section to the critique.

## Route C — Image

Read the image directly via vision. No extra tooling. If it is blurry/cropped enough to
prevent reading, ask for a new capture — do not guess.

## Route D — PDF

Read the PDF directly (pages treated as images for design). If it has many pages, ask
which frame(s) to audit before critiquing everything.

## Route E — Document (Slides / Docs / etc.)

There is no direct visual read of a Slides/Docs link. Ask for a **PDF or PNG export** of
the slide(s), or a public link, and follow Route D/C. If Google Workspace skills are
available, use them to pull the file; otherwise ask for the export.

## Route F — Code / local HTML

Read the source files (component, CSS/Tailwind, data). Render mentally and, when possible,
produce a preview (artifact) to audit the visual result, not only the code. Add a
**Code layer** section to the critique.

---

## After the route

Once the real artifact is in hand, follow `critique/PROTOCOL.md` (or
`critique/nu/PROTOCOL.md` in Nu context). At the end, note the route used in one line,
e.g. `Input via Figma MCP.` / `Input via manual screenshot.`
