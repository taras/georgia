FROM node:10-slim

# RUN mkdir -p /usr/src/danger
# COPY dangerfile.js /usr/src/danger
# COPY entrypoint.sh /usr/src/danger
# RUN cd /usr/src/danger && ls
# VOLUME /usr/src/danger

COPY dangerfile.js /home/runner/work/georgia/georgia
COPY entrypoint.sh /entrypoint.sh
RUN cd /home/runner/work/georgia/georgia && ls

# RUN mkdir -p /usr/src/danger
# COPY . /usr/src/danger
# RUN cd /usr/src/danger && \
#   yarn && \
#   yarn run build:fast && \
#   chmod +x distribution/commands/danger.js && \
#   ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

ENTRYPOINT ["sh", "/entrypoint.sh"]
# ENTRYPOINT ["danger", "ci"]

## from source
# FROM node:10-slim

# RUN mkdir -p /usr/src/danger
# COPY . /usr/src/danger
# RUN cd /usr/src/danger && \
#   yarn && \
#   yarn run build:fast && \
#   chmod +x distribution/commands/danger.js && \
#   ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

# ENTRYPOINT ["danger", "ci"]