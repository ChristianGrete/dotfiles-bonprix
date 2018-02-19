echo '... Restoring CI environment:
'

for dotfile in bash_profile bashrc profile zshrc
  do
    printf "Removing generated symlink \`~/.$dotfile\` ... "

    rm -rf "$HOME/.$dotfile" >/dev/null 2>&1

    echo 'done.'

    printf "Restoring \`~/.$dotfile\` from backup ... "

    mv "$HOME/.$dotfile.backup" "$HOME/.$dotfile" >/dev/null 2>&1

    if [ $? -eq 0 ]
      then
        echo 'success.'
    else
      echo 'failed.'

      echo; echo "Error: Unable to restore \`~/.$dotfile\`." >&2

      exit 1
    fi
done
