# Dockerfile for making a custom Code Server for Golang IDE

## Pull Base Image
FROM lscr.io/linuxserver/code-server:latest AS go-code-server

## Update package manager database list, Upgrade all installed packages, and install all dependencies/packages
RUN apt update -y && apt upgrade -y && apt install -y git make golang && \
    go install -v golang.org/x/tools/gopls@latest && \
    go install -v golang.org/x/tools/cmd/goimports@latest

## Set Entry Point

