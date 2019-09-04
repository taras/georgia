FROM alpine:latest

LABEL "name"="testing something"
#LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Testing"
LABEL "com.github.actions.description"="action description here"
LABEL "com.github.actions.icon"="star"
LABEL "com.github.actions.color"="pink"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]