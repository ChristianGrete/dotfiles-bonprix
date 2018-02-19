printf 'SCRIPT STEP:
Loading dotfiles ... '

. "$HOME/.profile"

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo 'Error: Unable to load dotfiles.' >&2

  exit 1
fi

echo "$BONPRIX_PACKAGE_VERSION"
