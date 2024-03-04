# NixOS - Nix Package Manager

## Information
### Introduction
```
The Nix Package Manager is a standalone package manager that uses declarative configuration and containerization to create reproducibility and portability.

NixOS is a free and open-source Linux distribution based on the purely functional Nix package manager. 

NixOS is composed using modules and packages defined in the nixpkgs project and uses an immutable design and an atomic update model. 
    - Its use of a declarative configuration allows reproducibility and portability.

By just importing any configuration file(s) you wish to reproduce,
    - You will be able to convert your system into that configuration
```

### Project
- Github: 
    + Official repository: https://github.com/NixOS/nix
    + Community-managed docker image repository (uses Rootfs): https://github.com/nix-community/docker-nixpkgs)
    + Nix Packages: https://github.com/NixOS/nixpkgs
    + NixOS Hardware Repository: https://github.com/NixOS/nixos-hardware
    + NixOS Installation Tools: github.com/NixOS/nixos-install-tools

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
- Build Essentials
    + apt : build-essential
    + pacman : base-devel

#### Pre-Requisites

#### Build from Source

#### Installation
- Multi-user Installation (Recommended)
    - Explanation
        - Pros
            + Better build isolation (and that is what Nix is all about)
            + Better security (a build can not write somewhere in your home)
            + Sharing builds between users
        - Cons
            + Requires root to run the daemon
            + More involved installation (creation of nixbld* users, installing a systemd unit, ...
            + Harder to uninstall
    - Multi-step (Recommended)
        - Download install script
            ```bash
            curl -L https://nixos.org/nix/install
            ```
        - (Optional - Recommended) Read the install script
            ```bash
            cat install
            ```
        - Install as daemon
            ```bash
            sh install --daemon
            ```
    - All-in-One
        ```bash
        sh <(curl -L https://nixos.org/nix/install) --daemon
        ```

- Single-user Installation
    - Explanation
        - This will perform a single-user installation of Nix, meaning that /nix is owned by the invoking user. 
            + You should run this under your usual user account, not as root. 
            + The script will invoke sudo to create /nix if it doesn’t already exist.
    - Multi-step 
        - Download install script
            ```bash
            curl -L https://nixos.org/nix/install
            ```
        - (Optional - Recommended) Read the install script
            ```bash
            cat install
            ```
        - Install as daemon
            ```bash
            sh install --no-daemon
            ```
    - All-in-One
        ```bash
        sh <(curl -L https://nixos.org/nix/install) --no-daemon
        ```

### Installation via Docker
#### Container
- Docker Repository:
    - Docker Hub: 
        + [nixos/nix](https://hub.docker.com/r/nixos/nix/) : Official docker image (uses BusyBox)
        + [nixpkgs/nix](https://hub.docker.com/r/nixpkgs/nix) : Community-managed docker image repository (uses Rootfs)

#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites
- Obtaining source code repository
    - Clone repository
        ```bash
        git clone --depth=1 github.com/NixOS/nixpkgs.git
        ```

    - Change directory into repository
        ```bash
        cd nixpkgs
        ```

#### Using docker run
##### Official nix image (uses BusyBox)
- Starting up
    - Nix
        ```console
        docker run -itd --name=nix \
            --restart=unless-stopped \
            -v /path/to/nixpkgs:/nixpkgs \
            -v /path/to/workdir:/workdir \
            nixos/nix:[tag]
        ```

- Teardown/Shutdown
    ```console
    docker container stop nix && docker container rm nix
    ```

- Start a stopped container
    ```console
    docker container start nix
    ```

- Stop a running container
    ```console
    docker container stop nix
    ```

- Restart a running container
    ```console
    docker container restart nix
    ```

##### Community-managed image (uses rootfs)
- Startup ['nixpkgs/nix:latest'](https://hub.docker.com/r/nixpkgs/nix) docker container
    ```bash
    docker run -itd --name=nix \
        --restart=unless-stopped \
        --privileged \
        -v /path/to/workdir:/workdir \
        -v [root-mount-point]:[root-mount-point] \
        nixpkgs/nix:[tag|version]
    ```

- Enter the nix container
    ```bash
    docker exec -it nix /bin/sh
    ```

- Add nix channel
    ```bash
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    ```

- Verify channel
    ```bash
    nix-channel --list
    ```

- Update channel
    ```bash
    nix-channel --update
    ```

- Set environment variable 'NIX_PATH'
    ```bash
    export NIX_PATH="nixpkgs=channel:nixos-[nixos-version]"
    ```

#### Using docker-compose
- Prepare
    + Please refer to [Template - docker compose](#docker-compose) for more information

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
    docker-compose start nix
    ```

- Stop a running container
    ```console
    docker-compose stop nix
    ```

- Restart a running container
    ```console
    docker-compose restart nix
    ```

- To execute a command in the container
    ```console
    docker exec -it nix [command] {options} <arguments>
    ```

### Accessing
- Enter the Nix container shell
    ```console
    docker exec -it nix /bin/sh {options} <arguments>
    ```

## Documentations
### Tools
- nix

### Synopsis/Syntax
- nix
    - Default
        ```bash
        nix {options} <arguments>
        ```

### Parameters
#### nix
- Positionals
- Optionals
    - With Arguments
    - Flags

### Usage

## Wiki
### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping

### Filesystem Structure
#### Folders
+ /nixpkgs : Nix Package Development directory
+ /workdir : General working directory

#### Files

### Docker mappings
#### Default Volumes
+ /path/to/nixpkgs:/nixpkgs : Nix Package Development directory
+ /path/to/workdir:/workdir : General working directory

### Templates
#### docker compose
- Nix Package Manager (official - uses BusyBox)
    ```yaml
    version: "3.7"
    services:
      nix:
        image: nixos/nix:latest
        container_name: nix
        restart: unless-stopped
        tty: true
        stdin_open: true
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - ${PWD}/workdir:/workdir
    ```

- Nix (community-managed - uses Rootfs)
    ```yaml
    version: "3.7"
    services:
      nix:
        image: nixpkgs/nix:latest
        container_name: nix
        restart: unless-stopped
        tty: true
        stdin_open: true
        volumes:
          ## Mount volumes from host system into container
          ## [host-system-volume]:[container-volume]:[permissions]
          - ${PWD}/workdir:/workdir
    ```

### Notes and Findings
#### Error Messages

#### Things to note
- NixOS (or Nix-related system operations) wont run properly on docker (without --privileged or the likes) because it requires systemd
    - So functionalities like
        + Base/Root Filesystem Bootstrap Installation via nixos-install
    + will not work properly without '--privileged' passed into 'docker run', or 'privileged: true' set in docker-compose.yaml

## Resources

## References
+ [ArchWiki - Nix](https://wiki.archlinux.org/title/Nix)
+ [NixOS - Download](https://nixos.org/download)
+ [NixOS - Download - Docker](https://nixos.org/download#nix-install-docker)
+ [NixOS - Wiki - Bootstrap utility](https://nixos.wiki/wiki/Nixos-generate-config)
+ [NixOS - Wiki - Docker](https://nixos.wiki/wiki/Docker)
+ [NixOS - Manual - Nix - Stable - Installation - Multi-user](https://nixos.org/manual/nix/stable/installation/multi-user)
+ [NixOS - Manual - Nix - Stable - Installation - Single-user](https://nixos.org/manual/nix/stable/installation/single-user)
+ [Nix Packages Search](https://search.nixos.org/)

## Remarks

