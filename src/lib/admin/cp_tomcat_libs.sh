cp_tomcat_libs () {
  command cp -a "$BONPRIX/webapp/lib_internal/." "$TOMCAT_HOME/lib"
}
