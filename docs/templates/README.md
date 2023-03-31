# [Server/service/utility/tool] dockerized

## Information
### Project Information
+ Service Author: [project-author]
+ Service Name: [project-name]
+ URL: https://[repository-url]/[project-author]/[project-name]
- Documentations 
    - Documentation Links

### Background
```
Self-Hosted Docker container management platform
```

## Setup
### Pre-Requisites


### Dependencies
+ docker(-ce)
+ docker-compose

## Documentation
### Using docker-compose
- Running
    ```console
    docker-compose up -d --build
    ```

- Teardown
    ```console
    docker-compose down
    ```

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
1. Accessing
    - docker run and startup a container
        + with Volume mounting : This is like using the key 'volume:' in a docker-compose environment to mount a folder in your host system to the container
            + This lets you effectively get the files that will be output by rust, as well as let the docker environment see your source files
        ```console
        docker run -itd --name [container-name] [image]
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

## Resources

## References

## Remarks

