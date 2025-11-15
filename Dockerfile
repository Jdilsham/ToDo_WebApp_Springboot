FROM tomcat:10-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

RUN sed -i 's/<\/Service>/\
  <Connector port="8080" protocol="HTTP\\/1.1" address="0.0.0.0" redirectPort="8443" />\
<\/Service>/' /usr/local/tomcat/conf/server.xml

COPY target/ToDo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
