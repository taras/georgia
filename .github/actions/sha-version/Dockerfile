FROM node:12-alpine

LABEL "com.github.actions.name" = "echo Testing"
LABEL "com.github.actions.description" = "action description here"
LABEL "com.github.actions.icon" = "activity"
LABEL "com.github.actions.color" = "red"

RUN apk add --no-cache git bash git-subtree

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]