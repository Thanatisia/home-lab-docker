# Dockerfile
# to 
# setup etherwake and send Wake on LAN magic packets
# on Base Image: Debian

## Pull latest base image
FROM debian:latest

## Set working directory
WORKDIR /wol

## Update repositories
RUN apt update -yqq && \
    apt upgrade -yqq && \
    ## Install dependencies \
    apt install -yqq etherwake ethtool

## Set Entry Point
ENTRYPOINT ["/bin/bash"]

## Set default command
# CMD ["etherwake"]


