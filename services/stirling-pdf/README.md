# Home Lab - Self-hosting PDF Manipulation and Editor - Using docker 'stirling-pdf'

## Information
### Description
+ Stirling-PDF is a FOSS Self-hosted PDF manipulation Web Application that enables you to carry out various operations on PDF files or modify other types into PDF
- Operations include, but not limited to
    + Viewing and Editing directly
    + Splitting PDF
    + Merging PDF
    + Converting file formats
    + Reorganizing
    + Adding Images
    + Rotating
    + Compressing

### Project
+ Author: Stirling-Tools
+ Repository Name: Stirling-PDF
- Repositories
    + GitHub: https://github.com/Stirling-Tools/Stirling-PDF
- Docker Image
    + DockerHub: https://hub.docker.com/r/frooodle/s-pdf

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Create the volume mount points
    ```bash
    mkdir -pv stirling-pdf/{training-data,extra-configs,logs,custom-files}
    ```

### Customization

- docker-compose.yaml
    + Obtain a copy of the docker-compose file from [Templates](#templates)

### Startup Image and container

> Using docker run CLI

- Startup container
    ```bash
    docker run -itd \
        --name "stirling-pdf" \
        --restart=unless-stopped \
        -e DOCKER_ENABLE_SECURITY=false \
        -e INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false \
        -e LANGS=en_GB \
        -p 8080:8080 \
        -v "${PWD}/stirling-pdf/training-data:/usr/share/tessdata" \
        -v "${PWD}/stirling-pdf/extra-configs:/configs" \
        -v "${PWD}/stirling-pdf/logs:/logs" \
        -v "${PWD}/stirling-pdf/custom-files:/customFiles" \
        frooodle/s-pdf:latest
    ```

- Stop and remove container
    ```bash
    docker stop stirling-pdf && docker rm stirling-pdf
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
> Docker
- `DOCKER_ENABLE_SECURITY={false|true}` : Enable/Disable downloading of security jar (required for authentication login)

> WebUI
- `SYSTEM_CONNECTIONTIMEOUTMINUTES=[connection-timeout-minutes]` : Set the custom connection timeout value (in minutes)
- `SYSTEM_ROOTURIPATH=[application-root-uri]` : Specify a custom path to set as the Web Application's Root URI (the route to the filesystem location/path containing the directory to set as the root path; i.e. Setting '/pdf-app' will set the Root URI to `[server-ip-address|domain]:[server-port]/pdf-app`)

> Stirling-PDF PDF Format Conversion
- `INSTALL_BOOK_AND_ADVANCED_HTML_OPS={false|true}` : Enable/Disable Download Calibre onto Stirling-PDF to enable PDF to/from book and advanced HTML conversion

> Documents
- `LANGS=[language-code]` : Define custom font libraries to install for document conversions

### Network Ports
- 8080 : HTTP WebUI Port

#### Volumes
- / : Root filesystem directory
    - configs/ : Contains Extra Configurations for Stirling-PDF
    - logs/ : Contains Stirling-PDF Log files
    - customFiles/ : Contains custom configuration files 
    - usr/ : Contains the user data files
        - share/
            - tessdata/ : Contains OCI training data

### Templates

> docker-compose.yaml

```yaml
# docker compose config file for Stirling-PDF
version: "3.7"
services:
  stirling-pdf:
    image: frooodle/s-pdf:latest
    container_name: "stirling-pdf"
    restart: unless-stopped
    environment:
      ## Pass Environment Variables into container runtime
      - DOCKER_ENABLE_SECURITY=false # Enable/Disable downloading of security jar (required for authentication login)
      - INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false # Download Calibre onto Stirling-PDF to enable PDF to/from book and advanced HTML conversion
      - LANGS=en_GB # Define custom font libraries to install for document conversions
    ports:
      ## Port Forward/Translate/Map host system to container
      ## [host-system-ip-address]:[host-system-port]:[container-port]
      - 8080:8080 # HTTP WebUI
    volumes:
      ## Mount volume from host system to container
      ## [host-system-volume]:[container-volume]:[permission]
      - "${PWD}/stirling-pdf/training-data:/usr/share/tessdata"
      - "${PWD}/stirling-pdf/extra-configs:/configs"
      - "${PWD}/stirling-pdf/logs:/logs"
      ### Optional Customization (Not Required)
      - "${PWD}/stirling-pdf/custom-files:/customFiles"
```

## Wiki

## Resources

## References
+ [GitHub - Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF)

## Remarks

