rm_docker_bins () {
  executables="docker docker-compose docker-credential-osxkeychain \
    docker-machine hyperkit notary vpnkit"
  binaries_path='/usr/local/bin'

  for executable in $executables; do
    command rm -fr "$binaries_path/$executable"
  done
}
