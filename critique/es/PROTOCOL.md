# PROTOCOLO DE CRITIQUE DE DISEÑO

## Uso

Envía una pantalla, slide, frame o componente con el comando:
`/critique [contexto opcional]`

La entrada puede ser Figma, web, PDF, slides o imagen — ver `critique/INPUT.md`
para rutearla antes de criticar.

---

## Modos de salida

**Quick (default).** Lidera con la decisión, no con la tabla. Es lo que `/critique`
entrega por defecto y lo que `/slop-check` siempre hace.

`/slop-check` = solo lo esencial, en 3 líneas:
```
Slop Score: X/10 — [el ítem que más pesa]
Decisión: [la única corrección más importante, específica]
```
Sin tabla, sin audit capa por capa. Si el usuario quiere el resto, lo pide.

`/critique` quick = First read (2 líneas) + Slop Score + los 1–3 problemas reales
(salta capas CHECK) + Dirección. Sin tabla completa a menos que ayude.

**Full (`--full`).** El informe completo abajo: audit capa por capa en tabla, top 3
con causa raíz, dirección y qué preservar. Usar solo cuando se pide.

En ambos modos: marca capas OK como `CHECK` y no las detalles.

---

## Qué analizar (en orden)

### 1. PRIMERA LECTURA — impresión sin análisis
¿Qué comunica la pieza en 3 segundos?
¿Qué no comunica y debería?

### 2. AI SLOP SCAN
Identifica los patrones prohibidos presentes de la lista de reglas.
Da el AI SLOP SCORE con justificación por ítem.

### 3. AUDITORÍA POR CAPA

Para cada capa, usa: **CHECK / 🟡 / 🔴** (o Yellow / Red en texto).

- **CHECK** = la capa está OK, no necesita acción. Solo marca CHECK y sigue.
- **Yellow** = atención, considerar arreglar (razón en 1 línea).
- **Red** = problema real, debe arreglarse (descripción en 1-2 líneas).

No detalles las capas en CHECK. El punto es enfocar la atención en lo que debe cambiar.


**Tipografía**
- ¿Qué fuente? ¿Justificada?
- ¿Tamaño mínimo respetado?
- ¿Jerarquía legible?
- ¿Ratio consistente?
- Monospace: ¿tiene función o es decorativo?

**Color**
- ¿Cuántos roles? ¿Definidos?
- ¿El accent crea tensión o comodidad?
- ¿La paleta tiene identidad o se ve temporal?

**Spacing**
- ¿Sistema identificable?
- ¿Algún valor arbitrario?
- ¿Ritmo vertical consistente?

**Layout**
- ¿Eje de tensión presente?
- ¿Centrado justificado?
- ¿Ruptura de grid o asimetría intencional?

**Motion (si aplica)**
- Easing: ¿default o autoral?
- ¿Cada animación tiene intención declarada?
- ¿Se considera prefers-reduced-motion?

**Accesibilidad**
- ¿Contraste texto ≥4.5:1? ¿Componentes UI ≥3:1?
- ¿El color es el único diferenciador semántico en algún punto?
- ¿Estado de foco visible en todos los interactivos?
- ¿Jerarquía navegable mediante teclado?

### 4. DIAGNÓSTICO
3 problemas críticos, ordenados por impacto.
Cada uno con: problema → causa raíz → corrección específica.

### 5. DIRECCIÓN DE CORRECCIÓN
No solo "mejora esto".
Entrega la decisión: qué reemplazar, por qué, y qué dirección tomar.

### 6. QUÉ PRESERVAR
Lo que está funcionando y no debe tocarse.
