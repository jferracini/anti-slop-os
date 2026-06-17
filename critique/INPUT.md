# INPUT ROUTER — de onde vem o design

Porta única para qualquer entrada de design. Detecte o tipo, siga **só a rota
correspondente** (não carregue as outras) e, em qualquer falha, use o fallback da
própria rota. Depois siga o protocolo de critique normal.

**Regra dura:** nunca invente conteúdo. Criticar algo imaginado é exatamente o slop
que este skill existe para evitar. Sem a peça real → pare e peça.

---

## Detecção

| Entrada | Rota |
|---|---|
| URL `figma.com/...` | **A — Figma** |
| Outra URL (`http/https`) | **B — Web** |
| Imagem (`.png` `.jpg` `.jpeg` `.webp`) ou screenshot colado | **C — Imagem** |
| `.pdf` | **D — PDF** |
| Google Slides / Docs / Keynote / PPT | **E — Documento** |
| Arquivo de código / HTML local | **F — Código** |

---

## Rota A — Figma

1. Faça parse da URL: `fileKey` e `node-id` (converta `-` em `:` no node-id).
2. Use o Figma MCP: `get_code` e `get_image` no `fileKey` + `node-id`.
3. **Se o MCP voltar vazio: PARE.** Não chute pelo nome do arquivo. Reporte o que
   extraiu (fileKey, node-id, nome) e peça um screenshot do frame, ou que o usuário
   confira o acesso/seleção no Figma.
4. Com o retorno, aplique o protocolo de critique contra o code + imagem reais.

Fallback (sem Figma MCP): peça o screenshot do frame
(`Cmd+Shift+E` no Figma → PNG @2x) e siga pela Rota C.

## Rota B — Web

Tente em ordem:
1. **Playwright MCP** (`browser_navigate` + `browser_screenshot`) — preferido.
2. **Playwright CLI**: `npx --yes playwright screenshot --full-page "<url>" /tmp/slop-shot.png`
   e leia o PNG.
3. **Screenshot manual** — peça ao usuário (Cmd+Shift+4 / captura de página inteira).

Se a URL for `localhost`, além do screenshot, leia o código-fonte da rota
correspondente e adicione uma seção **Code layer** ao critique.

## Rota C — Imagem

Leia a imagem direto por visão. Sem ferramenta extra. Se vier borrada/cortada a ponto
de impedir a leitura, peça uma nova captura — não adivinhe.

## Rota D — PDF

Leia o PDF direto (páginas tratadas como imagem para design). Se tiver muitas páginas,
peça qual(is) frame(s) auditar antes de criticar tudo.

## Rota E — Documento (Slides / Docs / etc.)

Não há leitura visual direta de um link de Slides/Docs. Peça **export PDF ou PNG** do(s)
slide(s), ou um link público, e siga pela Rota D/C. Se houver skills de Google Workspace
disponíveis, use-as para puxar o arquivo; senão, peça o export.

## Rota F — Código / HTML local

Leia os arquivos-fonte (componente, CSS/Tailwind, dados). Renderize mentalmente e, quando
possível, gere um preview (artifact) para auditar o resultado visual, não só o código.
Adicione uma seção **Code layer** ao critique.

---

## Depois da rota

Sempre que a peça real estiver em mãos, siga `critique/PROTOCOL.md` (ou
`critique/nu/PROTOCOL.md` em contexto Nu). Ao final, registre em 1 linha a rota usada,
ex.: `Entrada via Figma MCP.` / `Entrada via screenshot manual.`
