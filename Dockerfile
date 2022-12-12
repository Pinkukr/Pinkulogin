FROM ubuntu:20.04

MAINTAINER Pinku

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.84/bin/apache-tomcat-8.5.84.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.84/* /opt/tomcat/.
RUN apt -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY target/*.war /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
