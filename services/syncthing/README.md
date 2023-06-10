# Syncthing

## Information
### Project
+ Author: syncthing
+ Name: syncthing
+ URL: https://github.com/syncthing/syncthing

### Image
+ Service Author: linuxserver
+ Service Image: syncthing
- Tags
    + x86_64 : amd64-[version-tag]
    + ARM64  : arm64v8-[version-tag]
    + ARMHF  : arm32v7-[version-tag]
+ URL: https://hub.docker.com/r/linuxserver/syncthing

### Background
```
Self-Hosted decentralized, cross-platform File synchronization service for multiple platforms.

You can synchronize all your files in all your devices together into "nodes", from which you can access all the files and folders you assigned to the respective allowed device(s).
```

### Features
+ Cross-Platform
+ Decentralized
+ Synchronize all files within multiple devices where every device is a node. You can also choose to select which device is able to access what folders, allowing for control over access

### Terminologies
+ devices : Machines that you want to synchronize files with
+ local device : Device you are the moment configuring, viewing status etc
+ remote device : Devices you are assigning the local device to communicate or share files with

## Setup
### Dependencies
+ docker(-ce)
+ docker-compose

### Pre-Requisites
- If you are using docker-compose
    - Edit docker-compose
        - Notes
            - Setting from a file
                + Prepend `FILE__` behind the environment variable
        - Recommended
            - Volumes
                - Syncthing every folder: `[source-path]/var/syncthing:/var/syncthing`
                - Default sync data directory: `[source-path]/var/syncthing/data/sync:/var/syncthing/Sync`
                - Syncthing config folders: `[source-config-path]/var/syncthing/config:/var/syncthing/config`
                - Syncthing data folders: `[source-volume-path]/var/syncthing/data:/var/syncthing/data`
                    - Notes
                        + You can put as many of this as you want
                        - You can rename the data directory to anything you like
                            + The data directory you labelled here is just the path that will be available for mounting when you want to add a folder

    - Check docker-compose status
        ```console
        docker-compose ps
        ```

    - Startup docker-compose
        ```console
        docker-compose up -d
        ```

    - (Optional) To shutdown the service
        ```console
        docker-compose down
        ```

    - (Optional) To stop the service
        ```console
        docker-compose stop syncthing
        ```

    - (Optional) To start the service
        ```console
        docker-compose start syncthing
        ```

### Installation

## Documentation
### Post-Installation
- Visit [HomeKit Secure Video Setup](https://github.com/koush/scrypted/wiki/HomeKit-Secure-Video-Setup) for more information on Accessing and security
    - Access the WebUI Management console at either
        + http://[your-server-ip]:10443
        + http://[your-server-ip]:11080

- Synchronizing folders between devices
    - Minimum Disk Space 
        + Please ensure that the folder/drive which you are mounting the shared drive at has at least >= 1% of the total disk/device space
        + If folder has less than 1% of the total disk/device space, the syncing will stop
        ```
        minimum_space = 0.01 * total_disk_space
        ```

### Android configurations
- File/Folder paths:
    + Internal (Public) Storage : /storage/0/[home-directory]
    + External (Public) MicroSD Card : /storage/[MicroSD card ID]/[directory]

- To change default configuration file path from internal storage to external (MicroSD) card path
    - Go to Syncthing
    - Go to WebUI
    - Edit default configuration
        + Change the path to '/storage/[MicroSD card ID]' (i.e. 9C33-6BBD)

## Wiki

### Settings and Configurations
- Ports
    + Application WebUI : 8384
    + Listening Port (TCP) : 22000
    + Listening Port (UDP) : 22000
    + Protocol Discovery (UDP) : 21027

- Environment Variables
    + Timezone: 'Region/City'
    + PASSWORD: The WebUI Password

- Volume directories
    + Configuration files: [path-to-config]/config
    + Data directory : [path-to-directory]/data{1-n}

## Resources

## References
+ [Docker Compose](https://github.com/syncthing/syncthing/blob/main/README-Docker.md)
+ [Syncthing Documentations - Getting Started](https://docs.syncthing.net/intro/getting-started.html)
+ [YouTube - Learn Linux TV - Syncing your Files Across ALL your Computers via Syncthing](https://www.youtube.com/watch?v=J1bCWv14zYg)

## Remarks

