FROM node:10-slim

# WORKDIR $GITHUB_WORKSPACE

# RUN mkdir -p /usr/src/danger
# COPY . /usr/src/danger
# RUN cd /usr/src/danger && \
#   yarn && \
#   yarn run build:fast && \
#   chmod +x distribution/commands/danger.js && \
#   ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

# RUN ls

RUN ls

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
# ENTRYPOINT ["danger", "ci"]