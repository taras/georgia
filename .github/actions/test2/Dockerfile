FROM alpine:latest

LABEL "name"="echo something"
#LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="0.0.1"

LABEL com.github.actions.name="echo Testing"
LABEL com.github.actions.description="action description here"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="red"

RUN echo where does this run

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]