FROM tomcat:10-jdk17

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Insert a working HTTP Connector listening on ALL interfaces
RUN sed -i '/<\/Service>/i \
  <Connector port="8080" protocol="HTTP/1.1" address="0.0.0.0" redirectPort="8443" />' \
  /usr/local/tomcat/conf/server.xml

# Deploy WAR
COPY target/ToDo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
