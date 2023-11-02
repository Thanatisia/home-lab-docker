# Homer dashboard

## Information
### Project
+ Project Author: bastienwirtz
+ Project Name: homer
- Repositories:
    + GitHub: https://github.com/bastienwirtz/homer
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/b4bz/homer

### Background
```
Homer is a full static html/js dashboard, based on a simple yaml configuration file
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM32 : linux/arm/v6, linux/arm/v7
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
git clone https://github.com/bastienwirtz/homer
```

### Change directory into repository
```console
cd homer
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
- /www/ : Webserver data
    - assets/ : Contains your dashboard assets (files, configs)

#### Container Volume Mount Points
+ `/path/to/local/assets:/www/assets` : Contains your dashboard assets (files, configs)

#### docker-compose configuration
- Sample Template
    ```yaml
version: "3.7"
services:
  homer:
    image: b4bz/homer:latest
    container_name: "homer"
    restart: unless-stopped
    ports:
      # Port forward/translation/mapping from host system to container
      # [IP-address]:[Host-system-port]:[Container port]
      - "8080:8080"
    volumes:
      # Mount filesystem volumes of host system into container
      # [Host-system-volume]:[Container volume]:[Permission]
      - "/path/to/local/assets:/www/assets" # Mount Web server assets folder
    ```

### Networking
#### Ports
+ 8080 : The WebUI

## Resources

## References

## Remarks

