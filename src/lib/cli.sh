bonprix () {
  [ $# -lt 1 ] && cd "$BONPRIX" && return

  usage="$(cat <<EOF
Usage: bonprix option | command [arguments...] | paths...

Description:
  A user friendly CLI to simplify common tasks at bonprix.

Version: $BONPRIX_PACKAGE_VERSION

Location:
  $BONPRIX_PACKAGE_SOURCES/lib/cli.sh

Alias: bp

Options:
  -?, -h, --help         Show usage (print this text)
  -v, --version          Print bonprix CLI version

Commands:
  <no command>           Go to workspace
  .                      Go to workspace and open it#
  admin <commands...>    Login or execute <commands...> as admin
  help <command>         Show more information on a command
  package <command>      Go to dotfiles package and optionally run <command>
  <paths...>             Go to workspace directories or open files in it

Run \`bonprix help <command>\` for more information on specific commands.
EOF
  )"

  if [ "$1" = '-?' ] || [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
    echo "$usage"; return
  fi

  unset usage

  if [ "$1" = '-v' ] || [ "$1" = '--version' ]; then
    echo "$BONPRIX_PACKAGE_VERSION"; return
  fi

  [ "$1" = '.' ] && cd "$BONPRIX" && "$VISUAL" '.' && return

  if [ "$1" = 'package' ] || [ "$1" = 'pkg' ]; then
    if [ $# -lt 2 ] || [ "$2" = '.' ]; then
      cd "$BONPRIX_PACKAGE"
    fi
  fi

  if [ -x "$BONPRIX_PACKAGE_SOURCES/libexec/$1" ]; then
    command="$1"; shift

    command "$BONPRIX_PACKAGE_SOURCES/libexec/$command" "$@"; return
  fi

  if [ -r "$BONPRIX/$1" ]; then
    if [ -d "$BONPRIX/$1" ]; then
      if [ $# -eq 1 ] || [ "$2" = '.' ]; then
        cd "$BONPRIX/$1"
      fi

      if [ $# -gt 1 ]; then
        [ "$2" = '.' ] && "$VISUAL" '.' && return

        paths="$BONPRIX/$1"; shift

        for segment in "$@"; do
          [ "$segment" = '.' ] && [ -d "$paths" ] && cd "$paths" \
            && "$VISUAL" '.' && return

          if [ -r "$paths/$segment" ]; then
            paths="$paths/$segment"

            [ ! -d "$paths" ] && break
          else
            echo "$paths/$segment: invalid path" >&2; return 1
          fi
        done

        unset segment

        [ -d "$paths" ] && cd "$paths" && return

        [ -f "$paths" ] && cd "$(dirname "$paths")" && "$VISUAL" "$paths"
      fi
    elif [ -f "$BONPRIX/$1" ]; then
      cd "$(dirname "$BONPRIX/$1")" && "$VISUAL" "$BONPRIX/$1"
    fi
  else
    echo "$BONPRIX/$1: invalid path" >&2; return 1
  fi
}
