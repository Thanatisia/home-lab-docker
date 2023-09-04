# ntfy.sh

## Information
### Project
+ Project Author: binwiederhier
+ Project Name: ntfy
- Repositories:
    + GitHub: https://github.com/binwiederhier/ntfy
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/binwiederhier/ntfy

### Background
```
Simple HTTP-based pub-sub notification service that allows you to send push notifications to your phone or desktop using PUT/POST
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM32 : linux/arm/v6; linux/arm/v7
+ ARM64 : linux/arm64

## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git
- Go : for main server
    + goreleaser : required for a proper main server build
- gcc : required for main server and for SQLite cgo-based bindings
    + gcc-arm-linux-gnueabi
    + gcc-aarch64-linux-gnu
+ make : required for convenience
+ libsqlite3/libsqlite3-dev : required for main server, for SQLite cgo-based bindings
+ python : for pip, only to build documentations
+ nodejs : for npm, only to build the webapp

### Pre-Requisites
+ Notifications requires HTTPS

### Clone the repository
```console
git clone https://github.com/binwiederhier/ntfy
```

### Change directory into repository
```console
cd ntfy
```

### Build from Source
- Using make
    - build/install target
        - Targets
            + default (not specified)      : build all
            + build                        : Build ntfy binary including web app and docs for all supported architectures (amd64, armv7, arm64)
            + cli-linux-[architecture]     : Build server/client binary (for the specified architecture, no web app or docs)
            + install-linux-[architecture] : Install ntfy binary to /usr/bin/ntfy (for the specified architecture)
            + web                          : Build the web app
            + docs                         : Build the documentation
            + check                        : Run all tests, vetting/formatting checks and linters
        ```console
        make [targets]
        ```

### Build image from Dockerfile
- Build image using `docker {buildx} build`
    ```console
    docker buildx build --tag=ntfy -f ./Dockerfile
    ```

- (Optional) Download ntfy configuration file
    ```console
    curl -L -O https://raw.githubusercontent.com/binwiederhier/ntfy/main/server/server.yml
    ```

## Documentation
### Manual
- Manual startup
    ```console
    ntfy serve
    ```

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=ntfy -v /etc/ntfy:/etc/ntfy -v /var/cache/ntfy:/var/cache/ntfy binwiederhier/ntfy:[version] serve
    ```

- Teardown/Shutdown
    ```console
    docker container stop ntfy && docker container rm ntfy
    ```

- Start a stopped container
    ```console
    docker container start ntfy
    ```

- Stop a running container
    ```console
    docker container stop ntfy
    ```

- Restart a running container
    ```console
    docker container restart ntfy
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
    docker-compose start ntfy
    ```

- Stop a running container
    ```console
    docker-compose stop ntfy
    ```

- Restart a running container
    ```console
    docker-compose restart ntfy
    ```

### Parameters
- Positionals
    - Actions
        - `publish {options} <arguments>`: To send messages via the CLI
            - Options
                - With Arguments
                - Flags
        - `serve {options} <arguments>`: Serve the web server
            - Options
                - With Arguments
                    + --cache-file [cache-db-filepath] : Explicitly specify cache database file
                - Flags
        - `subscribe {options} <arguments>`: To subscribe to topics via the CLI
            - Options
                - With Arguments
                - Flags
- Optionals
    - With Arguments
    - Flags

### Arguments
- To parse arguments/parameters into watchtower
    - `docker run`
        + specify all commands, parameters, arguments behind the image name to startup
        ```console
        docker run -itd --name=ntfy ... binwiederhier/ntfy [actions] {options}
        ```
    - docker-compose configuration file
        + add to the key 'command:' in the docker-compose configuration file
        ```yaml
        version: "3.7"
        services:
            ntfy:
                image: binwiederhier/ntfy
                container_name: ntfy
                ...
                command: 
                    - [parse-argument-here]
        ```

### Usage
- Setup
    1. Download/Build the ntfy application
        + Google Play
        + F-Droid
        + iOS App Store
    2. Open it and subscribe to a topic of your choosing
        - Notes
            + The topic names are public, so choose something that cannot be guessed easily
        - Click subscribe
- To send a message
    - Using curl (command line)
        ```console
        curl -d "Backup successful" [ntfy-server-ip]/[subscription-topic-name]
        ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
- /etc/
    - ntfy/ : Contains the ntfy configuration files
- /var/
    - cache/ntfy : For persistent cache storage
        + cache.db : Cache database file

#### Container Volume Mount Points
+ `/var/cache/ntfy:/var/cache/ntfy` : For persistent cache storage
+ `/etc/ntfy:/etc/ntfy` : Contains the ntfy configuration files

#### docker-compose configuration
- Sample Template
    ```yaml
version: "3.7"
services:
  ntfy:
    image: binwiederhier/ntfy
    container_name: ntfy
    restart: unless-stopped
    environment:
      ## Parse Environment Variables
      - TZ=UTC # Optional: set desired timezone
    user: ${UID}:${GID} # Optional; Replace with your own user ID (UID)/group ID (GID)
    ports:
      ## Port forward/translate/map from host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - 80:80 # For HTTP WebUI
      - 443:443 # For HTTPS WebUI and Notification
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permissions]
      - /var/cache/ntfy:/var/cache/ntfy # For persistent message cache
      - /etc/ntfy:/etc/ntfy
    command:
      - serve
    ```

### Networking
#### Ports
+ 80 : For HTTP WebUI
- 443 : For HTTPS WebUI
    + HTTPS is required for Notifications

## Resources
+ [YouTube - Awesome Open Source - Open Source Push Notifications! Get notified of any event you can imagine. Triggers abound!](https://www.youtube.com/watch?v=WJgwWXt79pE)
+ [YouTube - NetworkChuck - how did I NOT know about this?](https://www.youtube.com/watch?v=poDIT2ruQ9M)

## References
+ [ntfy.sh Configuration server.yml file](https://github.com/binwiederhier/ntfy/blob/main/docker-compose.yml)
+ [ntfy.sh Documentations - Configuration](https://docs.ntfy.sh/config/)
+ [ntfy.sh Documentations - Main Page and Getting Started](https://docs.ntfy.sh/)
+ [ntfy.sh Documentations - Install](https://docs.ntfy.sh/install/)

## Remarks
