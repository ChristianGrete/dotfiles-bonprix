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

bonprix -h

if [ $? -ne 0 ]
  then
    echo; echo 'Error: `bonprix -h` command failed.' >&2
fi

echo '
BUILD SUCCESSFUL!'
