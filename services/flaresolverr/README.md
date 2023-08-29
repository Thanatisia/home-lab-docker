# FlareSolverr

## Information
### Project
+ Project Author: FlareSolverr
+ Project Name: FlareSolverr
- Repositories:
    + GitHub: https://github.com/FlareSolverr/FlareSolverr
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/flaresolverr/flaresolverr
        + GitHub Containerized: https://github.com/orgs/FlareSolverr/packages/container/package/flaresolverr

### Background
```
Open Source, Virtual Whiteboard + Network Diagram/Drawing tool for sketching hand-drawn diagrams
```

### Supported Architectures
+ x86   : linux/386
+ x86-64: linux/amd64
+ ARM32 : linux/arm/v7
+ ARM64 : linux/arm64

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites


## Documentation
### Manual

### Clone the repository
```console
git clone https://github.com/FlareSolverr/FlareSolverr
```

### Change directory into repository
```console
cd FlareSolverr
```

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=flaresolverr -p 8191:8191 -e LOG_LEVEL=info --restart unless-stopped ghcr.io/flaresolverr/flaresolverr:latest
    ```

- Teardown/Shutdown
    ```console
    docker container stop flaresolverr && docker container rm flaresolverr
    ```

- Start a stopped container
    ```console
    docker container start flaresolverr
    ```

- Stop a running container
    ```console
    docker container stop flaresolverr
    ```

- Restart a running container
    ```console
    docker container restart flaresolverr
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
    docker-compose start flaresolverr
    ```

- Stop a running container
    ```console
    docker-compose stop flaresolverr
    ```

- Restart a running container
    ```console
    docker-compose restart flaresolverr
    ```


### Usage
- Example Request
    ```console
    curl -L -X POST 'http://[flaresolverr-server-ip]:[flaresolverr-server-port]/v1' \
    -H 'Content-Type: application/json' \
    --data-raw '{
      "cmd": "request.get",
      "url":"http://www.google.com/",
      "maxTimeout": 60000
    }'
    ```

#### docker run
- Redirecting a container through flaresolverr as proxy
    ```console
    docker run -itd --name=container-name ... --proxy [flaresolverr-server-ip]:[flaresolverr-server-port] [image]
    ```

#### docker compose
- In docker-compose.yaml
    ```yaml
    services:
        [service-name]:
            image:
            container_name: 
            hostname: 
            ports:
            environment:
                HTTP_PROXY: 'http://host:port' # For HTTP proxy
                HTTPS_PROXY: 'https://host:port' # For HTTPS proxy
    ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure

#### Container Volume Mount Points

### Networking
#### Ports
+ 80 : For HTTP WebUI
+ 443 : For HTTPS WebUI

## Resources

## References

## Remarks
