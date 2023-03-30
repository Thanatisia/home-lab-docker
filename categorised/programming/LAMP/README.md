# LAMP stack dockerized (with the Apache tag)

* LAMP is a programming/development stack; It stands for Linux-Apache-MySQL-PHP
    - Where
        + Linux : The Operating System
        + Apache : Webserver
        + MySQL : Database
        + PHP : Programming Language
    - A programming Stack is basically a set of popular tools/utilities used together widely in the industry to fulfil a purpose
* This docker-compose environment file uses the base image `php:apache`, essentially the php base image but with apache built-in

## Information
- Base Images: 
    + php : `php:apache`
    + mysql : `mysql:latest`
    + phpmyadmin : `phpmyadmin/phpmyadmin`
- Repositores:
    + [PHP dockerhub](https://hub.docker.com/_/php)

### Development

## Setup
### Pre-Requisites
+ have your PHP code ready
- Please edit the following files before starting up 
    + '.env' environment variable file in '$PWD/mysql'
    + '.env' environment variable file in '$PWD/phpmyadmin'

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
1. Basic startup without docker-compose
    - Pull image
        ```console
        docker pull php:apache
        ```
    - docker run and startup a container using built Dockerfile image 
        + with Volume mounting : This is like using the key 'volume:' in a docker-compose environment to mount a folder in your host system to the container
            + This lets you effectively get the files that will be output by rust, as well as let the docker environment see your source files
        ```console
        docker run -itd -v $(pwd)/app/src:/var/www/html --name [container-name] [docker-image-name]
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
+ [StackOverflow - Difference between apache vs fpm in php docker image](https://stackoverflow.com/questions/54270656/difference-between-apache-vs-fpm-in-php-docker-image)
+ [PHP dockerhub](https://hub.docker.com/_/php)

## Remarks
