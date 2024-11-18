# Makefile containing targets for starting up multiple variants of the docker service 'linux-server/code-server'

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
HOST_WEBUI_PORT_NUMBER ?= 8443

### Container Variables

#### System Information
BASE_IMAGE_AUTHOR ?= thanatisia
BASE_IMAGE_NAME ?= code-server
BASE_IMAGE_TAG_VERSION ?= latest
BASE_IMAGE_FULLNAME ?= $(BASE_IMAGE_AUTHOR)/$(BASE_IMAGE_NAME):$(BASE_IMAGE_TAG_VERSION)
CONTAINER_NAME ?= code-server

#### Parameter Optionals and Flags
DOCKER_RUN_OPTS ?=

#### Network Variables
CONTAINER_WEBUI_PORT_NUMBER ?= 8443

### System Variables
SHELL := /bin/bash

.DEFAULT_RULES := help
.PHONY := help python-run python-shutdown golang-run golang-shutdown

## Rules/Target/Recipe

### Display Help Menu
help:
	@echo -e "[+] help: Display Help Menu"
	@echo -e "[+] python-run : Startup a Python Development Environment VS Code Server"
	@echo -e "[+] python-shutdown : Shutdown (Stop and Remove) the Server for Python"
	@echo -e "[+] golang-run : Startup a Golang Development Environment VS Code Server"
	@echo -e "[+] golang-shutdown : Shutdown (Stop and Remove) the Server for Golang"
	@echo -e "[+] compose-python-up : Startup the Server for Python via docker-compose"
	@echo -e "[+] compose-python-down : Shutdown the Server for Python via docker-compose"
	@echo -e "[+] compose-golang-up : Startup the Server for Golang via docker-compose"
	@echo -e "[+] compose-golang-down : Shutdown the Server for Golang via docker-compose"

## Startup a Python Development Environment Server
python-run:
	@echo -e docker build -t ${BASE_IMAGE_AUTHOR}/python-${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION} -f Dockerfiles/python.Dockerfile .
	@echo -e docker run -itd \
		--name=python-${CONTAINER_NAME} \
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
		-v "${PWD}/code-server/python/config:/config" \
		-v "${PWD}/code-server/python/workspace:/config/workspace" \
		${BASE_IMAGE_AUTHOR}/python-${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION}

## Shutdown (Stop and Remove) the Server for Python
python-shutdown:
	@docker stop python-${CONTAINER_NAME} && docker rm python-${CONTAINER_NAME}

## Startup a Golang Development Environment Server
golang-run:
	@echo -e docker build -t ${BASE_IMAGE_AUTHOR}/go-${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION} -f Dockerfiles/go.Dockerfile .
	@echo -e docker run -itd \
		--name=go-${CONTAINER_NAME} \
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
		-v "${PWD}/code-server/go/config:/config" \
		-v "${PWD}/code-server/go/workspace:/config/workspace" \
		${BASE_IMAGE_AUTHOR}/go-${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION}


## Shutdown (Stop and Remove) the Server for Golang
golang-shutdown:
	@docker stop go-${CONTAINER_NAME} && docker rm go-${CONTAINER_NAME}

## Docker Compose

### Shutdown the Server for Python via docker-compose
compose-python-down:
	@docker-compose -p python-code-server -f docker-compose/python.docker-compose.yaml down

### Startup the Server for Python via docker-compose
compose-python-up:
	@docker-compose -p python-code-server -f docker-compose/python.docker-compose.yaml up -d --build

### Shutdown the Server for Golang via docker-compose
compose-golang-down:
	@docker-compose -p go-code-server -f docker-compose/go.docker-compose.yaml down

### Startup the Server for Golang via docker-compose
compose-golang-up:
	@docker-compose -p go-code-server -f docker-compose/go.docker-compose.yaml up -d --build

