# Dashboard - Homepage

## Information
### Background
+ A highly customizable homepage (or startpage / application dashboard) Web Application with Docker and service API integrations.

### Project
+ Repository URL: https://github.com/gethomepage/homepage
+ Marketing Page: https://gethomepage.dev
- Docker Image Repositories:
    + GitHub Container Repository: ghcr.io/gethomepage/homepage

## Setup
### Dependencies
+ docker
+ docker-compose
### Pre-Requisites
- node >= 18
- python
- make
- Build/Development tools
    - build-essential : for apt
    - base-devel : for pacman

### Clone repository
- Using git
    ```console
    git clone https://github.com/gethomepage/homepage.git
    ```

### Install Dependencies
- using pnpm
    ```console
    pnpm install
    ```

### Build from Source
- using pnpm
    ```console
    pnpm build
    ```

### Start server
- using pnpm
    - Production mode
        ```console
        pnpm start
        ```
    - Development mode
        ```console
        pnpm start
        ```

### Accessing
- To access the Web-SSH browser
    - HTTP
        - Default
            + Open `http://[target-ssh-hostname|ip-address]:3000/wetty`
        - To specify the user beforehand
            + Open `http://[target-ssh-hostname|ip-address]:3000/wetty/ssh/<username>`

## Documentations

### Docker
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=homepage \
        --restart=unless-stopped \
        -e PUID=1000 \
        -e PGID=1000 \
        -p "3000:3000" \
        -v "/path/to/config:/app/config \
        -v "/var/run/docker.sock:/var/run/docker.sock:ro" \
        ghcr.io/gethomepage/homepage:latest
    ```

- Teardown/Shutdown
    ```console
    docker container stop homepage && docker container rm homepage
    ```

- Start a stopped container
    ```console
    docker container start homepage
    ```

- Stop a running container
    ```console
    docker container stop homepage
    ```

- Restart a running container
    ```console
    docker container restart homepage
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
    docker-compose start homepage
    ```

- Stop a running container
    ```console
    docker-compose stop homepage
    ```

- Restart a running container
    ```console
    docker-compose restart homepage
    ```

### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping
+ 3000 : HTTP WebUI

### Customization
#### Table of Contents
- [Bookmarks](#bookmarks)
    - [Information](#bookmark-information)
    - [Components](#bookmark-components)
    - [Structure](#bookmark-structure)
- [Services](#services)
    - [Information](#services-information)
    - [Components](#services-components)
    - [Structure](#services-structure)
- [Widgets](#widgets)
    - [Information](#widgets-information)
    - [Components](#widgets-components)
    - [Structure](#widgets-structure)

#### Bookmarks
##### Bookmark Information
- The bookmark section is a list containing URLs and pages
    - Separated into sections, each bookmark 'section' are categorized under a header so that at a glance, 
        + you can figure out what that bookmark bar

- For more information configuration options and examples, please refer to [Documentations - Bookmarks](https://gethomepage.dev/latest/configs/bookmarks)

##### Bookmark Components
- The bookmarks configuration file (/app/data/bookmarks.yaml) consists of the following simple components
    - [Bookmark-Header-Name] : This is the header name for this current bookmark list
        - [Bookmark-Entry-Name] : This is all the entries that you wish to place under this list
            - Option Key-Values:
                - `abbr : [Bookmark-Entry-Abbreviation (Short form/alias)]` : Specify the abbreviation/short form aliases for this entry
                - `href : [Hyperlink Reference (aka URL)]` : Specify the Hyperlink Refeerence (URL) for this entry

##### Bookmark Structure
```yaml
- [Bookmark-Header-Name]
    - [Bookmark-Entry-Name]
        - abbr : [Bookmark-Entry-Abbreviation (Short form/alias)]
          href : [Hyperlink Reference (aka URL)]
```

#### Services
##### Services Information
- The services section is a list containing all your applications and services
    - Separated into groups, every group will contain your application/services entries and metadata for the entries, such as
        - hyperlink URL to the application
        - description of the application

- For more information configuration options and examples, please refer to [Documentations - Services](https://gethomepage.dev/latest/configs/services)

##### Services Components
- The configuration file (/app/data/services.yaml) consists of the following simple components
    - [Group-Name] : This is the name of the current group
        - [Application/Services-Name] : This is the name of all the applications that you wish to place under this list
            - Option Key-Values:
                - `href : [WebApplication-service-URL]` : Specify the hyperlink URL of the Web Application
                - `description : [Description]` : Specify a description for this application

##### Services Structure
```yaml
- [Group-Name]
    - [Application-Name]
        - href: [application-URL]
          description: Your Application's Description
```

#### Widgets
##### Widgets Information
- This is a list containing all the add-on widgets that you can display on the Dashboard
    - Widgets are separated into categories
        + resources : Widgets related to system information displays
        + search : Widgets related to the search bar

- For more information configuration options and examples, please refer to [Documentations - Service Widgets](https://gethomepage.dev/latest/configs/service-widgets)

##### Widgets Components
- [category] : Specify the category of the widgets
    - Category Key-Values
        - resources : Widgets related to system information displays
            + `cpu: true|false` : Enable/Disable CPU monitoring and information display
            + `memory: true|false` : Enable/Disable RAM (Memory) monitoring and information display
            + `disk: [disk-directory]` : Specify the directory/folder to monitor disk storage space
        - search : Widgets related to the search bar
            - `provider: [Search Engine Provider]` : Specify the Search Engine Provider to use to search with (i.e. duckduckgo, google)
            - `target: [search-engine-target-URL]` : Specify the URL of the Search Engine to automatically search with
                - Default: '_blank'

##### Widgets Structure
```yaml
- resources:
    cpu: true
    memory: true
    disk: /

- search:
    ## Search Engine settings
    provider: [Search Engine Provider (i.e. duckduckgo/google)]
    target: [Search Engine URL (i.e. duckduckgo.com/?q= | google.com/?=)]
```

## Wiki

### Filesystem Structure
#### Folders
- /app/ : The primary applications directory
    - data/ : The applications data directory; place your configuratin files here

#### Files 
- /app/data/bookmarks.yaml : Bookmarks configuration file; This is used to customize the bookmarks section of the dashboard
- /app/data/services.yaml : Application services configuration file; This is used to customize the application service groups section of the dashboard
- /app/data/widgets.yaml : Dashboard add-on widgets configuration file; This is used to customize the additional widget settings (i.e. CPU, memory, storage information display) of the dashboard

### Docker mappings
#### Default Volumes
- /path/to/your/application/configurations:/app/config : Make sure your local config directory exists
- /var/run/docker.sock:/var/run/docker.sock : Host system docker socket that contains the current state of the docker instances in the host system; Mount into container so the container knows as well

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: homepage
    ports:
      ## Port Forward/translate/map host system port to container port
      ## [ip-address]:[host-system-port]:[container-port]
      - "3000:3000"
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permissions]
      - "/app/config:/app/config" # Make sure your local config directory exists
      - /var/run/docker.sock:/var/run/docker.sock # (optional) For docker integrations
```

### Notes and Findings
1. The '/var/run/docker.sock' file is the docker socket file
    + The docker socket file is created when docker is installed, and this socket file contains the state of the currently-running docker instance in the host
    + Pass/Mount the docker socket file into the container to access the host system's docker instances even when inside a container
    + You can pass/mount any socket files from the host system into the container to access that application's state

## Resources

## References

## Remarks

