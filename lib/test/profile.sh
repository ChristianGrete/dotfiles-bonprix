describe '$BONPRIX'
  it 'is defined'
    [ -z ${BONPRIX:+BONPRIX} ] && fail || succeed
  it 'defines an existing directory'
    [ -d "$BONPRIX" ] && succeed || fail
  it 'defines a readable directory'
    [ -r "$BONPRIX" ] && succeed || fail

describe '$BONPRIX_PACKAGE'
  it 'is defined'
    [ -z ${BONPRIX_PACKAGE:+BONPRIX_PACKAGE} ] && fail || succeed
  it 'defines an existing directory'
    [ -d "$BONPRIX_PACKAGE" ] && succeed || fail
  it 'defines a readable directory'
    [ -r "$BONPRIX_PACKAGE" ] && succeed || fail
  it 'defines a writable directory'
    [ -w "$BONPRIX_PACKAGE" ] && succeed || fail

describe '$BONPRIX_PACKAGE_SOURCES'
  it 'is defined'
    [ -z ${BONPRIX_PACKAGE_SOURCES:+BONPRIX_PACKAGE_SOURCES} ]
    [ $? -eq 0 ] && fail || succeed
  it 'defines an existing directory'
    [ -d "$BONPRIX_PACKAGE_SOURCES" ] && succeed || fail
  it 'defines a readable directory'
    [ -r "$BONPRIX_PACKAGE_SOURCES" ] && succeed || fail

describe '$BONPRIX_PACKAGE_VERSION'
  it 'is defined'
    [ -z ${BONPRIX_PACKAGE_VERSION:+BONPRIX_PACKAGE_VERSION} ]
    [ $? -eq 0 ] && fail || succeed
  it 'is not empty'
    [ -z "$BONPRIX_PACKAGE_VERSION" ] && fail || succeed

describe '$BONPRIX_PACKAGE_SOURCES/lib/cli.sh'
  it 'is included'
    [ "$(bonprix -v 2>&1)" = "$BONPRIX_PACKAGE_VERSION" ]
    [ $? -eq 0 ] && succeed || fail

describe 'alias bp'
  it 'is defined'
    alias bp >/dev/null 2>&1 && succeed || fail

describe 'alias bp.'
  it 'is defined'
    alias 'bp.' >/dev/null 2>&1 && succeed || fail

describe 'alias bpp'
  it 'is defined'
    alias bpp >/dev/null 2>&1 && succeed || fail

describe 'alias bpp.'
  it 'is defined'
    alias 'bpp.' >/dev/null 2>&1 && succeed || fail

describe 'alias bppb'
  it 'is defined'
    alias bppb >/dev/null 2>&1 && succeed || fail

describe 'alias bppc'
  it 'is defined'
    alias bppc >/dev/null 2>&1 && succeed || fail

describe 'alias bppi'
  it 'is defined'
    alias bppi >/dev/null 2>&1 && succeed || fail

describe 'alias bppr'
  it 'is defined'
    alias bppr >/dev/null 2>&1 && succeed || fail

describe 'alias bppu'
  it 'is defined'
    alias bppu >/dev/null 2>&1 && succeed || fail