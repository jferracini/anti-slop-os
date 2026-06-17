# DESIGN CRITIQUE PROTOCOL

## Usage

Send a screen, slide, frame, or component with the command:
`/critique [optional context]`

The input can be Figma, web, PDF, slides, or an image — see `critique/INPUT.md`
to route it before critiquing.

---

## Output modes

**Quick (default).** Lead with the decision, not the table. This is what `/critique`
delivers by default and what `/slop-check` always does.

`/slop-check` = just the essentials, in 3 lines:
```
Slop Score: X/10 — [the single heaviest item]
Decision: [the one most important, specific fix]
```
No table, no layer-by-layer audit. If the user wants the rest, they ask.

`/critique` quick = First read (2 lines) + Slop Score + the 1–3 real problems
(skip CHECK layers) + Direction. No full table unless it helps.

**Full (`--full`).** The complete report below: layer-by-layer audit table, top 3
with root cause, direction, and what to preserve. Use only when asked.

In both modes: mark OK layers `CHECK` and do not detail them.

---

## What to analyze (in order)

### 1. FIRST READ — impression without analysis
What does the piece communicate in 3 seconds?
What does it fail to communicate but should?

### 2. AI SLOP SCAN
Identify forbidden patterns present from the rules list.
Give the AI SLOP SCORE with justification per item.

### 3. LAYER-BY-LAYER AUDIT

For each layer, use: **CHECK / 🟡 / 🔴** (or Yellow / Red in text).

- **CHECK** = layer is OK, no action needed. Just mark CHECK and move on.
- **Yellow** = attention, consider fixing (1-line reason).
- **Red** = real problem, must fix (1-2 line description).

Do not detail CHECK layers. The point is to focus attention on what needs to change.


**Typography**
- Which font? Justified?
- Minimum size respected?
- Hierarchy legible?
- Ratio consistent?
- Monospace: functional or decorative?

**Color**
- How many roles? Defined?
- Does accent create tension or comfort?
- Does the palette have identity or feel temporal?

**Spacing**
- Identifiable system?
- Any arbitrary value?
- Vertical rhythm consistent?

**Layout**
- Tension axis present?
- Centering justified?
- Grid-break or asymmetry intentional?

**Motion (if applicable)**
- Easing: default or authorial?
- Does every animation have a declared intention?
- Is prefers-reduced-motion considered?

**Accessibility**
- Text contrast ≥4.5:1? UI components ≥3:1?
- Is color the sole semantic differentiator anywhere?
- Visible focus state on all interactive elements?
- Reading hierarchy navigable via keyboard?

### 4. DIAGNOSIS
3 critical problems, ordered by impact.
Each with: problem → root cause → specific correction.

### 5. CORRECTION DIRECTION
Not just "make it better".
Deliver the decision: what to replace, why, and which direction to take.

### 6. WHAT TO PRESERVE
What is working and must not be touched.
