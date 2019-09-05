FROM node:12-alpine

#LABEL "name"="echo something"
#LABEL "version"="0.0.1"

LABEL "com.github.actions.name" = "echo Testing"
LABEL "com.github.actions.description" = "action description here"
LABEL "com.github.actions.icon" = "activity"
LABEL "com.github.actions.color" = "red"
# this might only apply when published?

RUN echo dingdingdingdingdingdingdingdingdingdingdingding

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]