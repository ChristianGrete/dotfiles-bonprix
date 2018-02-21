printf 'SCRIPT STEP:
Loading dotfiles ... '

. "$HOME/.profile"

if [ $? -eq 0 ]
  then
    echo 'success.
'
else
  echo 'failed.'

  echo; echo 'Error: Unable to load dotfiles.' >&2

  exit 1
fi

[ -z ${PWD:+PWD} ] || [ "$PWD" != "$(pwd)" ] && export PWD="$(pwd)"

"$PWD/bin/test"

if [ $? -ne 0 ]
  then
    echo; echo 'Error: Testing dotfiles-bonprix package failed.' >&2

    exit 1
fi

echo '
BUILD SUCCESSFUL!'
