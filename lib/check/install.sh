printf 'INSTALL STEP:
Installing dotfiles to `~` ... '

"$HOME/.dotfiles/bin/install" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Cannot install dotfiles." >&2

  exit 1
fi

printf 'Initializing dotfiles ... '

. "$HOME/.profile"

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo 'Error: Unable to initialize dotfiles.' >&2

  exit 1
fi

[ -z ${PWD:+PWD} ] || [ "$PWD" != "$(pwd)" ]

[ $? -eq 0 ] && export PWD="$(pwd)"

printf 'Linking dotfiles-bonprix package ... '

symlink "$PWD" "$DOTFILES_PACKAGES/dotfiles-bonprix" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to link dotfiles-bonprix package." >&2

  exit 1
fi

printf 'Building dotfiles-bonprix package ... '

"$DOTFILES_PACKAGES/dotfiles-bonprix/bin/build" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Cannot build dotfiles-bonprix package." >&2

  exit 1
fi

printf 'Installing dotfiles-bonprix package ... '

"$DOTFILES_PACKAGES/dotfiles-bonprix/bin/install" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Cannot install dotfiles-bonprix package." >&2

  exit 1
fi
