# Home Assistant

## Information
### Project
- Project Authors
    + Home Assistant
+ Project Name: Home Assistant
- Repositories:
    - GitHub: 
        + Main: https://github.com/home-assistant
        + Docker: https://github.com/home-assistant/docker
    - Container Repositories
        - Dockerhub
            + Home Assistant (User): https://hub.docker.com/u/homeassistant
            + Home Assistant: https://hub.docker.com/r/homeassistant/home-assistant

### Background
```
Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts.
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM64 : linux/arm64v8

### Docker Design


## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git

### Pre-Requisites


### Clone the repository
```console
git clone https://github.com/home-assistant/docker
```

### Change directory into repository
```console
cd docker
```

### Build from Source
- Docker
    - Default
        ```console
        docker build -f Dockerfile .
        ```

## Documentation

### Start
#### Using docker run
- Starting up home assistant
    - Using Official
        ```console
        docker run -d \
          --name homeassistant \
          --privileged \
          --restart=unless-stopped \
          -e TZ=MY_TIME_ZONE \
          -v /PATH_TO_YOUR_CONFIG:/config \
          --network=host \
          ghcr.io/home-assistant/home-assistant:stable
        ```

- Teardown/Shutdown
    ```console
    docker container stop homeassistant && docker container rm homeassistant
    ```

- Start a stopped container
    ```console
    docker container start homeassistant
    ```

- Stop a running container
    ```console
    docker container stop homeassistant
    ```

- Restart a running container
    ```console
    docker container restart homeassistant
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
    docker-compose start homeassistant
    ```

- Stop a running container
    ```console
    docker-compose stop homeassistant
    ```

- Restart a running container
    ```console
    docker-compose restart homeassistant
    ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
+ /config : Configurations

#### Container Volume Mount Points
- "${PWD}/home-assistant/config:/config"

#### docker-compose configuration
- linuxserver
    ```yaml
    version: "3.7"
    services:
      home-assistant:
        image: ghcr.io/home-assistant/home-assistant:stable
        container_name: home-assistant
        restart: unless-stopped
        network_mode: host
        # environment:
          ## Environment Variables
          # - TZ=UTC/Etc
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - "${PWD}/home-assistant/config:/config"
    ```

### Networking
#### Ports
+ 8123 : The WebUI

## Resources

## References
+ [Home Assistant Documentations - Getting Started](https://www.home-assistant.io/getting-started/)
+ [Home Assistant Documentations - Installation](https://www.home-assistant.io/installation/)

## Remarks
