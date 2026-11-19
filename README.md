# Valentino Mendé | Blog

Blog personal: apuntes, proyectos y eventos. Hecho con [Hugo](https://gohugo.io/) y el tema [XMin](https://github.com/yihui/hugo-xmin).

**Sitio:** <https://mvalentne.github.io/blog/>

## Arrancar

Necesitás Git y Hugo instalados.

```bash
git clone --recurse-submodules git@github.com:MValentne/blog.git
cd blog
hugo server -D
```

Abrí <http://localhost:1313/blog/>. El flag `-D` muestra los borradores.

Si ya clonaste sin submodules:

```bash
git submodule update --init --recursive
```

## Escribir

```bash
hugo new posts/mi-post.md
hugo new hilos/materia/clase.md
hugo new projects/mi-proyecto.md
hugo new events/mi-evento.md
```

Editás el `.md`, dejás `draft = true` mientras escribís y lo pasás a `false` para publicar. El menú está en `hugo.toml`; el CV en `content/about.md`.

## Publicar

```bash
hugo --minify          # verificación final
git add . && git commit -m "posts: mi-post" && git push origin master
bash deploy.sh         # Windows: deploy.bat / deploy.ps1
```

El deploy genera el sitio en `public/` y lo sube a la rama `gh-pages`, que es la que sirve GitHub Pages.

## Entender el proyecto

Todo está documentado en **[CODEBASE.md](CODEBASE.md)**: arquitectura, templates, campos del frontmatter, estilos, deploy y troubleshooting. Empezá por ahí.
