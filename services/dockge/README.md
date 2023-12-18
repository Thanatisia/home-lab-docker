# dockge by louislam

## Information
### Summary
```
A fancy, easy-to-use and reactive self-hosted docker compose WebUI, stack-oriented, application/service manager made by the creator of Uptime Kuma
```

### Project
+ Author: louislam
+ Application Name: Dockge
- Repositories
    + GitHub: https://github.com/louislam/dockge
    + Marketing Site: https://dockge.kuma.pet/

## Setup
### Dependencies
+ docker
+ docker-compose
### Pre-Requisites

### Accessing
- To access the dockge WebUI
    + Open `http://[webserver-ip-address]:5001`

## Documentations
### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=dockge \
        -e "DOCKGE_STACKS_DIR=/opt/stacks" \
        -p "5001:5001" \
        -v "${PWD}/dockge/app/data:/app/data" \
        -v "/var/run/docker.sock:/var/run/docker.sock" \
        -v "/opt/stacks:/opt/stacks" \
        louislam/dockge:1
    ```

- Teardown/Shutdown
    ```console
    docker container stop dockge && docker container rm dockge
    ```

- Start a stopped container
    ```console
    docker container start dockge
    ```

- Stop a running container
    ```console
    docker container stop dockge
    ```

- Restart a running container
    ```console
    docker container restart dockge
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
    docker-compose start dockge
    ```

- Stop a running container
    ```console
    docker-compose stop dockge
    ```

- Restart a running container
    ```console
    docker-compose restart dockge
    ```

### Environment Variables
- DOCKGE_STACKS_DIR : Specify the primary stacks directory located in the container; This directory in the host system will be mapped into the container's '/opt/stacks' folder by default

### Networking
#### Port Forwarding/Translation/Mapping
+ 5001 : HTTP WebUI

### Container directories
- /opt/stacks : Default stacks directory; All your docker containers are created/placed here
- /app/data   : Contains the application data and configuration files
- /var/run/docker.sock : Host system docker socket that contains the current state of the docker instances in the host system; Mount into container so the container knows as well

### Project file structure
```
[DOCKER_STACKS_DIR]
    - [service-name]/
        - compose.yaml
```

### Docker mappings
#### Default Volumes
- "/path/to/your/stacks/root/directory:/opt/stacks" : Mount your docker container/stack root directory from the host system into the container directory '/opt/stacks'
- "${PWD}/dockge/data:/app/data" : Mount the dockge application data and configuration files into the container
- "/var/run/docker.sock:/var/run/docker.sock" : Host system docker socket that contains the current state of the docker instances in the host system; Mount into container so the container knows as well

## Wiki

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  dockge:
    image: louislam/dockge:1
    container_name: dockge
    restart: unless-stopped
    environment:
      ## Environment Variables
      # Tell Dockge where is your stacks directory
      - DOCKGE_STACKS_DIR=/opt/stacks
    ports:
      ## Port Forward/translate/map from host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - "5001:5001" # HTTP WebUI
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permission]
      - "${PWD}/dockge/app/data:/app/data"
      - "/var/run/docker.sock:/var/run/docker.sock" # Host system docker socket that contains the current state of the docker instances in the host system; Mount into container so the container knows as well

      ### Stacks Directory
      # ⚠️ READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH.
      # ⚠️ 1. FULL path only. No relative path (MUST)
      # ⚠️ 2. Left Stacks Path === Right Stacks Path (MUST)
      # - "/path/to/docker/container/root/directory:/opt/stacks"
      - "/opt/stacks:/opt/stacks" 
```

## Resources

## References
+ [YouTube - Louis - Dockge 1.0 - RELEASE](https://www.youtube.com/watch?v=AWAlOQeNpgU&t=48s)

## Remarks

