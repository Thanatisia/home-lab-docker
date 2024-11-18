# Dockerfile for building a docker image to imputnet/cobalt's WebUI

## Information
### Summary
+ This repository contains Dockerfiles and instructions to manually build a docker image to self-host imputnet/cobalt's WebUI application

### Project
+ Author: imputnet (wuzzy)
+ Repository Name: cobalt
- Repositories
    + GitHub: https://github.com/imputnet/cobalt

### Dockerfiles
+ [alpine.Dockerfile](alpine.Dockerfile) : Image built using the Alpine base image

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
+ Startup the cobalt API server

## Docker Management

### Build docker image
- Using docker CLI
    ```bash
    docker build --tag=[author-name]/alpine-cobalt-web:latest -f Dockerfiles/alpine.Dockerfile .
    ```

### Startup the docker image
- Using docker run
    ```bash
    docker run -itd \
        --name="alpine-cobalt-web" \
        --restart=unless-stopped \
        -e WEB_DEFAULT_API="http://[cobalt-api-server-IP-address|domain]:[cobalt-api-server-port-number]" \
        --restart=unless-stopped \
        -p 5173:5173 \
        [author-name]/cobalt-web:latest
    ```

### Shutdown docker image
- Using docker CLI
    ```bash
    docker stop alpine-cobalt-web && docker rm alpine-cobalt-web
    ```

## Documentations

## Wiki

## Resources

## References

## Remarks

