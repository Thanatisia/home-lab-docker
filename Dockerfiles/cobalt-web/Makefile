# Makefile containing targets for starting up multiple variants of the docker service 'linux-server/code-server'

## Variables/Ingredients

### Environment Variables
WEB_DEFAULT_API="http://127.0.0.1:9000"

### Host System Variables

#### Network Variables
HOST_WEBUI_PORT_NUMBER ?= 5173

### Container Variables

#### System Information
BASE_IMAGE_AUTHOR ?= thanatisia
BASE_IMAGE_NAME ?= alpine-cobalt-web
BASE_IMAGE_TAG_VERSION ?= latest
BASE_IMAGE_FULLNAME ?= $(BASE_IMAGE_AUTHOR)/$(BASE_IMAGE_NAME):$(BASE_IMAGE_TAG_VERSION)
CONTAINER_NAME ?= alpine-cobalt-web

#### Parameter Optionals and Flags
DOCKER_RUN_OPTS ?=

#### Network Variables
CONTAINER_WEBUI_PORT_NUMBER ?= 5173

### System Variables
SHELL := /bin/bash

.DEFAULT_RULES := help
.PHONY := help run shutdown

## Rules/Target/Recipe

### Display Help Menu
help:
	@echo -e "[+] help: Display Help Menu"
	@echo -e "[+] build : Build the docker image"
	@echo -e "[+] run : Startup the cobalt WebUI docker image"
	@echo -e "[+] shutdown : Shutdown (Stop and Remove) the cobalt WebUI container"
	@echo -e "[+] compose-up : Startup the Server via docker-compose"
	@echo -e "[+] compose-down : Shutdown the Server via docker-compose"

## Build the docker image
build:
	@docker build -t ${BASE_IMAGE_AUTHOR}/${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION} -f Dockerfiles/alpine.Dockerfile .

## Startup a Cobalt WebUI
run:
	@docker run -itd \
		--name=${CONTAINER_NAME} \
		--restart=unless-stopped \
		${DOCKER_RUN_OPTS} \
		-e WEB_DEFAULT_API=${WEB_DEFAULT_API} \
		-p ${HOST_WEBUI_PORT_NUMBER}:${CONTAINER_WEBUI_PORT_NUMBER} \
		${BASE_IMAGE_AUTHOR}/${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG_VERSION}

## Shutdown (Stop and Remove) the Server
shutdown:
	@docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}

## Docker Compose

### Startup the Server via docker-compose
compose-up:
	@docker-compose -p alpine-cobalt-web -f docker-compose/alpine.docker-compose.yaml up -d --build

### Shutdown the Server via docker-compose
compose-down:
	@docker-compose -p alpine-cobalt-web -f docker-compose/alpine.docker-compose.yaml down


