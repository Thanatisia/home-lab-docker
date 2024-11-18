# Makefile containing targets for starting up the base docker service 'linux-server/code-server'

## Variables/Ingredients

### Environment Variables
UID = 1000
GID = 1000
PASSWORD ?= ""
HASHED_PASSWORD ?= ""
SUDO_PASSWORD ?= ""
SUDO_PASSWORD_HASH ?= ""
PROXY_DOMAIN ?= code-server.my.domain
DEFAULT_WORKSPACE ?= /config/workspace
TZ ?= Etc/UTC

### Host System Variables

#### Network Variables
HOST_WEBUI_PORT_NUMBER ?= 8444

### Docker Compose Environment
COMPOSE_PROJECT_NAME ?= code-server
COMPOSE_FILE ?= docker-compose.yaml

### Container Variables

#### System Information
BASE_IMAGE_DOMAIN ?= lscr.io
BASE_IMAGE_AUTHOR ?= linuxserver
BASE_IMAGE_NAME ?= code-server
BASE_IMAGE_TAG_VERSION ?= latest
BASE_IMAGE_FULLNAME ?= $(BASE_IMAGE_AUTHOR)/$(BASE_IMAGE_NAME):$(BASE_IMAGE_TAG_VERSION)
CONTAINER_NAME ?= code-server

#### Parameter Optionals and Flags
DOCKER_RUN_OPTS ?=
DOCKER_STOP_OPTS ?=
DOCKER_RM_OPTS ?=
DOCKER_COMPOSE_OPTS ?=

#### Network Variables
CONTAINER_WEBUI_PORT_NUMBER ?= 8443

### System Variables
SHELL := /bin/bash

.DEFAULT_RULES := help
.PHONY := help run shutdown

## Rules/Target/Recipe

### Display Help Menu
help:
	@echo -e "[+] help: Display Help Menu"
	@echo -e "[+] run : Startup a docker container"
	@echo -e "[+] Shutdown : Stop and remove the docker container"
	@echo -e "[+] compose-up : Shutdown the Server via docker-compose"
	@echo -e "[+] compose-down : Startup the Server via docker-compose"

## Startup the Cloud IDE Server
run:
	@echo -e docker run -itd \
		--name=${CONTAINER_NAME} \
		--restart=unless-stopped \
		${DOCKER_RUN_OPTS} \
		-e "PUID=${UID}" \
		-e PGID="${GID}" \
		-e TZ=${TZ} \
		-e PASSWORD=${PASSWORD} \
		-e HASHED_PASSWORD=${HASHED_PASSWORD} \
		-e SUDO_PASSWORD=${SUDO_PASSWORD} \
		-e SUDO_PASSWORD_HASH=${SUDO_PASSWORD_HASH} \
		-e PROXY_DOMAIN=${PROXY_DOMAIN} \
		-e DEFAULT_WORKSPACE=${DEFAULT_WORKSPACE} \
		-p ${HOST_WEBUI_PORT_NUMBER}:${CONTAINER_WEBUI_PORT_NUMBER} \
		-v "${PWD}/code-server/config:/config" \
		-v "${PWD}/code-server/workspace:/config/workspace" \
		${BASE_IMAGE_FULLNAME}

## Stop a running container
stop:
	@docker stop ${DOCKER_STOP_OPTS} ${CONTAINER_NAME}

rm:
	@docker rm ${DOCKER_RM_OPTS} ${CONTAINER_NAME}

## Shutdown (Stop and Remove) the Server
shutdown:
	@docker stop ${DOCKER_STOP_OPTS} ${CONTAINER_NAME} && docker rm ${DOCKER_RM_OPTS} ${CONTAINER_NAME}

## Docker Compose

### Shutdown the Server via docker-compose
compose-down:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${COMPOSE_FILE} down ${DOCKER_COMPOSE_OPTS}

### Startup the Server via docker-compose
compose-up:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${COMPOSE_FILE} up -d ${DOCKER_COMPOSE_OPTS}


