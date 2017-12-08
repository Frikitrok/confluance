FROM ubuntu:xenial

MAINTAINER Eugene Hrabovskiy

WORKDIR /opt/atlassian/confluence

COPY atlassian-confluence-6.5.2-x64.bin /tmp


RUN apt-get update && \
    apt install -y openjdk-9-jre-headless && \ 
    wget -P /tmp/ https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.5.2-x64.bin && \
    sh -c "/tmp/atlassian-confluence-6.5.2-x64.bin -q -varfile /tmp/response.varfile"

USER confluence

VOLUME ["/var/atlassian/application-data/confluence"]

EXPOSE 8000 8090

ENTRYPOINT ["/opt/atlassian/confluence/bin/start-confluence.sh", "-fg"]
