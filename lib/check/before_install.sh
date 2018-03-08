printf 'BEFORE INSTALL STEP:
Downloading dotfiles to `~/.dotfiles` ... '

dotfiles_repository='https://github.com/ChristianGrete/dotfiles.git'

command git clone "$dotfiles_repository" "$HOME/.dotfiles" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to download dotfiles." >&2

  exit 1
fi

printf 'Setting up dotfiles workspace ... '

"$HOME/.dotfiles/bin/setup" >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Cannot setup dotfiles workspace." >&2

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

printf 'Tapping caskroom/cask repository ... '

command brew tap caskroom/cask >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to tap caskroom/cask repository." >&2

  exit 1
fi

printf 'Tapping caskroom/versions repository ... '

command brew tap caskroom/versions >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to tap caskroom/versions repository." >&2

  exit 1
fi

printf 'Tapping homebrew/bundle repository ... '

command brew tap homebrew/bundle >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "Error: Unable to tap homebrew/bundle repository." >&2

  exit 1
fi
