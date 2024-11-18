# Home Lab - coder/coder

## Information
### Description
+ coder is a Remote/Cloud-based Integrated Development Environment (IDE) Provisioning and Setup Web Application via Terraform
- Coder enables organizations to set up development environments in their public or private cloud infrastructure.
    + Cloud development environments are defined with Terraform, connected through a secure high-speed Wireguard® tunnel, and automatically shut down when not used to save on costs. 
    + Coder gives engineering teams the flexibility to use the cloud for workloads most beneficial to them.
- Define cloud development environments in Terraform
    + EC2 VMs, Kubernetes Pods, Docker Containers, etc.
    + Automatically shutdown idle resources to save on costs
    + Onboard developers in seconds instead of days

### Project
+ Author: coder
+ Repository Name: coder
+ Websites: https://coder.com/
- Repositories
    + GitHub: https://github.com/coder/coder
- Docker Image
    + GitHub Container Repository: https://github.com/coder/coder/pkgs/container/coder

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Create the volume mount points
    ```bash
    mkdir -pv stirling-pdf/{training-data,extra-configs,logs,custom-files}
    ```

- Set Environment Variables
    + `CODER_DATA=$HOME/.config/coderv2-docker` : Set this to your coder configurations data directory/folder
    + `DOCKER_GROUP=$(getent group docker | cut -d: -f3)` : Set this to your docker group ID
    + `CODER_ACCESS_URL="[workspaces-ip-address|domain]"` : Set this to an accessible workspaces IP Address/domain; This cannot be localhost or 127.0.0.1 for non-docker templates

### Customization

- docker-compose.yaml
    + Obtain a copy of the docker-compose file from [Templates](#templates)

### Startup Image and container

> Using docker run CLI

- Startup container
    ```bash
    docker run -itd \
        --name "coder" \
        --restart=unless-stopped \
        --group-add="${DOCKER_GROUP} \
        -e CODER_HTTP_ADDRESS="0.0.0.0:7080" \
        # -e CODER_PG_CONNECTION_URL="postgresql://${POSTGRES_USER:-username}:${POSTGRES_PASSWORD:-password}@database/${POSTGRES_DB:-coder}?sslmode=disable" \
        # -e CODER_ACCESS_URL="${CODER_ACCESS_URL}" \
        -p 7080:7080 \
        -v "${CODER_DATA}:/home/coder/.config" \
        -v "${PWD}/project/workspace:/home/coder/" \
        -v "/var/run/docker.sock:/var/run/docker.sock" \
        ghcr.io/coder/coder:latest
    ```

- Stop and remove container
    ```bash
    docker stop coder && docker rm coder
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

- Host System
    + `CODER_DATA=$HOME/.config/coderv2-docker` : Set this to your coder configurations data directory/folder
    + `DOCKER_GROUP=$(getent group docker | cut -d: -f3)` : Set this to your docker group ID
    + `CODER_ACCESS_URL="[workspaces-ip-address|domain]"` : Set this to an accessible workspaces IP Address/domain; This cannot be localhost or 127.0.0.1 for non-docker templates

- Database
    + `CODER_PG_CONNECTION_URL="postgresql://${POSTGRES_USER:-username}:${POSTGRES_PASSWORD:-password}@database/${POSTGRES_DB:-coder}?sslmode=disable"` : Specify the Database Connection URL to the PostgreSQL database instance to connect coder with

- WebUI Application
    + `CODER_HTTP_ADDRESS: "0.0.0.0:7080"` : Define the webserver's HTTP Server IP Address and Port Number
    - `CODER_ACCESS_URL: "${CODER_ACCESS_URL}"` : Set the URL to the coder Web Application UI instance
        - Notes
            + You'll need to set CODER_ACCESS_URL to an IP or domain that workspaces can reach.
            + This cannot be localhost or 127.0.0.1 for non-Docker templates!

### Network Ports
- 7080 : HTTP WebUI Port

#### Volumes
- /home : Home directory
    - coder/ : 'coder' user's home directory
        - .config/ : XDG home configuration directory for user 'coder'
- /var : Various miscelleneous files
    - run/ : Contains the running data files and configuration files used by the system
        + docker.sock : Docker socket file; Used by docker/applications that requires the running state of the docker server instance, including running configuration and information during runtime

### Templates

> docker-compose.yaml

```yaml
version: "3.9"
services:
  coder:
    image: ghcr.io/coder/coder:latest
    container_name: coder
    restart: unless-stopped
    group_add:
      - ${DOCKER_GROUP} # Docker group ID
    environment:
      ## Map Environment Variables into the container
      # CODER_PG_CONNECTION_URL: "postgresql://${POSTGRES_USER:-username}:${POSTGRES_PASSWORD:-password}@database/${POSTGRES_DB:-coder}?sslmode=disable"
      CODER_HTTP_ADDRESS: "0.0.0.0:7080" # Define the webserver's HTTP Server IP Address and Port Number
      # You'll need to set CODER_ACCESS_URL to an IP or domain
      # that workspaces can reach. This cannot be localhost
      # or 127.0.0.1 for non-Docker templates!
      # CODER_ACCESS_URL: "${CODER_ACCESS_URL}"
    ports:
      ## Port Forward/Translate/Map ports from the host system to the container
      ## [host-system-ip-address]:[host-system-port]:[container-port]
      - 7080:7080 # Port Number for WebUI
    volumes:
      ## Mount volumes from the host system to the container
      ## [host-system-volume]:[container-volume]:[permission]
      ### Mount your coder .config directory
      - "${CODER_DATA}:/home/coder/.config"
      ### Mount your project workspace directories into the container
      - "${PWD}/go/package-name:/home/coder/"
      ### Mount your docker socket file
      - /var/run/docker.sock:/var/run/docker.sock
```

## Wiki

## Resources

## References
+ [GitHub - coder/coder](https://github.com/coder/coder)
+ [coder - Documentations](https://coder.com/docs)
+ [coder - Documentations - Installation](https://coder.com/docs/install)
+ [coder - Documentations - Installation - Docker](https://coder.com/docs/install/docker)

## Remarks

