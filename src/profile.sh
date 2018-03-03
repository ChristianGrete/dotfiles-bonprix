export BONPRIX="$PROJECTS/@bonprix"
export BONPRIX_PACKAGE="$DOTFILES_PACKAGES/dotfiles-bonprix"
export BONPRIX_PACKAGE_SOURCES="$BONPRIX_PACKAGE/dist"
export BONPRIX_PACKAGE_VERSION="$(
  cd "$BONPRIX_PACKAGE"

  git describe --tags "$(git rev-list --max-count=1 --tags)" 2>/dev/null

  [ $? -ne 0 ] && echo 'Unversioned'
)"

for file in env lib/cli.sh aliases
  do
    . "$BONPRIX_PACKAGE_SOURCES/$file"
done

unset file
