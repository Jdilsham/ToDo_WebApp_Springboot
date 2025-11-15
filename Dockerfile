ARG WAR_FILE=ToDo-0.0.1-SNAPSHOT.war

FROM tomcat:10-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
