# Rust compiler dockerized

* Contains a Dockerfile that will prepare the rust image to be used with the docker-compose file.

## Information
### Development
* the [docker-compose file](docker-compose.yaml) is currently still a Work in Progress, trying to work out some issues regarding mounting.
For the time being, please use the docker run method (which honestly, might be more efficient than using docker-compose for Development environment utilities/tools)

## Setup
### Pre-Requisites
+ have your Rust code ready
- Rust project work structure/filesystem
    - Must include the following
        + Cargo.toml

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

### Executing
- Invoke cargo commands in container
    - Create new project
        ```console
        docker exec -it [container-name] /bin/bash -c "cargo new [project-name]"
        ```

### Output
+ Upon running, the rust compiler will output the compiled binary file in '/app/bin'

### Usage/Snippet Examples
1. Cargo new project workspace
    - Build dockerfile into image
        ```console
        docker build -t [new-docker-image-name] [path-to-dockerfile (i.e. '.')]
        ```
    - docker run and startup a container using built Dockerfile image 
        + with Volume mounting : This is like using the key 'volume:' in a docker-compose environment to mount a folder in your host system to the container
            + This lets you effectively get the files that will be output by rust, as well as let the docker environment see your source files
        ```console
        docker run -itd -v $(pwd)/rust/app/src:/rust/app/src --name [container-name] [docker-image-name]
        ```
    - Execute commands in container
        - Create new project workspace
            + Because you mounted the source file volume directory, the outputted project workspace is also found there
            ```console
            docker exec -it [container-name] /bin/bash -c "cargo new [project-name]"
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
+ [FreeCodeCamp - How to mount local directories using `docker run -v`](https://www.freecodecamp.org/news/docker-mount-volume-guide-how-to-mount-a-local-directory/#:~:text=You%20bind%20local%20directories%20and,source%3E%3A%20.)
+ [DOcker blogs - Simplify your deployments using the rust official image](https://www.docker.com/blog/simplify-your-deployments-using-the-rust-official-image/)

## Remarks
