# Watchtower

## Information
### Project
+ Project Author: containrrr
+ Project Name: watchtower
- Repositories:
    + GitHub: https://github.com/containrrr/watchtower
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/containrrr/watchtower

### Background
```
Open Source automated docker container base image updater
```

### Supported Architectures
+ x86   : linux/386
+ x86-64: linux/amd64
+ armhf
+ ARM32 : linux/arm/v7
+ ARM64 : linux/arm64

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites

### Clone the repository
```console
git clone https://github.com/containrrr/watchtower
```

### Change directory into repository
```console
cd watchtower
```

### Build image from Dockerfile
- Change directory into 'watchtower/dockerfiles'
    ```console
    cd dockerfiles
    ```

- Build image using `docker {buildx} build`
    ```console
    docker buildx build --tag=containrrr/watchtower -f ./Dockerfile
    ```

## Documentation
### Manual

### Start
#### Using docker run
- Starting up
    - Volumes
        + Mount the docker socket from host system into container docker socket to create a synchronous link between host and container => /var/run/docker.sock:/var/run/docker.sock 
    ```console
    docker run -itd --name=watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower:[version]
    ```

- Teardown/Shutdown
    ```console
    docker container stop watchtower && docker container rm watchtower
    ```

- Start a stopped container
    ```console
    docker container start watchtower
    ```

- Stop a running container
    ```console
    docker container stop watchtower
    ```

- Restart a running container
    ```console
    docker container restart watchtower
    ```

#### Using docker-compose
- Starting up
    ```console
    docker-compose up -d
    ```

- Teardown/Shutdown
    ```console
    docker-compose down
    ```

- Start a stopped container
    ```console
    docker-compose start watchtower
    ```

- Stop a running container
    ```console
    docker-compose stop watchtower
    ```

- Restart a running container
    ```console
    docker-compose restart watchtower
    ```

### Parameters
- Positionals
    - containers-to-watch : Explicitly specify all containers to watch; If specified - watchtower will only watch and update the specified container's base images
        + Please separate all containers with a space (' ') delimiter
- Optionals
    - With Arguments
    - Flags
        + --debug : Enable debug

### Arguments
- To parse arguments/parameters into watchtower
    - `docker run`
        + specify all commands, parameters, arguments behind the image name to startup
        ```console
        docker run -itd --name=watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower [containers-to-watch] {options}
        ```
    - docker-compose configuration file
        + add to the key 'command:' in the docker-compose configuration file
        ```yaml
        version: "3.7"
        services:
            watchtower:
                image: containrrr/watchtower
                container_name: watchtower
                ...
                command: [parse-argument-here]
        ```

### Usage
- On Startup
    - Wait for the timeout and watchtower will, 
        - by default
            + Pull the latest base image of all containers
            + Restart the container as per starting specifications 

## Wiki
### Customization/Configuration
#### Project Filesystem Structure

#### Container Volume Mount Points
+ `/var/run/docker.sock:/var/run/docker.sock` : Mount the host docker socket file to the container docker socket file to establish synchronous connection between host and container

#### docker-compose configuration
- Sample Template
    ```yaml
version: "3.7"
services:
  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    restart: unless-stopped
    ports:
      ## Port Forward/Translate/Map from Host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - "8080:8080"
    volumes:
      ## Mount volume from host system into container 
      ## [host-system-volume]:[container-volume]:[permissions]
      - /var/run/docker.sock:/var/run/docker.sock # Mount the host docker socket file to the container docker socket file to establish synchronous connection between host and container
    ```

### Networking
#### Ports
+ 80 : For HTTP WebUI
+ 443 : For HTTPS WebUI

## Resources

## References
+ [Containrrr Github Pages](https://containrrr.github.io/watchtower)
+ [Watchtower Documentation](https://containrrr.dev/watchtower/)
+ [Virtualization Howto - 2023/02 - Watchtower docker-compose - Auto update docker containers](https://www.virtualizationhowto.com/2023/02/watchtower-docker-compose-auto-update-docker-containers/)

## Remarks
