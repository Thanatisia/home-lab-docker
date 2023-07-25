# Minecraft Server

## Information
### Project
+ Project Author: itzg
+ Project Name: minecraft-server
- Repositories
    + GitHub: https://itzg/docker-minecraft-server
    - DockerHub:

## Setup

### Dependencies
+ docker
+ docker-compose

### Pre-Requisites

### Using docker run
- Starting up
    ```console
    docker run -itd --name=minecraft-server -p "25565:25565" -e "EULA=true" -v "./data:/data" itzg/minecraft-server
    ```

- Teardown/Shutdown
    ```console
    docker container stop minecraft-server && docker container rm minecraft-server
    ```

- Start a stopped container
    ```console
    docker container start minecraft-server
    ```

- Stop a running container
    ```console
    docker container stop minecraft-server
    ```

- Restart a running container
    ```console
    docker container restart minecraft-server
    ```

### Using docker-compose
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
    docker-compose start minecraft-server
    ```

- Stop a running container
    ```console
    docker-compose stop minecraft-server
    ```

- Restart a running container
    ```console
    docker-compose restart minecraft-server
    ```

## Documentation

### Migration
- When migrating the minecraft server (General, regardless of docker or bare metal)
    + Stop the server
    + Backup Mount folder
    + Migrate accordingly
    + Start the server and test recovery
    + Perform initial checkup

## Wiki

### Customization/Configuration
#### Environment Variables
+ EULA=[true|false] : Enable/Disable auto-Accept EULA

#### Networking
- Ports
    + 25565

#### Project Filesystem structure
+ Container's data path: /data

## Resources

## References
+ [Minecraft Server Docker Docs](https://docker-minecraft-server.readthedocs.io/en/latest/)

## Remarks

