# Dockerfile for installing code-server using ArchLinux as the base

## Pull base image
FROM archlinux:latest

## Initialize Variables
ARG VERSION=4.93.1
ARG PLATFORM=linux
ARG ARCHITECTURE=amd64
ARG PREFIX=/usr/local
ARG USER=coder
ARG HOST_IP=0.0.0.0
ARG HOST_PORT=8080

## Set Environment Variables
ENV DOCKER_USER=
ENV PASSWORD=password

## Update package repository database, Upgrade all installed packages and Install essential packages/dependencies
RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel git make bash \
    && mkdir -pv $PREFIX/lib $PREFIX/bin \
    && curl -L -O https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-$PLATFORM-$ARCHITECTURE.tar.gz \
    && tar -C $PREFIX/lib -xvzf code-server-$VERSION-$PLATFORM-$ARCHITECTURE.tar.gz \
    && mv $PREFIX/lib/code-server-$VERSION-linux-amd64 $PREFIX/lib/code-server-$VERSION \
    && ln -s $PREFIX/lib/code-server-$VERSION/bin/code-server $PREFIX/bin/code-server

## Setup user directories
RUN useradd -m -g wheel -d /home/${USER} ${USER} && \
    echo -e "${PASSWORD}\n${PASSWORD}" | passwd ${USER} && \
    sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*ALL\)/\1/' /etc/sudoers && \
    echo -e "## Same thing without a password" >> /etc/sudoers && \
    echo -e "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

## Set ports to map/forward
EXPOSE 8080

## Set User to login as on entry
USER ${USER}

## Set the main Entry Point command
ENTRYPOINT [ "code-server", "--auth", "password", "--host", "0.0.0.0" ]
# ENTRYPOINT ["/bin/bash"]

