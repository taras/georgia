#FROM node:12
FROM debian:stable-slim

#LABEL "name"="echo something"
#LABEL "version"="0.0.1"

LABEL "com.github.actions.name" = "echo Testing"
LABEL "com.github.actions.description" = "action description here"
LABEL "com.github.actions.icon" = "activity"
LABEL "com.github.actions.color" = "red"
# this might only apply when published?

RUN apk update && apk add --no-cache git bash git-subtree
RUN apt-get install wget sudo -y
# RUN apt-get install sudo

# RUN adduser --disabled-password --gecos '' docker
# RUN adduser docker sudo
# RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# USER docker

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]