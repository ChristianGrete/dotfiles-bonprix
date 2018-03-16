fix_docker_perms () {
  executables='docker docker-compose docker-machine hyperkit vpnkit'
  source_path='/Applications/Docker.app/Contents/Resources/bin'
  target_path='/usr/local/bin'

  for executable in $executables; do
    command ln -fs "$source_path/$executable" "$target_path"
  done

  command ln -fs "$source_path/docker-credential-osxkeychain.bin" \
    "$target_path/docker-credential-osxkeychain"
  command ln -fs "$source_path/notary.bin" "$target_path/notary"
}
