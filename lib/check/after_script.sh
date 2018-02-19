printf 'AFTER SCRIPT STEP:
Running subsequent dotfiles step ... '

"$HOME/.dotfiles/bin/check" after_script >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to succeed subsequent dotfiles step." >&2

  exit 1
fi
