FROM ubuntu:xenial

MAINTAINER Eugene Hrabovskiy

WORKDIR /opt/Confluence/confluence

RUN apt-get update && \
    apt install -y openjdk-9-jre-headless && \ 
    apt install -y wget && \
    wget -P /tmp/ https://github.com/texastribune/docker-confluence/blob/master/response.varfile && \
    wget -P /tmp/ https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.5.2-x64.bin && \
    chmod a+x /tmp/atlassian-confluence-6.5.2-x64.bin && \
    sh -c "/tmp/atlassian-confluence-6.5.2-x64.bin -q -varfile /tmp/response.varfile" && \
    apt-get update


RUN wget -P /tmp/ https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz && \
	cp /tmp/mysql-connector-java-5.1.45.tar.gz /opt/Confluence/confluence/WEB-INF/lib


USER confluence

VOLUME ["/var/atlassian/application-data/confluence"]

EXPOSE 8000 8090

ENTRYPOINT ["/opt/Confluence/bin/start-confluence.sh", "-fg"]
