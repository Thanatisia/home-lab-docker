# Draw-IO

## Information
### Background
```
Self-hosted implementation of the online UML drawing utility of the same name

Draw-IO is a web diagram drawing utility that allows you to plot and draw various diagrams, such as
    - Network Design Diagram
    - Unified Modelling Language (UML)
        - Use Case Diagram
        - Activity Diagram
        - Class Diagram
        - Sequence Diagram
        - Database Diagram
        - etc etc.
    - ERP Diagram
```

### Project/Service
+ Author: jgraph
+ Service: draw-io
+ Docker images: jgraph/drawio
- Repositories:
    + GitHub: https://github.com/jgraph/drawio
    + DockerHub: https://hub.docker.com/jgraph/drawio

## Setup
### Dependencies
- If using Docker
    + docker
    + docker-compose

- If hosting on bare metal
    + TBC

### Pre-Requisites

### Initial setup

### Docker run
- Starting up 
    ```console
    docker run -itd --name="draw-io" -p "8080:8080" -p "8443:8443" jgraph/drawio
    ```

- Start a stopped instance
    ```console
    docker container start draw-io
    ```

- Stop a running instance
    ```console
    docker container stop draw-io
    ```

- Restart service container
    ```console
    docker container restart draw-io
    ```

- Tear/shut down
    ```console
    docker container stop draw-io && docker container rm draw-io
    ```

- Enter container
    ```console
    docker exec {-u [user]} -it draw-io [commands ...]
    ```

### Docker-compose
- Starting up 
    ```console
    docker-compose up -d 
    ```

- Start a stopped instance
    ```console
    docker-compose start draw-io
    ```

- Stop a running instance
    ```console
    docker-compose stop draw-io
    ```

- Restart service container
    ```console
    docker-compose restart draw-io
    ```

- Tear/shut down
    ```console
    docker-compose down
    ```

- Enter container
    ```console
    docker exec {-u [user]} -it draw-io [commands ...]
    ```

## Documentations

### Environment Variables
- General
    + DRAWIO_BASE_URL    : Your deployment base URL. For example, https://drawio.example.com or https://www.example.com/drawio if it is deployed into a folder.
    + DRAWIO_CSP_HEADER  : (Optional) Your website Content-Security-Policy if you want to customize it.
    + DRAWIO_VIEWER_URL  : (Optional) If you want to host a draw.io viewer also, set the viewer URL. For example, https://drawio.example.com/js/viewer.min.js
    + DRAWIO_LIGHTBOX_URL: (Optional) If you want to host a draw.io viewer also, set the lightbox URL. For example, https://drawio.example.com
    + DRAWIO_CONFIG      : (Optional) draw.io configuration JSON. Documentation
    + DRAWIO_USE_HTTP    : (Optional and INSECURE) If your setup uses http only and you understand the risks (for example, sending OAuth tokens over http), set DRAWIO_USE_HTTP=1. Caution: Use at your own risk.

## Wiki

## Configurations
### Networking
- Ports used
  + 8080: HTTP WebUI
  + 8443: HTTPS WebUI

### Docker
```
The following is assuming you are self-hosting on a docker instance
```
- Important files
    + $CATALINA_HOME/webapps/draw/js/PreConfig.js : This configuration file contains all the pre-setup environment and configuration variables; Read this to get all the extra configurations related to external support (i.e. Google Drive)

## Resources

## References

## Remarks

