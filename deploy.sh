#!/usr/bin/env bash
# Deploy del blog a GitHub Pages.
#
# Genera el sitio con Hugo y lo publica en la rama gh-pages, usando public/
# como worktree de Git. Todo lo que puede cambiar (ramas, remote, URL) se
# calcula o se puede override por entorno; no hay rutas ni URLs fijas.
#
# Uso: bash deploy.sh [--help]
#
# Variables opcionales:
#   SOURCE_BRANCH=master  rama desde la que se publica (default: master)
#   PAGES_BRANCH=gh-pages rama destino de GitHub Pages
#   REMOTE=origin         remote al que se hace push
#   SITE_URL=...          URL que se muestra al terminar (default: inferida)

set -Eeuo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
PUBLIC_DIR="$REPO_ROOT/public"

SOURCE_BRANCH="${SOURCE_BRANCH:-master}"
PAGES_BRANCH="${PAGES_BRANCH:-gh-pages}"
REMOTE="${REMOTE:-origin}"

# --------------------------------------------------------------------- helpers
info() { printf '==> %s\n' "$*"; }
ok()   { printf '    OK: %s\n' "$*"; }
warn() { printf '    ATENCIÓN: %s\n' "$*" >&2; }
die()  { printf '\nERROR: %s\n' "$*" >&2; exit 1; }

trap 'printf "\nERROR: falló en la línea %d (%s)\n" "$LINENO" "$BASH_COMMAND" >&2' ERR

usage() {
  cat <<EOF
Uso: bash deploy.sh [opciones]

Publica el sitio generado por Hugo en la rama '$PAGES_BRANCH'.

Opciones:
  -h, --help    mostrar esta ayuda

Variables de entorno (valor por defecto):
  SOURCE_BRANCH  $SOURCE_BRANCH    rama desde la que se publica
  PAGES_BRANCH   $PAGES_BRANCH     rama que sirve GitHub Pages
  REMOTE         $REMOTE           remote de origen y destino
  SITE_URL       inferida          URL final del sitio
EOF
}

case "${1:-}" in
  -h|--help) usage; exit 0 ;;
  "") ;;
  *) die "Opción desconocida: '$1' (probá --help)" ;;
esac

# Infiere https://<owner>.github.io/<repo>/ del remote, sin URL hardcodeada.
detect_site_url() {
  local remote_url slug
  remote_url="$(git -C "$REPO_ROOT" remote get-url "$REMOTE" 2>/dev/null || true)"
  slug="$(printf '%s\n' "$remote_url" | sed -nE \
    's#^(git@github\.com:|ssh://git@github\.com/|https?://github\.com/)([^/]+)/([^/]+)/?$#\2/\3#p')"
  slug="${slug%.git}"
  if [ -z "$slug" ]; then
    printf 'la URL de GitHub Pages del repo (no se pudo inferir del remote)'
  else
    printf 'https://%s.github.io/%s/' "${slug%%/*}" "${slug##*/}"
  fi
}

# Comprueba que el puntero .git de public/ resuelva a un gitdir existente.
# Un worktree viejo (repo renombrado/movido) deja un .git que apunta a una
# ruta muerta: eso es lo que rompía el deploy anteriormente.
gitdir_link_ok() {
  local link target
  if [ -f "$PUBLIC_DIR/.git" ]; then
    link="$(sed -n 's/^gitdir:[[:space:]]*//p' "$PUBLIC_DIR/.git" | head -n 1)"
    [ -n "$link" ] || return 1
    case "$link" in
      /*) target="$link" ;;
      *)  target="$PUBLIC_DIR/$link" ;;
    esac
    [ -e "$target" ]
  else
    [ -d "$PUBLIC_DIR/.git" ]
  fi
}

# 0 sólo si public/ es un worktree registrado y válido de ESTE repositorio.
is_our_worktree() {
  [ -e "$PUBLIC_DIR/.git" ] || return 1
  gitdir_link_ok || return 1
  local top
  # Dentro de un worktree, --show-toplevel es la raíz del worktree (public/),
  # no la del repo principal. La pertenencia al repo la confirma worktree list.
  top="$(git -C "$PUBLIC_DIR" rev-parse --show-toplevel 2>/dev/null)" || return 1
  [ "$top" = "$PUBLIC_DIR" ] || return 1
  git -C "$REPO_ROOT" worktree list --porcelain | grep -qxF "worktree $PUBLIC_DIR"
}

# Deja public/ listo para volver a crearlo como worktree de PAGES_BRANCH.
reset_public_dir() {
  git -C "$REPO_ROOT" worktree prune

  [ -e "$PUBLIC_DIR" ] || return 0

  if is_our_worktree; then
    info "Desmontando el worktree anterior de public/..."
    git -C "$REPO_ROOT" worktree remove --force "$PUBLIC_DIR"
  elif [ -e "$PUBLIC_DIR/.git" ] && ! gitdir_link_ok; then
    warn "public/ tenía un worktree huérfano (gitdir inexistente); se recrea."
    rm -rf -- "$PUBLIC_DIR"
  elif [ -e "$PUBLIC_DIR/.git" ]; then
    die "public/ contiene un .git de otro repo. Revisalo antes de borrarlo."
  else
    info "Limpiando public/ (no era un worktree)..."
    rm -rf -- "$PUBLIC_DIR"
  fi
}

# ---------------------------------------------------------------------- checks
info "Verificando herramientas..."
command -v git  >/dev/null 2>&1 || die "Git no está instalado o no está en el PATH."
command -v hugo >/dev/null 2>&1 || die "Hugo no está instalado o no está en el PATH."
git -C "$REPO_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1 \
  || die "$REPO_ROOT no es un repositorio Git."
git -C "$REPO_ROOT" remote get-url "$REMOTE" >/dev/null 2>&1 \
  || die "No existe el remote '$REMOTE'."

info "Verificando rama actual..."
CURRENT_BRANCH="$(git -C "$REPO_ROOT" symbolic-ref --quiet --short HEAD || true)"
[ "$CURRENT_BRANCH" = "$SOURCE_BRANCH" ] \
  || die "Debés estar en '$SOURCE_BRANCH' para publicar (actual: ${CURRENT_BRANCH:-HEAD despegado})."

if [ -n "$(git -C "$REPO_ROOT" status --porcelain --untracked-files=no)" ]; then
  warn "Hay cambios sin commitear: el sitio publicado no los va a incluir."
fi

# --------------------------------------------------------------------- deploy
info "Sincronizando con $REMOTE..."
git -C "$REPO_ROOT" fetch --quiet "$REMOTE"

reset_public_dir

info "Montando public/ como worktree de '$PAGES_BRANCH'..."
if git -C "$REPO_ROOT" show-ref --verify --quiet "refs/remotes/$REMOTE/$PAGES_BRANCH"; then
  git -C "$REPO_ROOT" worktree add --quiet -B "$PAGES_BRANCH" "$PUBLIC_DIR" "$REMOTE/$PAGES_BRANCH"
elif git -C "$REPO_ROOT" show-ref --verify --quiet "refs/heads/$PAGES_BRANCH"; then
  git -C "$REPO_ROOT" worktree add --quiet "$PUBLIC_DIR" "$PAGES_BRANCH"
else
  git -C "$REPO_ROOT" worktree add --quiet --orphan -B "$PAGES_BRANCH" "$PUBLIC_DIR"
fi

info "Limpiando el contenido anterior de public/..."
find "$PUBLIC_DIR" -mindepth 1 \
  ! -path "$PUBLIC_DIR/.git" \
  ! -path "$PUBLIC_DIR/.git/*" \
  -delete
[ -e "$PUBLIC_DIR/.git" ] || die "Se perdió el .git del worktree al limpiar."

info "Generando el sitio con Hugo..."
hugo --minify --source "$REPO_ROOT" --destination "$PUBLIC_DIR"
[ -e "$PUBLIC_DIR/.git" ] || die "Hugo borró el .git del worktree de public/."

info "Publicando en '$REMOTE/$PAGES_BRANCH'..."
git -C "$PUBLIC_DIR" add --all

if git -C "$PUBLIC_DIR" diff --cached --quiet; then
  ok "Sin cambios para publicar."
  exit 0
fi

SRC_SHA="$(git -C "$REPO_ROOT" rev-parse --short HEAD)"
STAMP="$(date '+%Y-%m-%d %H:%M:%S')"
git -C "$PUBLIC_DIR" commit --quiet -m "Deploy: $SRC_SHA — $STAMP"
git -C "$PUBLIC_DIR" push --quiet "$REMOTE" "HEAD:refs/heads/$PAGES_BRANCH"

ok "Sitio publicado en: ${SITE_URL:-$(detect_site_url)}"
