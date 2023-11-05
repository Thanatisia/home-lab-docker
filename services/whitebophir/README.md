# Whitebophir

## Information
### Project
+ Project Author: lovasoa
+ Project Name: whitebophir
- Repositories:
    + GitHub: https://github.com/lovasoa/whitebophir
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/lovasoa/wbo

### Background
```
WBO is an online collaborative whiteboard that allows many users to draw simultaneously on a large virtual board. 
The board is updated in real time for all connected users, and its state is always persisted. 
It can be used for many different purposes, including 
    - art, 
    - entertainment, 
    - design, 
    - teaching
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM32 : linux/arm/v7
+ ARM64 : linux/arm64

## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git
+ nodejs : for npm, only to build the webapp

### Pre-Requisites

### Clone the repository
```console
git clone https://github.com/lovasoa/whitebophir
```

### Change directory into repository
```console
cd whitebophir
```

### Build from Source
- Install dependencies using npm
    ```console
    npm install --production
    ```

## Documentation
### Manual
- Manual startup
    - Directly on your machine without any isolation from other servicees
        ```console
        PORT=5001 npm start
        ```
    - Listen on a specific host
        + Useful if using behind a reverse proxy
        ```console
        PORT=5001 HOST=127.0.0.1 npm start
        ```

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=wbo -v "/path/to/wbo-boards:/opt/app/server-data" lovasoa/wbo:latest
    ```

- Teardown/Shutdown
    ```console
    docker container stop wbo && docker container rm wbo
    ```

- Start a stopped container
    ```console
    docker container start wbo
    ```

- Stop a running container
    ```console
    docker container stop wbo
    ```

- Restart a running container
    ```console
    docker container restart wbo
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
    docker-compose start wbo
    ```

- Stop a running container
    ```console
    docker-compose stop wbo
    ```

- Restart a running container
    ```console
    docker-compose restart wbo
    ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
- /opt/
    - app/
        - server-data/ : Contains all Whiteboard server application data such as boards

#### Container Volume Mount Points
+ `/path/to/wbo-boards:/opt/app/server-data` : For persistent server application data (i.e. boards)

#### docker-compose configuration
- Sample Template
    ```yaml
version: "3.7"
services:
  wbo:
    image: lovasoa/wbo:latest
    container_name: wbo
    ports:
      ## Port Forward/Translate/Map from Host System to Container
      ## [ip-address]:[host-system-port]:[container-port]
      - "5001:80"
    volumes:
      ## Mount volume from host system into container
      ## [host-system-volume]:[container-volume]:[permission]
      - "${PWD}/wbo-boards:/opt/app/server-data"
    ```

### Networking
#### Ports
+ 5001 : For HTTP WebUI

## Resources

## References
+ [Main Website](https://wbo.ophir.dev/)

## Remarks
