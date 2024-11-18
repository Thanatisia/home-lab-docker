# Home Lab - Remote/Cloud-based IDE - VS Code

## Information
### Description
+ code-server is a Remote/Cloud Based IDE Web Application that allows you to startup a VS Code server and run VS Code on any machine anywhere and access it from the browser.

### Project
+ Author: coder
+ Repository Name: code-server
- Repositories
    + GitHub: https://github.com/coder/code-server
- Docker Image
    + DockerHub: https://hub.docker.com/r/frooodle/s-pdf

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Create the volume mount points
    ```bash
    mkdir -pv code-server/{dotfiles,config,workspace}
    mkdir -pv scripts
    ```

### Customization

- docker-compose.yaml
    + Obtain a copy of the docker-compose file from [Templates](#templates)

### Startup Image and container

> Using docker run CLI

- Startup container
    ```bash
    docker run -itd \
        --name "code-server" \
        --restart=unless-stopped \
        --user="coder" \
        -e PUID=${UID:-1000} \
        -e PGID=${GID:-1000} \
        -e DOCKER_USER=$USER \
        -e TZ=Etc/UTC \
        -p 8080:8080 \
        -v "${PWD}/code-server/dotfiles:/home/coder/.local" \
        -v "${PWD}/code-server/config:/home/coder/.config" \
        -v "${PWD}/code-server/workspace:/home/coder/project" \
        -v "${PWD}/scripts/:/home/coder/scripts/" \
        codercom/code-server:latest
    ```

- Stop and remove container
    ```bash
    docker stop code-server && docker rm code-server
    ```

> Using docker-compose

- Startup docker-compose environment
    ```bash
    docker-compose {-f <custom-docker-filename>} up -d
    ```

- Teardown docker-compose environment
    ```bash
    docker-compose {-f <custom-docker-filename>} down
    ```

### Manage docker service

- Start a stopped docker container
    ```bash
    docker container start [container-name]
    ```

- Stop a running docker container
    ```bash
    docker container stop [container-name]
    ```

- Restart a running docker container
    ```bash
    docker container restart [container-name]
    ```

### QuickStart 
- Access the service WebUI from web browser
    - Open Web Browser
        - In the address bar, enter `[protocol]://[server-ip-address|domain]:[server-port-number]`
            + Press enter

## Documentations

### Container

### Environment Variables
- `DOCKER_USER=$USER` : Set the user in the docker container as the current host system user

### Network Ports
- 8080 : HTTP WebUI Port

#### Volumes
- /home/coder/
    - .local/ : Mount the entire code server directory in the dotfiles directory
    - .config/ : Mount the code-server configurations directory
    - project/ : Mount your default workspace directory (Default: /home/coder/project)
    - scripts/ : Mount the setup script for easy access

### Templates

> docker-compose.yaml

- codercom
    ```yaml
    version: "3.7"
    services:
      code-server:
        image: codercom/code-server:latest
        container_name: code-server
        restart: unless-stopped
        user: coder
        environment:
          ## Map Environment Variables into the container
          - PUID=${UID:-1000}
          - PGID=${GID:-1000}
          - DOCKER_USER=$USER # Set the user in the docker container as the current host system user
          - TZ=Etc/UTC
        ports:
          ## Port Forward/Translate/Map ports from the host system to the container
          ## [host-system-ip-address]:[host-system-port]:[container-port]
          - 8080:8080 # Port Number for WebUI and HTTP
        volumes:
          ## Mount volumes from the host system to the container
          ## [host-system-volume]:[container-volume]:[permission]
          - "${PWD}/code-server/dotfiles:/home/coder/.local" # Mount the entire code server directory in the dotfiles directory
          - "${PWD}/code-server/config:/home/coder/.config" # Mount the code-server configurations directory
          - "${PWD}/code-server/workspace:/home/coder/project" # Mount your default workspace directory (Default: /home/coder/project)
          - "${PWD}/scripts/:/home/coder/scripts/" # Mount the setup script for easy access
    ```

## Wiki

## Resources

## References
+ [GitHub - coder/code-server](https://github.com/coder/code-server)

## Remarks

