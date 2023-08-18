# ArchiveBox

## Information
### Project
+ Project Author: ArchiveBox
+ Project Name: ArchiveBox
- Repositories:
    + GitHub: https://github.com/ArchiveBox/ArchiveBox
    - DockerHub
        + ArchiveBox: https://hub.docker.com/archiveBox/archiveBox

### Background
```
Open-source self-hosted web archiving solution to collect, save, view sites you want to note/log down

Contains other useful features, such as 
    - Downloading YouTube videos with yt-dlp
```

## Setup
### Dependencies
+ docker
+ docker-compose
- Project
    + chromium / chrome (for screenshots, PDF, DOM HTML, and headless JS scripts)
    + node & npm (for readability, mercury, and singlefile)
    + wget (for plain HTML, static files, and WARC saving)
    + curl (for fetching headers, favicon, and posting to Archive.org)
    + youtube-dl or yt-dlp (for audio, video, and subtitles)
    + git (for cloning git repos)
    - python
        - Frameworks
            + Django

### Pre-Requisites
+ Install Dependencies

### Startup
#### From Bare Metal
- Install archivebox 
    - Using the automatic install script from maintainers
        + Always ensure that you read the source code in the link provided before executing
        ```console
        curl -sSL 'https://get.archivebox.io' | sh
        ```
    - Using Python-PyPI (pip) 
        ```console
        pip3 install archivebox
        ```
    - Using package managers
        - apt-based
            - Add the ArchiveBox repository to your sources
                - On Ubuntu == 20.04, add the sources automatically:
                    ```console
                    sudo apt install software-properties-common
                    sudo add-apt-repository -u ppa:archivebox/archivebox
                    ```
                - On Ubuntu >= 20.10 or <= 19.10, or other Debian-style systems, add the sources manually:
                    ```console
                    echo "deb http://ppa.launchpad.net/archivebox/archivebox/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/archivebox.list
                    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C258F79DCC02E369
                    sudo apt update
                    ```
            - Install the ArchiveBox package using apt
                ```console
                sudo apt install archivebox
                sudo python3 -m pip install --upgrade --ignore-installed archivebox   # pip needed because apt only provides a broken older version of Django
                ```
        - Nix-based
            ```console
            nix-env --install archivebox
            ```

- Initialize your collection in an empty directory before starting up
    ```console
    mkdir -p [collection-folder] && cd [collection-folder]
    archivebox init --setup
    ```

- Create new superuser
    ```console
    archivebox manage createsuperuser
    ```

- Startup Web Server
    + Open 'http(s)://[ip-address]:[port-number]' to view it 
    - Defaults
        + IP Address = 0.0.0.0 | 127.0.0.1 : Set as current IP
        + Port Number = 8000
    ```console
    archivebox server [ip-address]:[port-number]
    ```

#### Using docker run
- Initialize your collection in an empty directory before starting up
    ```console
    docker run -itd --name=archivebox -v $PWD:/data archivebox/archivebox init --setup
    ```

- Starting up
    ```console
    docker run -itd --name=archivebox -p "8000:8000" -v "$PWD:/data" archivebox/archivebox
    ```

- Teardown/Shutdown
    ```console
    docker container stop archivebox && docker container rm archivebox
    ```

- Start a stopped container
    ```console
    docker container start archivebox 
    ```

- Stop a running container
    ```console
    docker container stop archivebox
    ```

- Restart a running container
    ```console
    docker container restart archivebox
    ```

#### Using docker-compose
- Perform initial Setup
    + Safe to run init multiple times 
    + This is also how you update versions
    ```console
    docker-compose run archivebox init --setup 
    ```

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
    docker-compose start archivebox
    ```

- Stop a running container
    ```console
    docker-compose stop archivebox
    ```

- Restart a running container
    ```console
    docker-compose restart archivebox
    ```

## Documentation
### To Note
- As of 2023-08-18 (v0.6.3)
    + Users need to be set as superuser to login (I'm not sure why, but it seems they have not implemented basic non-superuser accounts yet)

### Manage
- Create new superuser
    ```console
    archivebox manage createsuperuser
    ```

- Change user password
    ```console
    archivebox manage changepassword
    ```

- Startup Web server
    + Open 'http(s)://[ip-address]:[port-number]' to view it 
    - Defaults
        + IP Address = 0.0.0.0 | 127.0.0.1 : Set as current IP
        + Port Number = 8000
    ```console
    archivebox server [ip-address]:[port-number]
    ```

### Configure
- Set environment configurations
    ```console
    archivebox config --set [VARIABLE]=value
    ```

### SQL/Python/Filesystem Usages
- Run SQL queries on index 
    ```console
    sqlite3 ./index.sqlite3 
    ```

- Explore the Python API in a REPL
    ```console
    archivebox shell
    ```

- Inspect snapshots on the filesystem 
    ```console
    ls ./archive/*/index.html
    ```

## Wiki
### Customization/Configuration
#### Configuration and Environment Variables
+ TIMEOUT=120                : default: 60    ; add more seconds on slower networks
+ CHECK_SSL_VALIDITY=True    : default: False ; True = allow saving URLs w/ bad SSL
+ SAVE_ARCHIVE_DOT_ORG=False : default: True  ; False = disable Archive.org saving
+ MAX_MEDIA_SIZE=1500m       : default: 750m  ; raise/lower youtubedl output size
+ PUBLIC_INDEX=True     : default: True ; whether anon users can view index
+ PUBLIC_SNAPSHOTS=True : default: True ; whether anon users can view pages
+ PUBLIC_ADD_VIEW=False : default: False; whether anon users can add new URLs

#### Project Filesystem Structure
- /data : Data Folder

#### Container Volume Mount Points
+ "./data:/data" : Mount project data folder

## Resources

## References
+ [ArchiveBox Docs - Configuration](https://docs.archivebox.io/en/master/Configuration.html)

## Remarks
