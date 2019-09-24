FROM node:10-slim

#WORKDIR ${GITHUB_WORKSPACE}
RUN ls
RUN cd usr
RUN ls
RUN cd src
RUN ls

# RUN mkdir -p /usr/src/danger
# COPY . /usr/src/danger
# RUN cd /usr/src/danger && \
#   yarn && \
#   yarn run build:fast && \
#   chmod +x distribution/commands/danger.js && \
#   ln -s $(pwd)/distribution/commands/danger.js /usr/bin/danger

# # COPY entrypoint.sh /entrypoint.sh
# # ENTRYPOINT ["sh", "/entrypoint.sh"]
# ENTRYPOINT ["danger", "ci"]