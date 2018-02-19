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

  echo; echo 'Error: Unable to install and load dotfiles.' >&2

  exit 1
fi

[ -z ${PWD:+PWD} ] || [ "$PWD" != "$(pwd)" ]

[ $? -eq 0 ] && export PWD="$(pwd)"

printf 'Installing dotfiles-bonprix package ... '

"$PWD/bin/install" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Cannot install dotfiles-bonprix package." >&2

  exit 1
fi
