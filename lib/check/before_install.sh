printf 'BEFORE INSTALL:
Downloading dotfiles to `~/.dotfiles` ... '

dotfiles_repository='https://github.com/ChristianGrete/dotfiles.git'

git clone "$dotfiles_repository" "$HOME/.dotfiles" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to download dotfiles." >&2

  exit 1
fi

printf 'Preparing dotfiles installation ... '

"$HOME/.dotfiles/bin/check" before_install >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to prepare dotfiles installation." >&2

  exit 1
fi
