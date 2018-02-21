if [ ! -x "$(command -v -- symlink 2>/dev/null)" ]
  then
    echo "$(cat <<EOF
Error: The \`symlink\` command cannot execute. Please make sure that dotfiles is
correctly installed. Then try again.
EOF
    )" >&2

    exit 126
fi

if [ -z ${PROFILES:+PROFILES} ] || [ ! -d "$PROFILES" ] || [ ! -w "$PROFILES" ]
  then
    echo "$(cat <<EOF
Error: Your profiles directory is undefined or not writable. Please make sure
that dotfiles is correctly installed and the user permissions are properly set.
Then try again.
EOF
    )" >&2

    exit 1
fi

echo 'Creating symbolic link...'

symlink "$PWD/src/profile.sh" "$PROFILES/bonprix.sh"
