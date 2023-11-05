# EmulatorJS

## Information
### Project
+ Project Author: linuxserver
+ Project Name: emulatorjs
- Repositories:
    - GitHub: 
        + Main: https://github.com/linuxserver/emulatorjs
        + Docker: https://github.com/linuxserver/docker-emulatorjs.git
    - Container Repositories
        + DockerHub: https://hub.docker.com/r/linuxserver/emulatorjs
        + lscr : lscr.io/linuxserver/emulatorjs:latest

### Background
```
A self-hosted in-browser web-based retro emulation platform portable to nearly any device for many retro consoles. 
A mix of emulators is used between Libretro (created and/or used by Retroarch for core-based emulation) and EmulatorJS.
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM64 : linux/arm64v8

### Docker Design
- Docker image will spin up
    + The nodejs backend used for managing your configuration files and rom art assets.
    + An NGINX webserver to serve the static frontend files.
    + An IPFS daemon for ingesting decentralized art asset files.

## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git
+ nodejs : for npm, only to build the webapp
+ libretro

### Pre-Requisites

### Clone the repository
```console
git clone https://github.com/linuxserver/docker-emulatorjs.git
```

### Change directory into repository
```console
cd docker-emulatorjs
```

### Build from Source
- Docker
    - Default
        ```console
        docker build --no-cache --pull -t lscr.io/linuxserver/emulatorjs:latest .
        ```
    - Build for ARM variants on x86_64 hardware using 'multiarch/qemu-user-static'
        - Register ARM using QEMU/KVM
            ```console
            docker run --rm --privileged multiarch/qemu-user-static:register --reset
            ```
        - Run the ARM64 dockerfile
            ```console
            docker build --no-cache -f Dockerfile.aarch64 .
            ```

## Documentation

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd \
        --name=emulatorjs \
        --restart=unless-stopped \
        -e PUID=1000 \ 
        -e PGID=1000 \
        -e TZ=[Region]/[City] \
        -e SUBFOLDER=/ \
        -p 3000:3000 \
        -p 80:80 \
        -p 4001:4001 \
        -v /path/to/config:/config \
        -v /path/to/data:/data \
        lscr.io/linuxserver/emulatorjs:latest
    ```

- Teardown/Shutdown
    ```console
    docker container stop emulatorjs && docker container rm emulatorjs
    ```

- Start a stopped container
    ```console
    docker container start emulatorjs
    ```

- Stop a running container
    ```console
    docker container stop emulatorjs
    ```

- Restart a running container
    ```console
    docker container restart emulatorjs
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
    docker-compose start emulatorjs
    ```

- Stop a running container
    ```console
    docker-compose stop emulatorjs
    ```

- Restart a running container
    ```console
    docker-compose restart emulatorjs
    ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
- /config : WebUI platform configuration
- /data   : WebUI Emulator data
    - [emulator-name] : Contains data pertaining to the specific emulator
        - roms/ : Contains all ROMs/ISOs for the emulator

#### Container Volume Mount Points
+ `/path/to/config:/config` : For WebUI platform configurations
+ `/path/to/data:/data` : Contains the Emulation platform data

#### docker-compose configuration
- Sample Template
    ```yaml
version: "3.7"
services:
  emulatorjs:
    image: lscr.io/linuxserver/emulatorjs:latest
    container_name: emulatorjs
    restart: unless-stopped
    environment:
      ## Environment Variables
      - "PUID=1000"
      - "PGID=1000"
      - "TZ=Asia/Singapore"
      - "SUBFOLDER=/"
    ports:
      ## Port Forward/Translate/Map from host system to container
      ## [ip-address]:[host-system-port]:[container-port]
      - "3000:3000" # 
      - "80:80" # For WebUI
      - "4001:4001" # Optional
    volumes: 
      ## Mount volume from host system into container
      ## [host-systemv-volume]:[container-volume]:[permission]
      - "/path/to/config:/config" # Place your configurations here
      - "/path/to/data:/data" # Place your data here
      - "/path/to/roms:/data/[your-emulator]/roms" # Place your emulator ROMs
    ```

### Networking
#### Ports
+ 3000 : The emulator webui management site
+ 80 : The emulation/game site
+ 4001 : TBC

## Resources

## References

## Remarks
