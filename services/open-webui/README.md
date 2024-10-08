# Home Lab - Self-hosting Local AI Server - docker-compose - open-webui

## Table of Contents
- [Information](#information)
    + [Introduction](#introduction)
    + [Components](#components)
- Setup
    - [Overview](#setup-overview)
        + [General Operational Workflow](#general-operational-workflow)
    - [WebUI Application for interacting with the Local AI Server](#setup-webui-interface)
        + [Using docker](#using-docker)
        + [Using bare metal](#using-bare-metal)
- [Accessing](#accessing)
    + [Web Application](#web-application)
- [Documentations](#documentations)
    + [Networking](#networking)
    + [Environment Variables](#environment-variables)
    + [Volumes](#volumes)
- [Snippets](#snippets)
- [Wiki](#wiki)
    - [Templates](#templates)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

### Introduction
- Open-WebUI is a generic WebUI (Web interface) for AI models to use as a chatbot
    + This concept is similar to OpenAI using ChatGPT as a web interface to interact with the AI Language Model (Recommended)
- Additionally, open-webui supports the management of open source LLM models within the web application
    + If the webserver is connected to an existing ollama local AI server, it will install the models to the project workspace directory of the ollama server instance

### Components
- CLI utilities
    + ollama : `ollama` is the CLI utility used to manage/handle various open source LLM models (including the llama/mistral variant models) through a single CLI utility. 
- Docker Images
    - Web Interface (WebUI) for LLMs
        + `open-webui/open-webui` : Open-WebUI is a generic WebUI (Web interface) for AI models to use as a chatbot; This concept is similar to OpenAI using ChatGPT as a web interface to interact with the AI Language Model (Recommended)

### Project
+ Author: open-webui
+ Project Name: open-webui
- Repository Server URLs
    + [GitHub - open-webui/open-webui](https://github.com/open-webui/open-webui)
- Docker Image Repository Servers
    + [Dockerhub - open-webui/open-webui](https://hub.docker.com/r/open-webui/open-webui)

## Setup Overview
### General Operational Workflow
1. Setup the core AI Large Language Model (LLM) local server using ollama (for pulling/pushing and serving open source LLM models)
2. Setup an application/Web Interface (WebUI) for interfacing/interacting with the language model
    - Notes
        + Ensure that the WebUI points to the LLM's local server port number

## Setup

### General Pre-Requisites
> System Requirements
    + Ensure that your system has `>= 3.5GB` RAM/memory before proceeding as Ollama (and other LLM (Large Language Models)) require more than or exactly 3.5GB to work efficiently

### Using docker
> Dependencies
+ docker
+ docker-compose : Optional; If you are using docker compose

> Pre-Requisites

- Using docker-compose
    - Prepare the `docker-compose.yaml` configuration file for the WebUI applications ('open-webui'/'ollama-webui')
        - Create the 'docker-compose.yaml' file(s)
             ```bash
             touch docker-compose.yaml
             ```
        - Edit the configuration file and populate it with the docker-compose key-value settings
             + Please refer to 'open-webui/open-webui' in [Templates - docker-images](#templates) for a template configuration to the open-webui docker-compose file

> Starting up and managing the container

- Startup docker container using the docker image
    - Using docker-compose
        ```bash
        docker-compose up -d
        ```
    - Using docker run
        - open-webui
            - Notes and Expanation
                + Pass `--gpus=all` to passthrough and use the host system's GPU in the container
            ```bash
            docker run -itd --name open-webui --restart=unless-stopped --add-host "host.docker.internal:[model-hosting-server-ip-address]" -p 3000:8080 -v "${PWD}/open-webui:/app/backend/data" ghcr.io/open-webui/open-webui:main
            ```

- Start the stopped container
    - Using docker-compose
        ```bash
        docker-compose start [container-name]
        ```
    - Using docker run
        ```bash
        docker container start [container-name]
        ```

- Stop the running container
    - Using docker-compose
        ```bash
        docker-compose stop [container-name]
        ```
    - Using docker run
        ```bash
        docker container stop [container-name]
        ```

- Retart the running container
    - Using docker-compose
        ```bash
        docker-compose restart [container-name]
        ```
    - Using docker run
        ```bash
        docker container restart [container-name]
        ```

- Shutdown the container
    - Using docker-compose
        ```bash
        docker-compose down
        ```
    - Using docker run
        ```bash
        docker stop [container-name] && docker rm [container-name]
        ```

### Using bare metal
> Dependencies
+ open-webui
+ nginx

> Pre-Requisites

## Accessing

### Web Application
- Open your browser
    - In the address bar
        + Type `http://[local-ai-webui-server-ip-address]:3000`

## Documentations

### Networking

> Network Ports

- Ollama
    + 11434 : Port 11434 is the default port exposed/used by Ollama to host the language model server for wrappers to call and reference

- open-webui
    + 8080 : Default port exposed by open-webui for the WebUI interface

### Environment Variables
> ollama
+ `OLLAMA_API_CREDENTIALS=[api-crdentials]` : Explicitly specify the credentials for your Ollama server API
+ `OLLAMA_KEEP_ALIVE=[ttl (time-to-live)]` : Specify the amount of time to keep the model alive; Format: `Nh` (where N = amount of time)

> open-webui
+ `OLLAMA_BASE_URL=[model-hosting-server-ip-address]:[model-hosting-server-port-number]` : Explicitly set the base server URL/hostname and the port number pointing to the Ollama server
+ `ENABLE_SIGNUP=false|true` : Enable/Disable Signup on startup
+ `WEBUI_NAME=name of webui title` : Set the Web application's title/name here
+ `WEBUI_URL=[web-server-ip-address]:[web-server-port-number]` : Explicitly set the server URL/hostname and the port number to the WebUI application server
+ `WEBUI_SECRET_KEY=[secret-key]` : Set the secret key/passphrase/password to the WebUI; NOTE: For security reasons, please do not hardcode this but instead, set this into an environment variable on the host system/terminal and reference it (i.e. docker-compose will be `- WEBUI_SECRET_KEY=${WEBUI_SECRET_KEY}`)

### Volumes

## Snippets

## Wiki

### Templates

> docker images

> docker-compose files
- open-webui/open-webui
    ```yaml
    # Docker compose configuration file for ghcr.io/open-webui/open-webui:main
    version: "3.7"
    services:
      open-webui:
        image: ghcr.io/open-webui/open-webui:main
        container_name: open-webui
        restart: unless-stopped
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/open-webui:/app/backend/data"
    ```

- ollama-webui/ollama-webui
    ```yaml
    # Docker compose configuration file for ghcr.io/ollama-webui/ollama-webui:main
    version: "3.7"
    services:
      ollama-webui:
        image: ghcr.io/ollama-webui/ollama-webui:main
        container_name: ollama-webui
        restart: unless-stopped
        extra_hosts:
          ## Add extra hosts into the docker container
          ## [host-name]:[host-ip-address]
          ## Default: - "host.docker.internal:host-gateway"
          - "host.docker.internal:[model-hosting-server-ip-address]"
        ports:
          ## Port Forward/Translate/Map from host system port to container port
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - "3000:8080"
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/ollama-webui:/app/backend/data"
    ```

## Resources
+ [apeatling - articles - A simple guide to local LLM fine-tuning on a Mac with MLX - Part 1: Setting up your environment](https://apeatling.com/articles/part-1-setting-up-your-environment/)
+ [apeatling - articles - A simple guide to local LLM fine-tuning on a Mac with MLX - Part 2: Building your training data for fine tuning](https://apeatling.com/articles/part-2-building-your-training-data-for-fine-tuning/)
+ [bitdoze - ollama docker install](https://www.bitdoze.com/ollama-docker-install/)
+ [ollama - blog - ollama is now available as an official docker image](https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image)

## References
+ [collabnix - How to run Open Source LLMs locally with ollama and docker](https://collabnix.com/how-to-run-open-source-llms-locally-with-ollama-and-docker-llama3-1-phi3-mistral-gemma2/)
+ [Dockerhub - ollama/ollama](https://hub.docker.com/r/ollama/ollama)
+ [GitHub - ollama/ollama](https://github.com/ollama/ollama)
+ [GitHub - ollama/ollama - Docs - Development and Building from Source](https://github.com/ollama/ollama/blob/main/docs/development.md)
+ [GitHub - ollama/ollama - Docs - HTTP REST API](https://github.com/ollama/ollama/blob/main/docs/api.md)
+ [GitHub - ollama/ollama - Docs - Linux](https://github.com/ollama/ollama/blob/main/docs/linux.md)
+ [GitHub - open-webui/open-webui](https://github.com/open-webui/open-webui)
+ [OpenWebUI Documentations - Getting Started](https://docs.openwebui.com/getting-started/)
+ [Medium - khodeprasad - How to run ollama locally using docker](https://khodeprasad.medium.com/how-to-run-ollama-locally-using-docker-2a5bdd90cc20)
+ [Nvidia Documents - nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation)

## Remarks

### Docker syntax used
- Define a common network group for the docker services within the docker compose environment/stack to follow
    - Definition
        ```yaml
        networks:
            ## Network name here
            your-common-network-group-name:
                ## Network setting key-value configurations here
                external: false
        ```
    - Usage
        ```yaml
        services:
            service-name-1:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name

            service-name-2:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name

            # ...

            service-name-N:
                image: image-name
                container_name: container-name
                restart: unless-stopped
                #  ...
                networks:
                    - your-common-network-group-name
        ```

