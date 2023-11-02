# Bookstack

## Information
### Project
+ Project Author: BookStackApp
+ Project Name: BookStack
- Repositories:
    - GitHub: 
        + Main Project: https://github.com/BookStackApp/BookStack
    - Container Repositories
        - GitHub
            + solidnerd docker: https://github.com/solidnerd/docker-bookstack
        - DockerHub:
            + Linuxserver: https://hub.docker.com/r/linuxserver/bookstack

### Background
```
Bookstack is a Documentation/Wiki static site generator platform for storing and organising information and documentation/wiki contents built with PHP & Laravel.
```

### Supported Architectures
- linuxserver
    + x86-64: linux/amd64
    + ARM64 : linux/arm64v8

## Setup
### Dependencies
+ docker
+ docker-compose
+ build-essential (for apt-based) | build-devel (for pacman-based)
+ git
+ MySQL/MariaDB : Relational Database Management server
+ PHP >= 8.0.2 : For installation and maintenance
+ [Composer](https://getcomposer.org/) : For installation and management of PHP dependencies

### Pre-Requisites
- Create folders
    + storage
    - bootstrap/
        + cache
    - public/
        + uploads

- Ensure that the folders are writable by the webserver

- Ensure that the specified MySQL/MariaDB SQL server instance is up and running before starting up

### Clone the repository
```console
git clone https://github.com/BookstackApp/BookStack --branch release --single-branch
```

### Change directory into repository
```console
cd bookstack
```

### Build from Source
- Install dependencies using composer
    ```console
    composer install --no-dev
    ```

- Generate a unique application key
    - In the application root, run
        ```console
        php artisan key:generate
        ```

- Set the web root on your server to point to the BookStack public folder. 
    + This is done with the root setting on Nginx or the DocumentRoot setting on Apache

- Update the database
    ```console
    php artisan migrate
    ```

## Documentation
### Manual
- Manual startup
    - Go to your Bootstack Install
        ```console
        cd /var/www/bookstack
        ```
        
    - Run the CLI server
        ```console
        ./bookstack-system-cli
        ```

- Backup
    + The zip file will be saved to 'storage/backups'
    - Default
        + Default filename format: `bookstack-backup-<year>-<month>-<day>-<time>.zip`
        ```console
        ./bookstack-system-cli backup
        ```
    - Custom filename
        ```console
        ./bookstack-system-cli backup /path/to/output/backup.zip
        ```

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd \
        --name=bookstack \
        --restart=unless-stopped \
        -e PUID=1000 \
        -e PGID=1000 \
        -e TZ=Region/City \
        -e APP_URL=yourbaseurl \
        -e DB_HOST=yourdbhost \
        -e DB_PORT=yourdbport \
        -e DB_USER=yourdbuser \
        -e DB_PASS=yourdbpass \
        -e DB_DATABASE=yourdbname \
        -p 6875:80 \
        -v /path/to/data:/config \
        lscr.io/linuxserver/bookstack:latest
    ```

- Teardown/Shutdown
    ```console
    docker container stop bookstack && docker container rm bookstack
    ```

- Start a stopped container
    ```console
    docker container start bookstack
    ```

- Stop a running container
    ```console
    docker container stop bookstack
    ```

- Restart a running container
    ```console
    docker container restart bookstack
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
    docker-compose start bookstack
    ```

- Stop a running container
    ```console
    docker-compose stop bookstack
    ```

- Restart a running container
    ```console
    docker-compose restart bookstack
    ```

### Post-Installation 
- Application Access
    - Defaults
        + URL: `http://[domain|ip]:[port-number]` (your APP_URL)
        + Username: admin@admin.com
        + Password: password

## Wiki
### Customization/Configuration
#### Environment Variables
+ APP_URL="http://[domain|ip]:[port-number]" : Application URL; location to access
+ DB_HOST="url|ip"      : Set this as the Database host's URL/IP if you are using an external server
+ DB_PORT=3306          : Database port (Default: 3306)
+ DB_USER="db-username" : Database username
+ DB_PASS="db-password" : Database Password
+ DB_DATABASE="db-name" : Database name

#### Project Filesystem Structure
- /config/ : Contains Bookstack configurations
    - www/ : Contains configurations for the Webserver
        - .env : The secrets/environment variable file containing the full list of settings
        - laravel.log : Laravel Log files
        - backups/ : Folder containing backups
        - files/ : Folder containing file uploads
        - images/ : Folder containing images
        - themes/ : Folder containing themes
        - uploads/ : Folder containing all uploads

#### Bookstack File & Directory Paths
+ /config container path => BookStack relative path
+ /config/www/.env => .env
+ /config/www/laravel.log => storage/logs/laravel.log
+ /config/www/backups/ => storage/backups/
+ /config/www/files/ => storage/uploads/files/
+ /config/www/images/ => storage/uploads/images/
+ /config/www/themes/ => themes/
+ /config/www/uploads/ => public/uploads/

#### Configuration file 
- .env file : https://github.com/BookStackApp/BookStack/blob/development/.env.example
- .env complete file : https://github.com/BookStackApp/BookStack/blob/development/.env.example.complete

#### Container Volume Mount Points
+ `/path/to/config:/config` : Contains your dashboard assets (files, configs)

#### docker-compose configuration
- Sample Template
    - Bookstack
        ```yaml
    version: "3.7"
    services:
      bookstack:
        image: lscr.io/linuxserver/bookstack:latest
        container_name: bookstack
        restart: unless-stopped
        environment:
          - PUID=1000
          - PGID=1000
          - APP_URL=http://[domain|ip]:[port-number] # Application URL; location to access
          - DB_HOST="url|ip"  # Set this as the Database host's URL/IP if you are using an external server
          - DB_PORT=3306 # Database port (Default: 3306)
          - DB_USER=<db-username> # Database username
          - DB_PASS=<db-password> # Database Password
          - DB_DATABASE=<db-name> # Database name
        volumes:
          - "/path/to/app/data:/config"
        ports:
          - 80:80
        ```
    - MariaDB
        ```yaml
    mariadb:
        image: lscr.io/linuxserver/mariadb
        container_name: mariadb
        environment:
          - PUID=1000
          - PGID=1000
          - TZ=[Religion]/[City]
          - MYSQL_ROOT_PASSWORD=<yourdbpass> # Database Root Password
          - MYSQL_DATABASE=bookstackapp # Database name
          - MYSQL_USER=bookstack        # Database username
          - MYSQL_PASSWORD=<yourdbpass> # Database user password
        volumes:
          - ./bookstack_db_data:/config
        restart: unless-stopped
        ```

### Networking
#### Ports
+ 80 : The WebUI
+ 3306 : SQL (MySQL/MariaDB RDBMS) default port

## Resources

## References
+ [Bookstack Documentations](https://www.bookstackapp.com/docs/)
+ [Bookstack Documentations - Admin - Filesystem Permissions](https://www.bookstackapp.com/docs/admin/filesystem-permissions/)
+ [Bookstack Documentations - Admin - System CLI](https://www.bookstackapp.com/docs/admin/system-cli/)
+ [Bookstack Documentations - Admin - Installation](https://www.bookstackapp.com/docs/admin/installation/)
+ [noted - bookstack](https://noted.lol/bookstack/)

## Remarks

