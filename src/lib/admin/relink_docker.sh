relink_docker () {
  executables='docker,docker-compose,docker-machine,hyperkit,vpnkit'
  source_path='/Applications/Docker.app/Contents/Resources/bin'
  target_path='/usr/local/bin'

  ln -fs "$source_path/{$executables}" "$target_path"
  ln -fs "$source_path/docker-credential-osxkeychain.bin" \
    "$target_path/docker-credential-osxkeychain"
  ln -fs "$source_path/notary.bin" "$target_path/notary"
}
