# Dockerfile for making a custom Code Server for Python IDE

## Pull Base Image
FROM lscr.io/linuxserver/code-server:latest AS python-code-server

## Update package manager database list, Upgrade all installed packages, and install all dependencies/packages
RUN apt update -y && apt upgrade -y && apt install -y nodejs npm git make python3 python3-pip && npm install -g pyright

## Set Entry Point

