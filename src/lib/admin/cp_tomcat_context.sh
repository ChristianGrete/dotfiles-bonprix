cp_tomcat_context () {
  command mv "$TOMCAT_HOME/conf/context.xml" \
    "$TOMCAT_HOME/conf/context_backup.$(date '+%Y-%m-%d@%H-%M-%S').xml"

  command cp "$BONPRIX/webapp/tomcat/conf/context_prixc.xml" \
    "$TOMCAT_HOME/conf/context.xml"
}
