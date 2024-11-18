# Home Lab - go-playground

## Information
### Description
+ go-playground is an Improved, Better Go playground with autocompletion and syntax highlighting
+ powered by the Monaco Editor and ReactJS

### Project
+ Author: x1unix
+ Repository Name: go-playground
+ Website: https://goplay.tools/
- Repositories
    + GitHub: https://github.com/x1unix/go-playground
- Docker Image
    + DockerHub: https://hub.docker.com/r/x1unix/go-playground

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites

### Customization

- docker-compose.yaml
    + Obtain a copy of the docker-compose file from [Templates](#templates)

### Startup Image and container

> Using docker run CLI

- Startup container
    ```bash
    docker run -itd \
        --name "go-playground" \
        --restart=unless-stopped \
        -e DOCKER_ENABLE_SECURITY=false \
        -e INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false \
        -e LANGS=en_GB \
        -e APP_CLEAN_INTERVAL='30m' \
        -e APP_BUILD_DIR="/var/cache/wasm" \
        -e APP_PLAYGROUND_URL="https://play.golang.org" \
        -e GOROOT="/usr/local/go" \
        -p 8000:8000 \
        x1unix/go-playground:latest
    ```

- Stop and remove container
    ```bash
    docker stop go-playground && docker rm go-playground
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
- `GOROOT="/usr/local/go"` : Specify the Go SDK root location. Uses go env GOROOT as fallback.; This is equivalent to the GOROOT Environment Variable used to setup golang on the host system
- `APP_DEBUG={true|false}` : Enables/Disables debug logging.
- `APP_LOG_LEVEL="info"` : Specify the Logger log level. debug requires APP_DEBUG env var.
- `APP_LOG_FORMAT="console, json"` : Specify the application	log formats (Separate each format with a ',' delimiter/separator)
- `APP_PLAYGROUND_URL="https://play.golang.org"` : Specify the Official Go playground service URL.
- `APP_GOTIP_URL="https://gotipplay.golang.org"` : Specify the GoTip playground service URL.
- `APP_BUILD_DIR="/var/cache/wasm"` : Specify the path to store cached WebAssembly builds.
- `APP_CLEAN_INTERVAL="10m"` : Specify the WebAssembly build files cache cleanup interval.
- `APP_SKIP_MOD_CLEANUP=1` : Enables/Disables WASM builds cache cleanup.
- `APP_PERMIT_ENV_VARS="GOSUMDB,GOPROXY"` : Restricts list of environment variables passed to Go compiler.
- `APP_GO_BUILD_TIMEOUT="40s"` : Go WebAssembly program build timeout. Includes dependency download process via go mod download
- `HTTP_READ_TIMEOUT="15s"`  : HTTP request read timeout.
- `HTTP_WRITE_TIMEOUT="60s"` : HTTP response timeout.
- `HTTP_IDLE_TIMEOUT="90s"`  : HTTP keep alive timeout.

### Network Ports
- 8000 : HTTP WebUI Port

#### Volumes

### Templates

> docker-compose.yaml

```yaml
version: "3.7"
services:
  go-playground:
    image: x1unix/go-playground:latest
    container_name: go-playground
    restart: unless-stopped
    environment:
      ## Map Environment Variables into the container
      ### Application Data/Cache
      APP_CLEAN_INTERVAL: '30m'
      APP_BUILD_DIR: /var/cache/wasm # Specify the path to store cached WebAssembly (wasm) builds
      ### Web Application data
      # APP_PLAYGROUND_URL: "https://play.golang.org" # Specify the Go playground service URL
      ### Go Environment Variables
      GOROOT: "/usr/local/go" # Explicitly specify the Go root directory location (Where the Go SDK installation is located)
    ports:
      ## Port Forward/Translate/Map ports from the host system to the container
      ## [host-system-ip-address]:[host-system-port]:[container-port]
      - 8000:8000 # Port Number for WebUI
    # volumes:
      ## Mount volumes from the host system to the container
      ## [host-system-volume]:[container-volume]:[permission]
```

## Wiki

## Resources

## References
+ [GitHub - x1unix/go-playground](https://github.com/x1unix/go-playground)
+ [Go Playground Demo](https://goplay.tools/)

## Remarks

