# Dockerfile Recipes

## Information
### Summary
+ This directory contains Dockerfile build recipes for easy access to build docker images locally
- Each subdirectories contain various Dockerfiles to build docker images for custom use cases involving common docker images
    - For example
        - Base Image: code-server (VS Code Cloud Integrated Development Environment (IDE) Platform)
            - Use-Cases and Purposes
                + code-server for a C-based IDE
                + code-server for a C#-based IDE
                + code-server for a Python-based IDE
                + code-server for a Golang-based IDE

### Project Filesystem Structure Hierarchy/Layout

```
Dockerfiles/
|
|-- [base-image-name]/
    |
    |-- README.md
    |
    |-- Dockerfiles : Contains your custom `*.Dockerfile` files
        |
        |-- *.Dockerfile : The Dockerfile docker image template
    |
    |-- docker-compose/ : Contains a docker-compose configuration file corresponding to the Dockerfile of the same use case for building the Dockerfile image and starting up of container
    |
    |-- Makefile : Easy-to-access Makefile containing various rules/targets that streamlines the building process of the Dockerfile
```

## Dockerfile Build Templates

### Services
- cobalt-web
    - Dockerfiles
        + `[alpine.Dockerfile](cobalt-web/Dockerfiles/alpine.Dockerfile)`
- code-server
    - Dockerfiles
        + `[arch.Dockerfile](code-server/Dockerfiles/arch.Dockerfile)` : Custom docker image template that builds, installs and starts up code-server using ArchLinux as the base image instead of Ubuntu
        + `[go.Dockerfile](code-server/Dockerfiles/go.Dockerfile)` : Custom docker image template that overlays an additional build step to install all Golang Development Tools/Utilities and SDKs, using 'lscr.io/linuxserver/code-server' as the base image
        + `[python.Dockerfile](code-server/Dockerfiles/python.Dockerfile)` : Custom docker image template that overlays an additional build step to install all Python Development Tools/Utilities and SDKs, using 'lscr.io/linuxserver/code-server' as the base image

## Documentations

### Quickstart

> Building dockerfile to image

1. Identify the service you want to build locally
2. Obtain the Dockerfile directory containing the Dockerfile templates
    - Git clone the repository
        ```bash
        git clone https://github.com/Thanatisia/home-lab-docker
        ```
    - Change directory into the directory
        ```bash
        cd Dockerfiles/[service-name]/Dockerfiles/
        ```
    - (Optional) Copy the dockerfile to an external location
        ```bash
        cp [dockerfile-name].Dockerfile [custom-location]
        cd [custom-location]
        ```
3. Build the Dockerfile image
    ```bash
    docker build -t [image-author]/[image-name]:[tag|version] -f [Dockerfile-name] [context (default: ".")]
    ```
4. Verify that the image has been built
    - Check that the image you built exists
    ```bash
    docker image ls --all
    ```

### Usage

## Resources

## References

## Remarks

