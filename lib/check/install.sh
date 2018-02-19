echo '... Installing dotfiles:
'

"$HOME/.dotfiles/bin/install"

[ $? -eq 0 ] && . "$HOME/.profile"

if [ $? -ne 0 ]
  then
    echo 'Error: Unable to install and load dotfiles.' >&2

    exit 1
fi

[ -z ${PWD:+PWD} ] || [ "$PWD" != "$(pwd)" ]

[ $? -eq 0 ] && export PWD="$(pwd)"

[ -z ${PROFILES:+PROFILES} ] && export PROFILES="$HOME/.profiles"

echo '
... Installing dotfiles-bonprix package:
'

"$PWD/bin/install"
