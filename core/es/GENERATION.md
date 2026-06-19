# GENERACIÓN CON GUARDRAIL — nacer con autoría, no slop

> Capa de **generación** (no de critique). Corre ANTES y DURANTE la creación de cualquier
> UI nueva. El critique corrige después; esto evita que la firma de AI nazca.
> Se combina con `core/RULES.md` (la regla) — aquí está el **proceso** que la aplica.

Se activa con `/design`, `/nu-design`, o cualquier pedido de "crea / genera / arma" una
pantalla, landing, página, componente o prototipo.

---

## FIRMA DE AI — el firewall (escanea TU PROPIO borrador antes de emitir)

Estos son los tells de UI generada por modelo en 2026. Antes de devolver código o layout,
escanea tu propia salida contra esta lista. Un tell presente **sin intención declarada**
→ corrígelo antes de entregar.

| # | Tell | Cómo detectar | Antídoto |
|---|---|---|---|
| 1 | Monospace como estética | mono en título/cuerpo sin función de código/dato | mono solo para código, número técnico, dato tabular |
| 2 | Trazos anchos en todo | borde 1px+ en cada card/sección, "outline everything" | bordes solo donde separan significado; usa espacio y color |
| 3 | Fuentes pequeñas | cuerpo < 15px, leyenda < 12px | cuerpo ≥ 16px; escala con ratio |
| 4 | Sin grid | elementos flotando, sin columnas/baseline declaradas | declara columnas + ritmo vertical antes de armar |
| 5 | Todo centrado | hero central + 3 cards + CTA (el layout default del modelo) | eje de tensión; asimetría controlada con propósito |
| 6 | Gradiente / glow / glass decorativo | gradiente como color, glow neón, vidrio sin narrativa | color sólido con rol; efectos solo si comunican |
| 7 | Gris-sobre-gris | texto #999 en #fff, jerarquía por opacidad | contraste real ≥ 4.5:1; jerarquía por peso/tamaño |
| 8 | Emoji como ícono | 🚀 💡 ✨ como iconografía de producto | ícono con elección semántica, o ninguno |
| 9 | Over-rounding / over-sharp | todo pill, o todo 0px, sin intención | el radio es una decisión; un valor dominante + excepciones |
| 10 | Íconos stock por default | Lucide/Heroicons por default sin elección | elige el set y justifícalo; no el primero de la lista |
| 11 | Espaciado uniforme | mismo gap en todo, sin jerarquía | escala de espacio con ≥ 3 saltos; la densidad varía |
| 12 | Dashboard chrome | cards/números sin dato real, "métrica fake" | muestra solo dato que existe; si no, no inventes UI de dato |
| 13 | Dark neón "AI SaaS" | fondo oscuro + accent neón + glow | paleta con identidad, no el preset oscuro genérico |

**El firewall obliga lo opuesto:** grid presente, contraste auditado, escala tipográfica
con ratio, sin mono-estética, sin fuentes minúsculas, densidad que varía entre secciones.

---

## SANIDAD ESTRUCTURAL — el mínimo bien hecho (escanea el layout RENDERIZADO)

El slop estético es la mitad. La otra mitad es **falla estructural**: el layout que parece
correcto en el código pero se rompe al ojo humano. Una skill que guía decisiones no puede
errar lo básico. Antes de emitir, escanea también esta lista:

| # | Falla | Cómo detectar | Lo correcto |
|---|---|---|---|
| S1 | Colisión de `padding` shorthand | container (`.wrap`) y bloque (`section`/`hero`) ambos con `padding: a b` → el selector más específico anula el eje del otro (desaparece el gutter lateral, o el ritmo vertical) | **longhand por eje**: el container manda en `padding-left/right`; las secciones en `padding-top/bottom`. Nunca el shorthand en ambos. |
| S2 | Overflow horizontal de grid/flex | una palabra/línea larga se desborda a la derecha, corta texto, desalinea toda la página | los hijos de texto necesitan `min-width:0` (el default `auto` impide encoger y fuerza el overflow) |
| S3 | Nº de hijos ≠ columnas | grid de 2 columnas con 3 hijos → el 3º cae en la columna equivocada (angosta) y rompe el ancho | agrupa el contenido en un wrapper, o posiciónalo explícito (`grid-column`) |
| S4 | Boxed vs fluid indeciso | dividers/secciones con anchos distintos; nav fuera del eje del contenido | **decide y declara**. Boxed: un container, gutter fijo, nav + secciones en el mismo eje. La banda full-bleed es excepción intencional cuyo contenido re-entra al container |
| S5 | Contraste perdido por especificidad | el color que escribiste en el botón/link no es el que renderiza (una regla más específica ganó) | revisa el color **computado**, no el que escribiste; sube la especificidad del estado correcto |
| S6 | Rótulo pegado al divider | eyebrow/tag tocando la línea de sección, sin respiro | respiro real arriba (el padding vertical de la sección); y evita el eyebrow mayúsculas + trazo ancho (ver tell #2) |

**Regla de oro:** el juez final es el **ojo en el layout renderizado**, no el código que parece correcto.

---

## EL FLUJO — 4 fases

Modo **híbrido**: haz las 2–3 preguntas esenciales de la Fase 0. Si el usuario no responde,
**asume un default y decláralo** ("asumí X — corrígeme si no es así") y sigue. Nunca
bloquees por silencio; nunca generes a ciegas.

### Fase 0 — Intención (pregunta lo esencial)
Detecta el objetivo y haz solo las preguntas de ese objetivo (ver "Preguntas por objetivo").
Sin respuesta → default declarado + sigue.

### Fase 1 — Decision lock (declara antes de generar)
Una línea cada uno, con justificación:
- **Eje de tensión** — la única tensión en torno a la cual se organiza el diseño.
- **Tipografía** — par display/cuerpo + ratio (1.25 / 1.414 / 1.618) + 3 pesos semánticos.
- **Color** — 3 roles (background / surface / foreground) + 1 accent. (Nu: tokens NuDS.)
- **Grid** — columnas + ritmo vertical (la escala de espacio). Obligatorio declararlo.
- **Motion** — intención de 1 momento, con easing con personalidad (o sin motion).

### Fase 2 — Token gate (solo pantalla Nu)
Si es producto Nu para nubankers → ver `core/nu/TOKENS.md`. Si no, sáltalo.

### Fase 3 — Firewall (anti-firma)
Corre el escaneo de la tabla de arriba sobre tu propio borrador. Cualquier tell sin
intención declarada → corrige. Confirma: grid presente · contraste auditado · escala con
ratio · sin mono-estética · sin fuentes minúsculas.
Corre **también** el escaneo de Sanidad estructural (S1–S6) — el mínimo bien hecho no puede fallar.

### Fase 4 — Self-check + report (opcional)
Pasa el Generation gate (abajo). Con `--report`, completa `critique/report-template.html`
y entrega el archivo `slop-report.html`.

---

## PREGUNTAS POR OBJETIVO

**Pantalla de producto Nu (para nubankers)** — token gate ENCENDIDO
1. ¿Qué superficie NuDS — Mobile, Web o POS?
2. ¿Cuál es el job-to-be-done del usuario en esta pantalla?
3. ¿De qué flow forma parte (qué viene antes/después)?

**Página web / Landing page** — heurísticas + ritmo OBLIGATORIOS
1. ¿Cuál es el **ÚNICO** mensaje? (si son tres, no hay foco)
2. ¿Quién es el público y cuál es la **acción única** deseada?
3. ¿Qué sensación/tensión debe provocar la página?
→ Ayuda a justificar cada decisión y fuerza: ritmo, dinámica, contraste, intención,
heurísticas de usabilidad y accesibilidad (bloque abajo).

**Componente aislado**
1. ¿Qué problema resuelve en este contexto?
2. ¿Dónde vive y qué estados tiene (default / hover / focus / loading / error / vacío)?

**Exploración / side-project / test**
Declara que es exploración. Las reglas de estilo se aflojan, pero la **firma de AI sigue
prohibida** — explorar no es excusa para slop.

---

## WEB / LANDING — qué forzar

- **Ritmo** — escala de espaciado con ≥ 3 saltos. Nada de mismo-gap-en-todo.
- **Dinámica** — la densidad varía entre secciones (respiro ↔ concentración), no uniforme.
- **Contraste** — jerarquía por tamaño **y** peso **y** color, no solo tamaño.
- **Intención** — cada sección responde "por qué existe y qué hace el ojo aquí".
- **Nielsen (10 heurísticas)** — visibilidad del estado, match con el mundo real, control
  y libertad, consistencia, prevención de error, reconocer > recordar, flexibilidad,
  estética minimalista, recuperación de error, ayuda/documentación.
- **WCAG AA** — contraste ≥ 4.5:1 medido contra el color **real** del fondo (en banda de
  color/oscura, no contra el blanco de la página; el texto tachado/"apagado" también ≥ 4.5:1),
  foco visible, navegación por teclado, alt en imagen, `prefers-reduced-motion`, el color nunca como único significado.

---

## GENERATION GATE — antes de entregar (anti-timidez)

Responde los 3:
1. ¿Cuál es la **ÚNICA** jugada audaz y específica acá? (tres "quizás" no es una decisión)
2. ¿Qué en esta pieza **no podría** salir de un modelo sin dirección humana?
3. (Nu) ¿Sigue pareciendo Nu — y solo Nu? (no otro banco, no "fintech genérica")

Si (1) es tibia o genérica: **rehazla más audaz antes de entregar.**

---

## SALIDA

Entrega, en este orden:
1. Las decisiones de la Fase 1, declaradas y justificadas (1 línea cada una).
2. El código / artifact generado.
3. (Nu) el bloque **Token compliance** (`core/nu/TOKENS.md`).
4. SIEMPRE termina con **Tu decisión** — 1–2 caminos + recomendación anclada en un
   principio. El diseñador elige y aprende a aplicar intención la próxima vez.
