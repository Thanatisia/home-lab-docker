# imputnet/cobalt API

## Information
### Summary
+ imputnet/cobalt is the core API server for processing wukko's cobalt.tools Web application

### Project
+ Author: imputnet (wuzzy)
+ Repository Name: cobalt
- Repositories
    + GitHub: https://github.com/imputnet/cobalt
- Docker Images
    + GitHub Container Repository: ghcr.io/imputnet/cobalt:10

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites

## Docker Management

### Startup the docker image
- Using docker run
    ```bash
    docker run -itd \
        --name="cobalt-api" \
        --restart=unless-stopped \
        ## Mount Environment Variables into container
        ### Set the WebUI/API Server's root URL/domain required to access the Web Application
        ### - This is required for tunneling functionality to work properly
        -e 'API_URL="http://[cobalt-api-server-IP-address|domain]:[cobalt-api-server-port-number]"' \
        ### Uncomment the next line and volumes if you want to use cookies for fetching data from services
        -e 'COOKIE_PATH: "/cookies.json"' \
        ## Port Forward/Translate/Map from host system to container
        ## [host-system-ip-address]:[host-system-port]:[container-port]
        -p 9000:9000/tcp \
        ## If you use a Reverse Proxy (i.e. nginx)
        ## Use the following:
        ## - 127.0.0.1:9000:9000
        ## Mount volumes from host system into container
        ## [host-system-volume]:[container-volume]:[permissions]
        ## Uncomment only if you use the COOKIE_PATH environment variable
        -v "./cookies.json:/cookies.json" \
        ## Set the label as necessary
        ### Watchtower
        --label ="com.centurylinklabs.watchtower.scope=cobalt" \
        ghcr.io/imputnet/cobalt:10
    ```

- Using docker-compose
    ```bash
    docker-compose up -d
    ```

### Shutdown docker image
- Using docker CLI
    ```bash
    docker stop cobalt-api && docker rm cobalt-api
    ```

- Using docker-compose
    ```bash
    docker-compose down
    ```

## Documentations

## Wiki
### Templates
> docker-compose
```yaml
version: "3.7"
services:
  cobalt-api:
    image: ghcr.io/imputnet/cobalt:10
    container_name: cobalt-api
    restart: unless-stopped
    environment:
      ## Mount Environment Variables into container
      ### Set the WebUI/API Server's root URL/domain required to access the Web Application
      ### - This is required for tunneling functionality to work properly
      # API_URL: "https://api.url.example/"
      API_URL: "http://127.0.0.1:9000"

      ### Uncomment the next line and volumes if you want to use cookies for fetching data from services
      # COOKIE_PATH: "/cookies.json"
    ports:
      ## Port Forward/Translate/Map from host system to container
      ## [host-system-ip-address]:[host-system-port]:[container-port]
      - 9000:9000/tcp
      ## If you use a Reverse Proxy (i.e. nginx)
      ## Use the following:
      ## - 127.0.0.1:9000:9000
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permissions]
      ## Uncomment only if you use the COOKIE_PATH environment variable
      ## - "./cookies.json:/cookies.json"
    labels:
      ## Set the label as necessary
      ### Watchtower
      # - com.centurylinklabs.watchtower.scope=cobalt
```

## Resources

## References
+ [docker-compose example file](https://github.com/imputnet/cobalt/blob/main/docs/examples/docker-compose.example.yml)

## Remarks

