fix_zsh_comp_perms () {
  [ ! -d "${HOME%-admin}" ] && exit 1

  if [ "$1" == '' ]; then
    echo '
✅  No insecure directories detected.'

    exit
  fi

  insecure_directories="$1"; shift

  echo '
🔑  You may need to re-enter your password to gain root access.'

  if ! command sudo -v >/dev/null 2>&1; then
    echo; echo '💥  Error.' >&2

    exit 1
  fi

  printf '
⚙️  Fixing Zsh completion permissions ... '

  printf "$insecure_directories" \
    | command sudo command xargs command chmod go-w >/dev/null 2>&1

  [ $? -ne 0 ] && echo 'failed.' && exit 1

  printf 'success.

👤  Fixing Zsh completion ownership ... '

  printf "$insecure_directories" \
    | command sudo command xargs command chown root >/dev/null 2>&1

  [ $? -ne 0 ] && echo 'failed.' && exit 1

  echo 'success.'

  unset insecure_directories

  fields=''
  managed_user_home="${HOME%-admin}"
  dump_filename_prefix="$managed_user_home/.zcompdump"

  ifs="$IFS"; IFS='
'

  for field in $(list "$managed_user_home"); do
    if ! case "$field" in "$dump_filename_prefix"*) false;; esac; then
      command sudo command rm -fr "$field" >/dev/null 2>&1

      [ $? -ne 0 ] && fields="$fields$IFS$field"
    fi
  done

  IFS="$ifs"; unset ifs

  if [ "$fields" != '' ]; then
    echo; echo "‼️  Warning! The following files could not be removed:
$fields" >&2

    echo '
You may remove them manually and then run `compinit`.'

    exit 1
  fi
}
