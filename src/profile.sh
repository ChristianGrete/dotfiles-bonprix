export BONPRIX="$PROJECTS/@bonprix"
export BONPRIX_PACKAGE="$DOTFILES_PACKAGES/dotfiles-bonprix"
export BONPRIX_PACKAGE_SOURCES="$BONPRIX_PACKAGE/dist"
export BONPRIX_PACKAGE_VERSION="$(
  cd "$BONPRIX_PACKAGE"

  git describe --tags "$(git rev-list --max-count=1 --tags)" 2>/dev/null
)"

. "$BONPRIX_PACKAGE_SOURCES/lib/cli.sh"

alias bp='bonprix'
alias bp.='bp .'
alias bpp='bp pkg'
alias bppb='bpp build'
