export BONPRIX="$PROJECTS/@bonprix"
export BONPRIX_PACKAGE="$DOTFILES_PACKAGES/dotfiles-bonprix"
export BONPRIX_PACKAGE_SOURCES="$BONPRIX_PACKAGE/dist"
export BONPRIX_PACKAGE_VERSION="$(
  cd "$BONPRIX_PACKAGE"

  git describe --tags "$(git rev-list --max-count=1 --tags)" 2>/dev/null

  [ $? -ne 0 ] && echo 'Unversioned'
)"

export ANT_HOME="$(brew --prefix ant)"
export IVY_HOME="$(brew --prefix ivy)"
export JAVA_HOME="$(/usr/libexec/java_home)"
export M2_HOME="$(brew --prefix maven)"
export TOMCAT_HOME="$(brew --prefix tomcat@7)"

export PATH="$TOMCAT_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$PATH"

. "$BONPRIX_PACKAGE_SOURCES/lib/cli.sh"

alias bp='bonprix'
alias bp.='bp .'
alias bpa='bp admin'
alias bpp='bp pkg'
alias bpp.='bpp .'
alias bppb='bpp build'
alias bppc='bpp clean'
alias bppi='bpp install'
alias bppr='bpp release'
alias bppu='bpp uninstall'
