fix_usr_local_acls () {
  [ ! -d "${HOME%-admin}" ] && exit 1

  admin_user="$(whoami)"
  managed_user="${admin_user%-admin}"

  permissions="add_file,add_subdirectory,append,delete,delete_child,execute,\
list,read,readattr,readextattr,readsecurity,search,write,writeattr,writeextattr"

  basenames="bin Caskroom Cellar etc Frameworks Homebrew include lib opt sbin \
share var"

  command sudo -v >/dev/null 2>&1 # TODO

  printf '🔑  Resetting ACLs in /usr/local ... '

  (
    for basename in $basenames; do
      command sudo command chown -R "$admin_user" "/usr/local/$basename" \
        >/dev/null 2>&1 \
      && command sudo command chmod -RN "/usr/local/$basename" >/dev/null 2>&1 \
      && command sudo command chmod -R +a "$managed_user allow $permissions" \
        "/usr/local/$basename" >/dev/null 2>&1

      [ $? -eq 0 ] || exit 1
    done
  )

  [ $? -ne 0 ] && echo 'failed.' && exit 1

  echo 'success.'
}
