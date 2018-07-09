FROM ubuntu:17.04

MAINTAINER Derek Ahn "git.derek@gmail.com"

RUN mkdir /opt/mailslurper

COPY ./mailslurper /opt/mailslurper

WORKDIR /opt/mailslurper

ENTRYPOINT ["/opt/mailslurper/mailslurper"]
