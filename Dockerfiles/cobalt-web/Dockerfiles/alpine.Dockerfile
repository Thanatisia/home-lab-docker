# Dockerfile recipe for building cobalt-web

## Pull base image
FROM alpine:latest

## Initialize Variables/Arguments
ARG GIT_CLONE_OPTS=""
ARG REPO_AUTHOR="imputnet"
ARG REPO_NAME="cobalt"
ARG REPO_URL="https://github.com/${REPO_AUTHOR}/${REPO_NAME}"

## Update package manager and install dependencies
RUN apk update && apk upgrade && \
    apk add npm git && \
    cd / && \
    git clone ${GIT_CLONE_OPTS} ${REPO_URL} && \
    cd ${REPO_NAME} && \
    npm install --global pnpm svelte vite@latest && \
    cd web && \
    pnpm install

## Set Environment Variables
ENV WEB_HOST="cobalt.tools"
# ENV WEB_PLAUSIBLE_HOST="plausible.io"
ENV WEB_DEFAULT_API="https://api.cobalt.tools"

## Set Working Directory
WORKDIR /${REPO_NAME}/web

## Set Entry Point
ENTRYPOINT [ "pnpm", "run", "dev", "--host" ]

