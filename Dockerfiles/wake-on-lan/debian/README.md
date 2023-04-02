# Dockerfile + docker-compose for building a Wake-on-LAN service using 'etherwake'

## Imformation
+ Base Image: Debian:latest
+ Entrypoint: etherwake
- Dependencies
    + etherwake
- Folders (Recommended)
    + ./wol/config/ : Place all your `wakeonlan` configuration files in here to mount into the container
- Files
    + ./wol/config/[wakeonlan-config-filename] : This is the WakeOnLAN configuration file; Refer to 'wol.template' for a sample config file

## Setup
### Pre-Requisites

### Dependencies
+ docker(-ce)
+ docker-compose

### Using manual docker run
- Build Dockerfile image
    ```console
    docker build -t [docker-image-name] [dockerfile-path]
    ```
- Run docker image
    - General background
        ```console
        docker run -itd --name [container-name] [image-name] {other-commmands}
        ```

    - Run docker image with volume mapping (Recommended)
        ```console
        docker run -itd -v "[host-system-volume]:[container-volume]"  --name [container-name] [image-name] {other-commmands}
        ```
- Stop docker container
    ```console
    docker container stop [container-name]
    ```
- Remove docker container
    ```console
    docker container rm [container-name]
    ```
- Remove docker image
    ```console
    docker image rm [container-name]
    ```

### Using docker-compose
- Running
    ```console
    docker-compose up -d --build
    ```

- Teardown
    ```console
    docker-compose down
    ```

### Debugging
- Check issues with docker container
    - Check container process
        ```console
        docker (container) ps
        ```
    - Check docker container logs
        ```console
        docker logs [container-name]
        ```

### Usage/Snippet Examples
1. Basic startup with volume mount
    - Dockerfile/docker run
        - Build dockerfile into image
            ```console
            docker build -t [new-docker-image-name] [path-to-dockerfile (i.e. '.')]
            ```
        - docker run and startup a container using built Dockerfile image 
            + with Volume mounting : This is like using the key 'volume:' in a docker-compose environment to mount a folder in your host system to the container
                + This lets you effectively get the files that will be output by rust, as well as let the docker environment see your source files
            ```console
            docker run -itd -v $(pwd)/wol/config/[wakeonlan-config-filename]:/wol/configs --name [container-name] [docker-image-name]
            ```
        - Execute commands in container
            - Create new project workspace
                + Because you mounted the source file volume directory, the outputted project workspace is also found there
                ```console
                docker exec -it [container-name] {etherwake-options} [mac-address-here]
                ```
        - Stop docker container
            ```console
            docker container stop [container-name]
            ```
        - Remove docker container
            ```console
            docker container rm [container-name]
            ```
        - Remove docker image
            ```console
            docker (image) stop [container-name]
            ```
    - docker-compose
        - Startup docker-compose
            ```console
            docker-compose up -d --build
            ```
        - Stop docker-compose
            ```console
            docker-compose down
            ```
        - Start container
            ```console
            docker-compose start [container-name]
            ```
        - Stop container
            ```console
            docker-compose stop [container-name]
            ```

## Documentation

### Usage
- Execute container with '-it' to get a shell
    ```console
    docker exec -it [container-name] [command]
    ```

- wakeonlan
    - Send WoL Magic Packets
        ```console
        docker exec -it [container-name] wakeonlan [Mac-address-here]
        ```

- etherwake
    - Send WoL Magic Packets
        ```console
        docker exec -it [container-name] etherwake [MAC-address-here]
        ```
    - Send WoL Magic Packets with Increased Debug Level (verbose)
        ```console
        docker exec -it [container-name] etherwake -D [MAC-address-here]
        ```

## Wiki

## Resources

## References
+ [Cyberciti - How to wake up computers using Wake-on-LAN (WOL) By sending Magic Packets](https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html)
+ [StackOverflow - Interactive Shell using docker-compose](https://stackoverflow.com/questions/36249744/interactive-shell-using-docker-compose)

## Remarks
