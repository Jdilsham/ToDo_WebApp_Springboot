FROM tomcat:10-jdk17

# Force WAR extractiongf
ENV CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.catalina.startup.ContextConfig.jarsToSkip= -Dorg.apache.catalina.startup.TldConfig.jarsToSkip= -Dorg.apache.catalina.startup.Tomcat.addDefaultWebXmlToWebapp=false"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/ToDo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
