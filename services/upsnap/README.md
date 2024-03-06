# Self-Hosted Wake-on-LAN Web Application - UpSnap

## Information
### Background
+ A simple wake on lan web app written with SvelteKit, Go and PocketBase.

- Features
    + 🚀 One-Click Device Wake-Up Dashboard
    + ⏰ Timed Events via Cron for Automation
    + 🔌 Ping Any Port You Choose
    + 🔍 Discover Devices with Network Scanning (nmap required)
    + 👤 Secured User Management
    + 🌐 i18n support for these languages
    + 🎨 29 Themes
    + 🐳 Docker images for amd64, arm64, arm/v7, arm/v6
    + 🏠 Self-Hostable, No Cloud Bullshit!

### Project
- Repository URL: 
    + [UpSnap Repo](https://github.com/seriousm4x/UpSnap)
- Related Resources
    + [PocketBase Documentations](https://pocketbase.io/docs)

### Container
- Docker Repository:
    + GitHub Container Repository: https://github.com/seriousm4x/UpSnap/pkgs/container/upsnap
- Images:
    + UpSnap: ghcr.io/seriousm4x/upsnap
- Resources and Files:
    + GitHub Docker-compose file: https://github.com/seriousm4x/UpSnap/blob/master/docker-compose.yml

## Setup
### Docker
#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites

#### Using docker run
- Starting up
    - UpSnap
        ```console
        docker run -itd --name=upsnap \
            --restart=unless-stopped \
            --network=host \
            -v ./upsnap/data:/app/pb_data
            ghcr.io/seriousm4x/upsnap:4
        ```

- Teardown/Shutdown
    ```console
    docker container stop upsnap && docker container rm upsnap
    ```

- Start a stopped container
    ```console
    docker container start upsnap
    ```

- Stop a running container
    ```console
    docker container stop upsnap
    ```

- Restart a running container
    ```console
    docker container restart upsnap
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
    docker-compose start upsnap
    ```

- Stop a running container
    ```console
    docker-compose stop upsnap
    ```

- Restart a running container
    ```console
    docker-compose restart upsnap
    ```

### Host Machine
#### Dependencies

#### Pre-Requisites

#### Start server
- Run the binary as root
    ```console
    sudo ./upsnap serve --http=0.0.0.0:8090
    ```

- Run the binary non-root
    ```console
    sudo setcap cap_net_raw=+ep ./upsnap # only once after downloading
    ./upsnap serve --http=0.0.0.0:8090
    ```

### Accessing
- To access the Web-SSH browser
    - HTTP
        - Default
            + Open `http://[server-ip-address]:8090`

## Documentations

### Environment Variables
+ `TZ=Region/City`                   : Set container timezone for cron schedules
+ `UPSNAP_INTERVAL=@every 10s`       : Sets the interval in which the devices are pinged
+ `UPSNAP_SCAN_RANGE=192.168.1.0/24` : Scan range is used for device discovery on local network
+ `UPSNAP_SCAN_TIMEOUT=500ms`        : Scan timeout is nmap's --host-timeout value to wait for devices (https://nmap.org/book/man-performance.html)
+ `UPSNAP_PING_PRIVILEGED=true`      : Set to false if you don't have root user permissions
+ `UPSNAP_WEBSITE_TITLE=Custom name` : Custom website title

### Networking
#### Port Forwarding/Translation/Mapping
+ 8090 : WebUI

## Wiki
### Filesystem Structure
#### Folders
- /app/ : The primary application data directory
    - pb_data/ : PocketBase Data directory

#### Files 


### Docker mappings
#### Default Volumes
- ./upsnap/data:/app/pb_data

### Templates
#### docker compose
```yaml
version: "3"
services:
  upsnap:
    container_name: upsnap
    image: ghcr.io/seriousm4x/upsnap:4
    network_mode: host
    restart: unless-stopped
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permissions]
      - ./upsnap/data:/app/pb_data
    # # To use a non-root user, create the mountpoint first (mkdir data) so that it has the right permission.
    # user: 1000:1000
    # environment:
    #   - TZ=Europe/Berlin # Set container timezone for cron schedules
    #   - UPSNAP_INTERVAL=@every 10s # Sets the interval in which the devices are pinged
    #   - UPSNAP_SCAN_RANGE=192.168.1.0/24 # Scan range is used for device discovery on local network
    #   - UPSNAP_SCAN_TIMEOUT=500ms # Scan timeout is nmap's --host-timeout value to wait for devices (https://nmap.org/book/man-performance.html)
    #   - UPSNAP_PING_PRIVILEGED=true # Set to false if you don't have root user permissions
    #   - UPSNAP_WEBSITE_TITLE=Custom name # Custom website title
    # # dns is used for name resolution during network scan
    # dns:
    #   - 192.18.0.1
    #   - 192.18.0.2
    # # you can change the listen ip:port inside the container like this:
    # entrypoint: /bin/sh -c "./upsnap serve --http 0.0.0.0:5000"
    # healthcheck:
    #   test: curl -fs "http://localhost:5000/api/health" || exit 1
    #   interval: 10s
    # # or install custom packages for shutdown
    # entrypoint: /bin/sh -c "apk update && apk add --no-cache <YOUR_PACKAGE> && rm -rf /var/cache/apk/* && ./upsnap serve --http 0.0.0.0:8090"
```

### Notes and Findings

## Resources

## References
+ [noted - UpSnap: A self-hosted Wake-on-LAN app](https://noted.lol/upsnap-a-self-hosted-wake-on-lan-app/)

## Remarks


