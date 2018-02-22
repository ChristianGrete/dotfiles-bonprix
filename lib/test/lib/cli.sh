describe 'bonprix'
  it 'changes the directory to `$BONPRIX`'
    $(bonprix && [ "$(pwd)" = "$BONPRIX" ]) && succeed || fail
  it 'prints its own usage text when executed with `-?`'
    [ "$(bonprix -? 2>/dev/null)" != '' ] && succeed || fail
  it 'prints its own usage text when executed with `-h`'
    [ "$(bonprix -h 2>/dev/null)" != '' ] && succeed || fail
  it 'prints its own usage text when executed with `--help`'
    [ "$(bonprix --help 2>/dev/null)" != '' ] && succeed || fail
  it 'implements and prints `$BONPRIX_PACKAGE_VERSION` when executed with `-v`'
    [ "$(bonprix -v)" = "$BONPRIX_PACKAGE_VERSION" ] && succeed || fail
  it 'also prints `$BONPRIX_PACKAGE_VERSION` when executed with `--version`'
    [ "$(bonprix --version)" = "$BONPRIX_PACKAGE_VERSION" ] && succeed || fail

describe 'bonprix <command>'
  it 'executes only existing commands'
    bonprix wtf 2>/dev/null
    [ $? -ne 0 ] && succeed || fail
