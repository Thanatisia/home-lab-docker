# Personal Home Lab/Self-Hosting Server using docker-compose

## Information
### DESCRIPTION
```
	EVERYTHING MUST BE CONTAINERIZED!
	Dotfiles, Configurations, Installers

just joking, I am just playing around with containerizing my self-host setup (traditionally install on bare metal).
```

### Notes
- Do note that the following applications may have issues running on docker due to reasons such as incompatibility with the architecture (possible reasons will be specified below).
    - Services
        + pi-hole : Incompatible with ARMv6 - container will keep stopping and running/restarting; only ARMv7 and above, AMD64, x86_64 etc.
        + hwdsl2  : Incompatible with ARMv6 - container will keep stopping and running/restarting; only ARMv7 and above, AMD64, x86_64 etc.

### Quickstart Guide
#### Folders
+ files
    ```
    Contains various combination/types of services and/or groups of services together based on the combinations in a single docker-compose environment. 
    - Examples
	    + NAS File Server : Samba, Jellyfin
	    + Network Server : ipsec vpn server, pihole
    ```
+ production
    ```This is where all the production-ready and tested docker-compose environment as well as Dockerfiles and dependencies are stored. 
    - This folder is essentially a plug-and-play (for me, at least) docker-compose environment template for self-hosting with either ARM(64)v7 and above devices, as well as general AMD64/x86 devices.
        + Similar to a dotfile repository, this is so that I can easily deploy these environments into my server production with just a single clone.
    - I have already tested on my ArchLinux Virtual Machine docker Testbench, 
        + thus, you just need to change the variables and 
        + are ready to be deployed in a real production server environment.
    - [Security] 
        + The files you see here have all been sanitized such that sensitive information in files, environment variables are all replaced with skeleton text to explain what to input, and are all safe for referral and usage as a template.
        + Always ensure that security and private information such as public IP address (if any), usernames and passwords, credentials etc are erased from your open source configs if you are pushing it to any remote git repository server.
        + Always Remember to read the code before deployment.
    ```
+ services
    ```
    This folder contains subfolders for every individual services that holds Dockerfiles, docker-compose environment files and dependencies to startup that specific service individually. 
    ```
    - Note: 
        + This folder is entirely surrounding starting up the service via docker, thus, please refer to the official documentation and/or (shameless plug starts) my guides for that server utility at [SharedSpace](https://github.com/Thanatisia/SharedSpace) if available (shameless plug end.) if you want to install the system on bare metal.

## Setup
### Pre-Requisites
- If using on a Hypervisor
    - VirtualBox
        + Setup NATNetwork for inter-vm network communication
        + Add a new Bridge network adapter in the network of the server Virtual Machine

### Dependencies
+ docker : for...docker and dockerfile
+ docker-compose : for running docker-compose

## Services I am using
```
The following are some services i'm using at the moment.

You can use this template if you would like to make your own
```
+ code-server : VS Code Server
+ guacamole : Remote Access Gateway
+ heimdall : Dashboard
- IPSec VPN Server
    - Libreswan + xl2tpd (L2TP Daemon)
        + hwdsl2
+ jellyfin : Media Server
- NAS File Server
    - Samba
        - My Samba uses the following pre-requisites
            + Image: Alpine Linux
	- Reasons
	    + Lightweight
+ pi-hole : DNS Server (Resolver), DNS Sinkhole, Firewall, Router

## Documentation
### Code Server
- [VS Code Server](services/code-server)
    - [docker-compose](services/code-server/docker-compose.yaml)
        
### Dashboard
- Heimdall
    - docker-compose

### IPSec VPN Server
#### Libreswan + xl2tpd
- [hwdsl2](services/ipsec-vpn-server/hwdsl2)
    - [docker-compose.yaml](services/ipsec-vpn-server/hwdsl2/docker-compose.yaml)

### Media Server
- [jellyfin](services/jellyfin)
    - [docker-compose.yaml](services/jellyfin/docker-compose.yaml)

### NAS File Server
- [Samba](services/samba-file-server)
    - [docker-compose.yaml](services/samba-file-server/docker-compose.yaml)
    - [Dockerfile](services/samba-file-server/samba/Dockerfile)

### DNS Server
- pi-hole
    - [docker-compose.yaml](services/pi-hole/docker-compose.yaml)
       

## Usage
- Startup docker-compose environment with building of Dockerfiles
    - Notes
        + Certain docker containers (i.e. my samba share) are built from scratch using Dockerfile and docker-compose, thus you need to run build
    ```console
    docker-compose up -d --build
    ```

- Startup docker-compose environment
    ```console
    docker-compose up -d {container-name(s)}
    ```

- Teardown docker-compose environment
    ```console
    docker-compose down
    ```

- Stop docker-compose environment
    ```console
    docker-compose stop {container-name(s)}
    ```

- Start docker-compose environment
    ```console
    docker-compose start {container-name(s)}
    ```

- Restart docker-compose environment
    + Leaving 'container-name' empty will restart all containers in the compose environment
    ```console
    docker-compose restart [container-name]
    ```

- Check Error Logs
    + Generally you will want to do this if the container keeps restarting
    ```console
    docker logs [container-name]
    ```

- Jump into container
    + Useful for checking container files for clues
    ```console
    docker exec -it [container-name] /bin/bash
    ```

- Restart only a specific container
    + Perhaps, to refresh your server after changing a config
    ```console
    docker container restart [container-name]
    ```

- Execute command in container and get standard output (stdout)
    ```console
    docker exec -t [container-name] /bin/bash -c "[your-command]"
    ```

## Wiki
