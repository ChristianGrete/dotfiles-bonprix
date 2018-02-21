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

    mkdir "$PROJECTS/@bonprix" >/dev/null 2>&1

    if [ $? -eq 0 ]
      then
        echo 'success.'
    else
      echo 'failed.'

      echo; echo "Error: Cannot setup bonprix workspace." >&2

      exit 1
    fi
fi
