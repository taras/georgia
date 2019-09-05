FROM node:12-alpine

#LABEL "name"="echo something"
#LABEL "version"="0.0.1"

LABEL "com.github.actions.name" = "echo Testing"
LABEL "com.github.actions.description" = "action description here"
LABEL "com.github.actions.icon" = "activity"
LABEL "com.github.actions.color" = "red"
# this might only apply when published?

RUN mkdir -p /usr/src/danger
COPY . /usr/src/danger
RUN cd /usr/src/danger && \
  yarn && \
  yarn run build:fast && \
  chmod +x distribution/commands/danger.js && \
  ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

#ENTRYPOINT ["danger", "ci", "--dangerfile", $*]

ENTRYPOINT ["ls"]