FROM node:8.9.0-alpine

RUN apk update
RUN apk add --no-cache \
    openssh \
    git

RUN npm install -g lerna

COPY .ssh /home/node/.ssh
COPY .gitconfig /home/node
COPY .netrc /home/node
COPY .npmrc /home/node

RUN chown node /home/node/.netrc && \
    chown node /home/node/.gitconfig && \
    chown node /home/node/.npmrc && \
    chown -R node /home/node/.ssh

USER node