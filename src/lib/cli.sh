bonprix () {
  [ $# -lt 1 ] && cd "$BONPRIX" && return

  usage="$(cat <<EOF
Usage: bonprix option | command [arguments...]

Description:
  A user friendly CLI to simplify common tasks at bonprix.

Version: $BONPRIX_PACKAGE_VERSION

Location:
  $BONPRIX_PACKAGE_SOURCES/lib/cli.sh

Alias: bp

Options:
  -?, -h, --help       Show usage (print this text)
  -v, --version        Print bonprix CLI version

Commands:
  <no command>         Go to workspace
  .                    Go to workspace and open it
  help <command>       Show more information on a command
  package <command>    Go to dotfiles package and optionally run <command>

Run \`bonprix help <command>\` for more information on specific commands.
EOF
  )"

  [ "$1" = '-?' ] || [ "$1" = '-h' ] || [ "$1" = '--help' ]

  [ $? -eq 0 ] && echo "$usage" && return

  unset usage

  [ "$1" = '-v' ] || [ "$1" = '--version' ]

  [ $? -eq 0 ] && echo "$BONPRIX_PACKAGE_VERSION" && return

  [ "$1" = '.' ] && cd "$BONPRIX" && "$VISUAL" '.' && return

  if [ "$1" = 'package' ] || [ "$1" = 'pkg' ]
    then
      if [ $# -lt 2 ] || [ "$2" = '.' ]
        then
          cd "$BONPRIX_PACKAGE"
      fi
  fi

  if [ -x "$BONPRIX_PACKAGE_SOURCES/bin/$1" ]
    then
      command="$1"

      shift

      command "$BONPRIX_PACKAGE_SOURCES/bin/$command" $@
  fi
}
