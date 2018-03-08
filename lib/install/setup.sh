if [ -z ${PROJECTS:+PROJECTS} ] || [ ! -d "$PROJECTS" ] || [ ! -w "$PROJECTS" ]
  then
    echo "$(cat <<EOF
Error: Your projects directory is undefined or not writable. Please make sure
that dotfiles is correctly installed and the user permissions are properly set.
Then try again.
EOF
    )" >&2

    exit 1
fi

if [ ! -d "$PROJECTS/@bonprix" ]
  then
    printf 'Setting up bonprix workspace ... '

    command mkdir "$PROJECTS/@bonprix" >/dev/null 2>&1

    if [ $? -eq 0 ]
      then
        echo 'success.
'
    else
      echo 'failed.'

      echo; echo "Error: Cannot setup bonprix workspace." >&2

      exit 1
    fi
fi

if [ -d "$HOME-admin" ]
  then
    echo "$(cat <<EOF
It is required to log in to your admin user account to install Homebrew
dependencies on this machine.

Username: $(whoami)-admin
EOF
    )"

    printf 'Password: '

    $(
      cd "$PWD/dist"

      command su "$(whoami)-admin" -c 'brew bundle' >/dev/null 2>&1
    )

    if [ $? -ne 0 ]
      then
        echo '
'

        echo "$(cat <<EOF
Error: Unable to install Homebrew dependencies as admin user. Maybe the password
you have entered was incorrect. Please try again or contact your system
administrator.
EOF
        )"

        exit 1
    fi

    echo
else
  printf 'Trying to install Homebrew dependencies with current user ... '

  $(
    cd "$PWD/dist"

    command brew bundle >/dev/null 2>&1
  )

  if [ $? -eq 0 ]
    then
      echo 'success.'
  else
    echo 'failed.'

    echo; echo "Error: Unable to install Homebrew dependencies." >&2

    exit 1
  fi
fi

echo
