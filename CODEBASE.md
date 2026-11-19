# CODEBASE.md — cómo funciona este blog

Este es el manual de la casa. Está pensado para que puedas entender el sitio completo sin depender de memoria: qué hace cada carpeta, por qué está así y cómo se publica.

**Stack:** [Hugo](https://gohugo.io/) (generador de sitios estáticos) + [XMin](https://github.com/yihui/hugo-xmin) (tema minimalista, ~140 líneas) + GitHub Pages.

**Sitio:** <https://mvalentne.github.io/blog/> · **Repo:** <https://github.com/MValentne/blog>

---

## Índice

1. [Idea general](#1-idea-general)
2. [Mapa de carpetas](#2-mapa-de-carpetas)
3. [`hugo.toml`, línea por línea](#3-hugotoml-línea-por-línea)
4. [Cómo renderiza Hugo (el pipeline)](#4-cómo-renderiza-hugo-el-pipeline)
5. [Templates: precedencia y nombres](#5-templates-precedencia-y-nombres)
6. [Secciones y contenido](#6-secciones-y-contenido)
7. [Frontmatter de referencia](#7-frontmatter-de-referencia)
8. [Shortcodes y extras](#8-shortcodes-y-extras)
9. [Estilos](#9-estilos)
10. [Escribir y publicar](#10-escribir-y-publicar)
11. [Deploy](#11-deploy)
12. [Mantenimiento](#12-mantenimiento)
13. [Glosario y troubleshooting](#13-glosario-y-troubleshooting)

---

## 1. Idea general

El blog es una carpeta de archivos Markdown. Hugo los lee, aplica plantillas HTML y escribe un sitio estático en `public/`. No hay base de datos ni backend: GitHub Pages sirve los archivos generados.

Tres ideas que explican casi todas las decisiones:

- **XMin es deliberadamente chico.** El tema aporta el HTML y el CSS base; todo lo demás (menú, listados, Sobre mí, proyectos) vive en este repo, con plantillas propias cortas.
- **El contenido manda.** Agregar un post, apunte, proyecto o evento es crear un `.md` con `hugo new`. No se tocan plantillas.
- **La página Sobre mí vive en el repo.** `content/about.md` se edita como cualquier otro texto; el historial de Git es el registro del trabajo.

Lo que **ya no está** (y por qué):

| Antes | Ahora | Motivo |
|---|---|---|
| `hugo-theme-nostyleplease` | `themes/hugo-xmin` (submodule) | Pedido de estilo minimalista. |
| `content/pared/`, `layouts/pared/`, marcos y tapizado | eliminado | El mural de arte no se usa más. |
| `shortcodes/webamp.html` y el post `webamp-en-el-blog.md` | eliminados | El reproductor Webamp no se usa más. El post de Low Roar conserva su texto, pero sin el reproductor. |
| `assets/css/main.scss` (676 líneas Sass) | CSS de XMin, sin copias ni overrides | Se usa el `style.css` y `fonts.css` del tema tal cual. |
| Sidebar, widgets de categorías y `data/menu.toml` | menú en `hugo.toml` | XMin usa `[[menu.main]]`. |
| Autores múltiples | `author = 'Valentino Mendé'` en todos los archivos | El blog pasó a ser personal. Los textos de otros autores se conservan. |

---

## 2. Mapa de carpetas

```
.
├── archetypes/            # Plantillas de frontmatter para `hugo new`
│   ├── default.md         # posts y apuntes
│   ├── projects.md        # proyectos
│   └── events.md          # eventos
├── content/               # TODO el contenido del sitio (Markdown)
│   ├── _index.md          # home
│   ├── about.md           # Sobre mí
│   ├── links.md           # enlaces
│   ├── posts/             # posts personales (cosas mías)
│   ├── apuntes/           # cuadernos universitarios (carpeta por tema)
│   ├── projects/          # showcase de proyectos
│   └── events/            # charlas, cursos, hackathons
├── layouts/               # Plantillas propias (sobrescriben las del tema)
│   ├── index.html         # home: últimos posts
│   ├── _partials/
│   │   └── head_custom.html  # favicons, dos ajustes a XMin, KaTeX, Mermaid
│   ├── _default/_markup/
│   │   └── render-codeblock-mermaid.html  # ```mermaid -> <pre class="mermaid">
│   ├── _default/terms.html   # índice de tags/categorías, sin fechas
│   ├── _default/term.html    # páginas individuales de tag/categoría, sin fechas
│   ├── posts/list.html
│   ├── apuntes/list.html
│   ├── projects/{list,single}.html
│   ├── events/{list,single}.html
│   └── shortcodes/qa.html    # pregunta / ejercicio desplegable
├── static/                # Archivos que se copian tal cual a public/
│   ├── favicon*, *.png, site.webmanifest
├── themes/hugo-xmin/      # SUBMODULE (git@github.com:yihui/hugo-xmin.git)
├── hugo.toml              # configuración del sitio
├── deploy.sh|.ps1|.bat    # publicación en la rama gh-pages
├── README.md              # arranque rápido
└── CODEBASE.md            # este archivo
```

`public/` y `resources/_gen/` son generados y están en `.gitignore`. No se editan.

---

## 3. `hugo.toml`, línea por línea

| Clave | Qué hace |
|---|---|
| `baseURL` | URL pública. El `/blog/` final es obligatorio porque es un *project site* de GitHub Pages. Cambiarla rompe todos los links. |
| `locale = 'es-ar'` | Idioma del atributo `lang` que escribe XMin en `<html>`. |
| `title` | Título del sitio. Aparece como sufijo en `<title>`. |
| `theme = 'hugo-xmin'` | Nombre de la carpeta en `themes/`. |
| `[permalinks]` | Posts, proyectos y eventos: `/<sección>/:slug/`. Apuntes: `/:sections/:slug/`, para que la URL conserve el cuaderno (`/apuntes/estadistica-ii/...`). |
| `[taxonomies]` | Declara `tags` y `categories` como taxonomías → Hugo genera `/tags/` y `/categories/` automáticamente. |
| `goldmark.renderer.unsafe = true` | Permite HTML dentro del Markdown (necesario para `figure`, iframes, etc.). |
| `goldmark.extensions.passthrough` | Deja pasar `$...$`, `$$...$$`, `\(...\)` y `\[...\]` sin que Markdown los modifique. Es lo que hace que las fórmulas funcionen. |
| `markup.highlight.codeFences = false` | Igual que el exampleSite de XMin: bloques de código sin resaltado extra. |
| `[params]` | `description` y `footer`. XMin reemplaza `{Year}` por el año actual. |
| `[[menu.main]]` | El menú superior. XMin itera `.Site.Menus.main` en su partial `header.html`. `url` se pasa por `relURL`, así que no lleva `/blog/`. |

Para agregar una entrada al menú: copiar un bloque `[[menu.main]]`, incrementar `weight` (menor = más a la izquierda).

---

## 4. Cómo renderiza Hugo (el pipeline)

```
content/*.md  ──► frontmatter + Markdown ──► Hugo decide el template
                                              │
                    layouts/ (proyecto) ──────┤  precedentemente a
                    themes/hugo-xmin/layouts/ ┘
                                              ▼
                          header.html → contenido → footer.html
                                              ▼
                                   public/ (HTML + CSS + estáticos)
                                              ▼
                                 rama gh-pages → GitHub Pages
```

Cómo elige Hugo el template (orden de búsqueda):

1. `layouts/<sección>/<tipo>.html` — por ejemplo `layouts/projects/list.html`.
2. `layouts/_default/<tipo>.html`.
3. Lo mismo dentro de `themes/hugo-xmin/layouts/`.

Tipos principales: `single.html` (una página), `list.html` (sección o taxonomía), `index.html` (home), `terms.html` (índice de taxonomías), `404.html`.

Regla clave de XMin: **no usa `baseof.html` ni `{{ define "main" }}`**. Cada template llama explícitamente a:

```html
{{ partial "header.html" . }}   <!-- abre <html>, <head>, <body> y <nav> -->
... contenido ...
{{ partial "footer.html" . }}   <!-- cierra <footer>, <body> y <html> -->
```

Por eso las plantillas viejas del otro tema (que usaban `define`) tuvieron que reescribirse.

---

## 5. Templates: precedencia y nombres

### `layouts/index.html` — home

Muestra `content/_index.md` y los 10 últimos posts. Usa `where site.RegularPages "Section" "posts"` para no mezclar Sobre mí/proyectos/eventos en el listado.

### `layouts/posts/list.html` — archivo de posts

Usa `.RegularPages.ByDate.Reverse` para listar solo los posts ordenados por fecha, sin contar la página de sección.

### `layouts/apuntes/list.html` — apuntes

Igual que el de posts, pero usa `.Pages.ByDate.Reverse`: en `/apuntes/` muestra los cuadernos (subsecciones) y dentro de cada cuaderno muestra sus apuntes. La diferencia con posts es de contenido, no de diseño: **apuntes** son de la universidad; **posts** son cosas personales.

### `layouts/projects/*` y `layouts/events/*`

Listados y páginas individuales con campos propios (`year`, `status`, `stack`, `repo`, `demo`, `kind`, `place`, `slides`). Los datos vienen del frontmatter; el template solo los ordena y muestra.

### `layouts/_default/terms.html` y `term.html` — tags y categorías

XMin trae un `list.html` que reutiliza el formato de posts y por eso muestra la fecha de cada entrada. Acá se sobrescribe con dos plantillas propias que no la muestran:

- `terms.html` es el índice (`/tags/`, `/categories/`): lista cada término con su cantidad de páginas entre paréntesis. En `/tags/` agrega un `<input type="search">` con un script que oculta los `<li>` cuyo tag no contiene lo escrito (sin librerías; usa el atributo `hidden`).
- `term.html` es la página de un término (`/tags/musica/`, `/categories/musica/`): lista los títulos con link, sin fecha.

Son las únicas plantillas de `_default/` del proyecto; el resto viene del tema.

### `layouts/_partials/head_custom.html`

XMin deja dos hooks vacíos: `head_custom.html` (dentro de `<head>`) y `foot_custom.html` (antes de cerrar `<body>`). Acá metemos:

- favicons + `site.webmanifest`;
- dos reglas mínimas en un `<style>`: `.menu li { margin-right: 0.5em; }` (con `--minify` los ítems del menú quedaban pegados) y `.article-meta { background: none; padding: 0; }` (XMin le pone un fondo gris al bloque título + fecha);
- KaTeX con `auto-render` (carga `defer`, busca delimitadores en el DOM);
- Mermaid como módulo ES, **solo si la página contiene la palabra `mermaid`** (ahorra ~1 MB en el resto).

### `layouts/shortcodes/qa.html`

`<details>` para ejercicios con respuesta oculta. Se usa así:

```markdown
{{< qa q="¿Qué es una función?" badge="Ejercicio 1" >}}
Es un bloque de código reutilizable.
{{< /qa >}}
```

### `layouts/_default/_markup/render-codeblock-mermaid.html`

Un *render hook*: transforma todo bloque ```` ```mermaid ```` en `<pre class="mermaid">`. El JS de Mermaid lo convierte en diagrama en el navegador.

---

## 6. Secciones y contenido

| Sección | Carpeta | URL | Template de lista |
|---|---|---|---|
| Home | `content/_index.md` | `/blog/` | `index.html` |
| Sobre mí | `content/about.md` | `/blog/about/` | XMin `single.html` |
| Posts | `content/posts/` | `/blog/posts/` | `posts/list.html` |
| Apuntes | `content/apuntes/` | `/blog/apuntes/` | `apuntes/list.html` |
| Cuadernos | `content/apuntes/<tema>/` | `/blog/apuntes/<tema>/` | `apuntes/list.html` |
| Proyectos | `content/projects/` | `/blog/projects/` | `projects/list.html` |
| Eventos | `content/events/` | `/blog/events/` | `events/list.html` |
| Tags / Categorías | (taxonomías) | `/blog/tags/`, `/blog/categories/` | `_default/terms.html` + `_default/term.html` (sin fechas) |

Los apuntes de cursada (Estadística II, Análisis Matemático) y la investigación de distancias léxicas viven en `content/apuntes/`, organizados en **cuadernos**: una carpeta por tema con su `_index.md` de portada y los apuntes adentro. Los posts (`content/posts/`) son cosas personales: música, viajes, dibujos, teoría del sitio. La distinción es de contenido, no de formato: ambos comparten la plantilla de lista y los `tags`/`categories`.

`content/events/ejemplo-evento.md` está en `draft = true`: es la plantilla comentada, no se publica.

---

## 7. Frontmatter de referencia

Hugo acepta TOML (`+++`), YAML (`---`) o JSON. En este repo se usa TOML por convención.

### Post / apunte

```toml
+++
title = 'Título'
date = 2026-11-19T12:00:00-03:00
draft = true                 # true = solo se ve con `hugo server -D`
author = 'Valentino Mendé'
tags = ['tag1', 'tag2']
categories = ['Categoría']
+++
```

### Proyecto

```toml
+++
title = 'Nombre'
date = 2026-11-19
year = 2026
status = 'en curso'          # libre: "en curso", "terminado", "investigación"
stack = ['Python', 'Hugo']
repo = 'https://github.com/...'
demo = 'https://...'
draft = false
+++
```

### Evento

```toml
+++
title = 'Nombre del evento'
date = 2026-11-19
kind = 'charla'              # charla, curso, hackathon, congreso...
place = 'Buenos Aires'
slides = 'https://...'
draft = true
+++
```

**Ojo con los nombres:** las claves del frontmatter son las que leen los templates. Si escribís `keywords` en vez de `tags`, el post se ve igual pero no aparece en `/tags/`. Los archivos viejos tenían `keyword`/`keywords` y `toc`/`tocBorder`: se normalizaron a `tags` y se sacaron los campos muertos.

---

## 8. Shortcodes y extras

| Extra | Dónde vive | Cómo se usa |
|---|---|---|
| `qa` | `layouts/shortcodes/qa.html` | `{{< qa q="..." >}}...{{< /qa >}}` |
| Mermaid | render hook + JS condicional | bloque ```` ```mermaid ```` |
| Fórmulas | passthrough + KaTeX | `$x^2$`, `$$\int f$$` |
| YouTube | shortcode nativo de Hugo | `{{< youtube ID >}}` |
| `relref` | shortcode nativo de Hugo | `{{< relref "about.md" >}}` — genera la URL con `/blog/` incluido |
| Webamp | **eliminado** | ya no existe; el post de Low Roar quedó como reseña |

Para un link interno siempre usá `relref` o `{{ "ruta/" | relURL }}`. Nunca escribas `/blog/...` a mano en el contenido: si el repo vuelve a cambiar de nombre, `baseURL` se actualiza solo y los links siguen vivos.

---

## 9. Estilos

No hay hojas de estilo propias. Se usa `themes/hugo-xmin/static/css/style.css` (51 líneas) y `fonts.css` directamente del submodule, sin copias ni variables agregadas. Las únicas excepciones son las dos reglas de `head_custom.html`: el espacio entre los ítems del menú y la eliminación del fondo gris de `.article-meta`. Las plantillas de listado usan el mismo markup que XMin (`<span class="date">`, `<ul>`), y el shortcode `qa` es un `<details>` sin clases.

Si en algún momento querés cambiar el look: copiá esos archivos a `static/css/` y editá la copia (Hugo prioriza `static/` del proyecto sobre el del tema). No hace falta tocar el submodule.

---

## 10. Escribir y publicar

```bash
# 1. servidor local con drafts visibles
hugo server -D
# → http://localhost:1313/blog/

# 2. crear contenido
hugo new posts/mi-nuevo-post.md
hugo new apuntes/mi-tema/_index.md
hugo new apuntes/mi-tema/primer-apunte.md
hugo new projects/mi-proyecto.md
hugo new events/mi-evento.md

# 3. escribir en el .md, pasar draft = false cuando esté listo

# 4. verificar el sitio final (sin drafts)
hugo --minify

# 5. guardar y subir
git add .
git commit -m "posts: agregar mi-nuevo-post"
git push origin master

# 6. publicar
bash deploy.sh
```

Convenciones: nombres de archivo sin tildes ni espacios, separados con guiones; fechas en ISO con zona `-03:00`. Los borradores (`draft = true`) se ven en local con `-D` pero no se publican.

---

## 11. Deploy

Los tres scripts (`deploy.sh`, Linux/macOS; `deploy.ps1`, PowerShell; `deploy.bat`, Windows) hacen lo mismo:

1. Chequean que estés en `master`.
2. `git fetch origin`.
3. Limpian y montan `public/` como *worktree* de la rama `gh-pages`.
4. Corren `hugo --minify`.
5. Hacen commit y push de `gh-pages` si hay cambios.

GitHub Pages apunta a la rama `gh-pages` y sirve `https://mvalentne.github.io/blog/`. Tarda 1–5 minutos en reflejar cambios.

Si el repo vuelve a renombrarse, hay que actualizar **cuatro** lugares: `baseURL` en `hugo.toml`, el mensaje final de los scripts de deploy, este archivo y el README; además de `git remote set-url origin ...`.

---

## 12. Mantenimiento

### Actualizar el tema XMin

```bash
git submodule update --remote themes/hugo-xmin
git add themes/hugo-xmin
git commit -m "chore: actualizar submodule de hugo-xmin"
```

Al clonar de cero, **siempre** con `--recurse-submodules`; si ya clonaste sin la flag:

```bash
git submodule update --init --recursive
```

El submodule quedó fijado en el commit `1744c80` (master de XMin). El único partial propio es `head_custom.html`; el CSS viene del tema. Después de actualizar, corré `hugo --minify` para verificar.

### Cambiar Sobre mí

Editar `content/about.md`. No hay plantilla especial: es Markdown normal. Lo mismo para proyectos y eventos.

### Agregar un tipo de contenido nuevo

1. `hugo new <seccion>/ejemplo.md`.
2. Si necesitás una vista especial, crear `layouts/<seccion>/list.html` y/o `single.html` con `partial "header.html"` / `partial "footer.html"`.
3. Agregar la entrada en `[[menu.main]]` de `hugo.toml` si querés que aparezca arriba.
4. Documentarlo acá.

---

## 13. Glosario y troubleshooting

| Término | Significado |
|---|---|
| **Frontmatter** | Bloque de metadatos al principio del `.md` (`+++` en TOML). |
| **Section** | Agrupación por carpeta dentro de `content/`. `posts`, `apuntes`, `projects`, etc. |
| **`_index.md`** | Archivo que convierte una carpeta en sección y define su portada. |
| **RegularPage** | Página de contenido (post, apunte, proyecto), no sección ni taxonomía. |
| **Partial** | Fragmento HTML reutilizable (`header.html`, `footer.html`). |
| **Taxonomía** | Agrupación transversal: `tags`, `categories`. |
| **Permalink** | URL final de una página; la controla `[permalinks]` en `hugo.toml`. |
| **Submodule** | Repo de Git dentro de otro repo. El tema es uno. |

| Síntoma | Causa / solución |
|---|---|
| `hugo: command not found` | Hugo no está en el PATH. Ver `hugo version`. |
| El sitio se ve sin estilos | Clonaste sin submodule o falta `static/css/style.css`. Corré `git submodule update --init`. |
| Los links internos apuntan a `/...` en vez de `/blog/...` | Usaste una ruta absoluta. Cambiala por `relref` o `relURL`. |
| Un post no aparece | `draft = true`, o el frontmatter tiene un error de TOML. probá `hugo server -D`. |
| "shortcode not found" | Quedó una invocación a un shortcode eliminado (ej. `webamp`). Buscala con `grep -r '{{<' content`. |
| Las fórmulas no se renderizan | Revisá que el passthrough esté en `hugo.toml` y que KaTeX cargue desde el CDN. |
| El deploy no publica | No estás en `master`, o `public/` no es el worktree de `gh-pages`. El script lo recrea solo. |

---

Última actualización: 2026-11-19 — migración a XMin, blog personal, sin mural ni Webamp.
