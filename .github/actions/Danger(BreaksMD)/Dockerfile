FROM node:12-alpine

#LABEL "name"="echo something"
#LABEL "version"="0.0.1"

LABEL "com.github.actions.name" = "echo Testing"
LABEL "com.github.actions.description" = "action description here"
LABEL "com.github.actions.icon" = "activity"
LABEL "com.github.actions.color" = "red"
# this might only apply when published?

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]


## below is from official and modified
# FROM node:10-slim

# LABEL "com.github.actions.name"="Danger JS Action"
# LABEL "com.github.actions.description"="Runs JavaScript/TypeScript Dangerfiles"
# LABEL "com.github.actions.icon"="zap"
# LABEL "com.github.actions.color"="blue"

# RUN mkdir -p /usr/src/danger
# COPY . /usr/src/danger
# RUN cd /usr/src/danger && \
#   yarn && \
#   yarn run build:fast && \
#   chmod +x distribution/commands/danger.js && \
#   ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

# WORKDIR $GITHUB_REPO

# ENTRYPOINT danger ci $TEST