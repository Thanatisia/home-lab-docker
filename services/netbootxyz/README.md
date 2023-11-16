# netboot.xyz

## Information
### Project
- Project Authors
    + netbootxyz: Official
    + linuxserver
+ Project Name: netbootxyz
- Repositories:
    - GitHub: 
        + linuxserver: https://github.com/linuxserver/docker-netbootxyz
        + Main: https://github.com/netbootxyz/netboot.xyz
    - Container Repositories
        - Dockerhub
            + linuxserver : https://hub.docker.com/r/linuxserver/netbootxyz
            + netbootxyz (Official) : https://hub.docker.com/r/netbootxyz/netbootxyz
        - ghcr
            + netbootxyz : ghcr.io/netbootxyz/netbootxyz:latest
        - lscr
            + linuxserver: lscr.io/linuxserver/netbootxyz:latest

### Background
```
A PXE Network boot loader/service that lets you install or boot to any operating system simply by booting to the network
```

### Supported Architectures
+ x86-64: linux/amd64
+ ARM64 : linux/arm64v8

### Docker Design
- Docker image will spin up
    + TFTP Server : Used to transfer the boot files to the devices when the target network boot machine starts up and requests to PXE Network boot

## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git

### Pre-Requisites
- Create folders
    - netbootxyz/ : The root folder
        + assets/
        + config/

- Prepare Netboot.xyz interfaces
    - If using USB
        + Download .iso/.img files
    - If using DHCP server (No physical media, directly PXE Network boot from the network)
        + Change the TFTP server IP address in your Network Router/Modem to the IP address of the host running the Netboot.xyz server
    - Pihole
        - via DHCP server
            - To Enable TFTP server
                - Edit/Create the '99-pxe.conf' file in '/etc/dnsmasq.d' directory
                    - Append the following contents
                        ```
                        # Enable dnsmasq's built-in TFTP server
                        enable-tftp

                        # Set the root directory for files available via FTP.
                        tftp-root=/var/ftpd

                        # Do not abort if the tftp-root is unavailable
                        tftp-no-fail

                        # Make the TFTP server more secure: with this set, only files owned by the user dnsmasq is running as will be send over the net.
                        tftp-secure

                        # This option stops dnsmasq from negotiating a larger blocksize for TFTP transfers. 
                        # It will slow things down, but may rescue some broken TFTP clients.
                        tftp-no-blocksize
                        ```
                - Create a new file '10-TFTP.conf' in '/etc/dnsmasq.d'
                    - Append the DHCP options to enable PXE Network Booting
                        ```console
                        interface=[ethernet-network-interface (i.e. eth1)]
                        dhcp-option=66,"[ip-address-of-tftp-server]"
                        dhcp-boot=pxelinux/pxelinux.0,[ip-address-of-tftp-server]
                        enable-tftp
                        tftp-root=/var/lib/tftpboot
                        ```
                - Restart dnsmasq daemon
                    ```console
                    sudo systemctl restart dnsmasq
                    ```

### Clone the repository
```console
git clone https://github.com/netbootxyz/netboot.xyz
```

### Change directory into repository
```console
cd netbootxyz
```

### Build from Source
- Docker
    - Default
        ```console
        docker build -t localbuild -f Dockerfile .
        ```
    - Deploy
        ```console
        docker run --rm -it -v $(pwd):/buildout localbuild
        ```

## Documentation

### Start
#### Using docker run
- Starting up netboot WebUI
    - Using linuxserver
        ```console
        docker run -d \
          --name=netbootxyz \
          -e PUID=1000 \
          -e PGID=1000 \
          -e TZ=Etc/UTC \
          -e MENU_VERSION=1.9.9 `#optional` \
          -e PORT_RANGE=30000:30010 `#optional` \
          -e SUBFOLDER=/ `#optional` \
          -p 3000:3000 \
          -p 69:69/udp \
          -p 8080:80 `#optional` \
          -v /path/to/config:/config \
          -v /path/to/assets:/assets `#optional` \
          --restart unless-stopped \
          lscr.io/linuxserver/netbootxyz:latest
        ```
    - Using official netbootxyz
        ```console
        docker run -d \
          --name=netbootxyz \
          -e MENU_VERSION=2.0.59             `# optional` \
          -p 3000:3000                       `# sets webapp port` \
          -p 69:69/udp                       `# sets tftp port` \
          -p 8080:80                         `# optional` \
          -v /local/path/to/config:/config   `# optional` \
          -v /local/path/to/assets:/assets   `# optional` \
          --restart unless-stopped \
          ghcr.io/netbootxyz/netbootxyz
        ```

- Teardown/Shutdown
    ```console
    docker container stop netbootxyz && docker container rm netbootxyz
    ```

- Start a stopped container
    ```console
    docker container start netbootxyz
    ```

- Stop a running container
    ```console
    docker container stop netbootxyz
    ```

- Restart a running container
    ```console
    docker container restart netbootxyz
    ```

#### Using docker-compose
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
    docker-compose start netbootxyz
    ```

- Stop a running container
    ```console
    docker-compose stop netbootxyz
    ```

- Restart a running container
    ```console
    docker-compose restart netbootxyz
    ```

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
- assets/ : PXE Bootloader asset and resource files
- config/ : PXE Bootloader Configuration files

#### Container Volume Mount Points
+ `/path/to/assets:/assets` : PXE Bootloader asset and resource files
+ `/path/to/config:/config` : PXE Bootloader Configuration files

#### docker-compose configuration
- linuxserver
    ```yaml
version: "3.7"
services:
  netbootxyz:
    image: lscr.io/linuxserver/netbootxyz:latest
    container_name: netbootxyz
    restart: unless-stopped
    environment:
      ## Set Environment Variables
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      # - MENU_VERSION=1.9.9 # Optional
      # - PORT_RANGE=30000:30010 # Optional
      # - SUBFOLDER=/ # Optional
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permission]
      - "${PWD}/netbootxyz/config:/config"
      - "${PWD}/netbootxyz/assets:/assets" # Optional
    ports:
      ## Port Forward/Translate/Map from Host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - "3000:3000"
      - "69:69/udp"
      - "8080:80" # Optional
    ```

- Official netbootxyz
    ```yaml
version: "3.7"
services:
  netbootxyz:
    image: ghcr.io/netbootxyz/netbootxyz:latest
    container_name: netbootxyz
    restart: unless-stopped
    environment:
      ## Set Environment Variables
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      # - MENU_VERSION=1.9.9 # Optional
      # - PORT_RANGE=30000:30010 # Optional
      # - SUBFOLDER=/ # Optional
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permission]
      - "${PWD}/netbootxyz/config:/config"
      - "${PWD}/netbootxyz/assets:/assets" # Optional
    ports:
      ## Port Forward/Translate/Map from Host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - "3000:3000"
      - "69:69/udp"
      - "8080:80" # Optional
      ```

### Networking
#### Ports
+ 3000 : For the Netboot.xyz configuration webapp
+ 69 : For the PXE Network Bootloading
+ 80 : For the HTTP WebUI

## Resources

## References
+ [linuxserver Documentations - Images - Netboot.xyz docker](https://docs.linuxserver.io/images/docker-netbootxyz/)
+ [Netbeez - blog - Read-only TFTP server using dnsmasq](https://netbeez.net/blog/read-only-tftp-dnsmasq/)
+ [Netboot.xyz Documentations](https://netboot.xyz/docs/)
+ [Netboot.xyz Documentations - Docker](https://netboot.xyz/docs/docker/)
+ [Netboot.xyz Documentations - Booting - USB](https://netboot.xyz/docs/booting/usb/)
+ [OpenMediaVault Forums - How to configure PXE if using pihole docker and pihole DHCP](https://forum.openmediavault.org/index.php?thread/25826-howto-configure-pxe-if-use-pi-hole-docker-and-pi-hole-dhcp/)
+ [Oracle Docs - Configuring dnsmasq to support PXE clients](https://docs.oracle.com/en/operating-systems/oracle-linux/6/install/ol-dnsmasq-conf.html)
+ [Techno Tim Blog - Posts - Netboot.xyz Tutorial](https://technotim.live/posts/netbootxyz-tutorial/)
+ [YouTube - Techno Tim - Meet netboot.xyz - Network Boot Any Operating System](https://www.youtube.com/watch?v=4btW5x_clpg)

## Remarks
