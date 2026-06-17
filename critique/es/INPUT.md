# INPUT ROUTER — de dónde viene el diseño

Puerta única para cualquier entrada de diseño. Detecta el tipo, sigue **solo la ruta
correspondiente** (no cargues las demás) y, ante cualquier fallo, usa el fallback de esa
ruta. Luego ejecuta el protocolo de critique normal.

**Regla dura:** nunca inventes contenido. Criticar algo imaginado es exactamente el slop
que este skill existe para evitar. Sin la pieza real → detente y pide.

---

## Detección

| Entrada | Ruta |
|---|---|
| URL `figma.com/...` | **A — Figma** |
| Otra URL (`http/https`) | **B — Web** |
| Imagen (`.png` `.jpg` `.jpeg` `.webp`) o screenshot pegado | **C — Imagen** |
| `.pdf` | **D — PDF** |
| Google Slides / Docs / Keynote / PPT | **E — Documento** |
| Archivo de código / HTML local | **F — Código** |

---

## Ruta A — Figma

1. Parsea la URL: `fileKey` y `node-id` (convierte `-` en `:` en el node-id).
2. Usa el Figma MCP: `get_code` y `get_image` con `fileKey` + `node-id`.
3. **Si el MCP devuelve vacío: DETENTE.** No adivines por el nombre del archivo. Reporta
   lo que extrajiste (fileKey, node-id, nombre) y pide un screenshot del frame, o que el
   usuario verifique acceso/selección en Figma.
4. Con el resultado, ejecuta el protocolo de critique contra el code + imagen reales.

Fallback (sin Figma MCP): pide el screenshot del frame
(`Cmd+Shift+E` en Figma → PNG @2x) y sigue la Ruta C.

## Ruta B — Web

Intenta en orden:
1. **Playwright MCP** (`browser_navigate` + `browser_screenshot`) — preferido.
2. **Playwright CLI**: `npx --yes playwright screenshot --full-page "<url>" /tmp/slop-shot.png`
   y lee el PNG.
3. **Screenshot manual** — pídelo al usuario (captura de página completa).

Si la URL es `localhost`, además lee el código fuente de la ruta correspondiente y añade
una sección **Code layer** al critique.

## Ruta C — Imagen

Lee la imagen directo por visión. Sin herramienta extra. Si está borrosa/cortada al punto
de impedir la lectura, pide una nueva captura — no adivines.

## Ruta D — PDF

Lee el PDF directo (páginas tratadas como imagen para diseño). Si tiene muchas páginas,
pregunta qué frame(s) auditar antes de criticar todo.

## Ruta E — Documento (Slides / Docs / etc.)

No hay lectura visual directa de un enlace de Slides/Docs. Pide **export PDF o PNG** del
los slide(s), o un enlace público, y sigue la Ruta D/C. Si hay skills de Google Workspace
disponibles, úsalas para traer el archivo; si no, pide el export.

## Ruta F — Código / HTML local

Lee los archivos fuente (componente, CSS/Tailwind, datos). Renderiza mentalmente y, cuando
sea posible, genera un preview (artifact) para auditar el resultado visual, no solo el
código. Añade una sección **Code layer** al critique.

---

## Después de la ruta

Cuando tengas la pieza real, sigue `critique/PROTOCOL.md` (o `critique/nu/PROTOCOL.md` en
contexto Nu). Al final, anota en 1 línea la ruta usada,
ej.: `Entrada vía Figma MCP.` / `Entrada vía screenshot manual.`
