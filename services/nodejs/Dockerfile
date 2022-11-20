# Custom NodeJS Dockerfile build image
# to install essential dependencies off the get-go

## Pull Base Image
FROM node:current

## Mount Volume
VOLUME /nodejs

## Export Ports
# EXPOSE 8080

## Set Working Directory
WORKDIR "/srv"

## Update npm
RUN "npm install -g npm"

## Install essential dependencies
RUN "npm install express --save"



