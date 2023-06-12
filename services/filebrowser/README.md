# Docker-compose for Browser/Web-based file manager: File Browser

## Table of Contents
+ [Information](#information)

## Information
### Background
```
A minimal, open source, self-hosted web/browser-based file manager that will serve the path you specified.

It is also an alternative to cloud services like Dropbox and other web-based file browsers
```

### Service
+ Service Author: filebrowser
+ Service Name: filebrowser
+ URL: https://github.com/filebrowser/filebrowser
+ Docker URL: https://hub.docker.com/r/filebrowser/filebrowser

## Setup
- Pre-Requisites
    - Create your directories to mount as volumes
        - Create a SQLite database file "filebrowser.db" in your data directory
            - Note: 
                + The database must be created before you startup the service
                + You can create a SQLite database file of any name, but it must be the same file that you mounted in the docker-compose
            ```console
            touch /path/to/data/directory/filebrowser.db
            ```
    - Edit your docker-compose accordingly
        + Mount serving directory to '/srv'
        + Mount data directory to '/data'

- Starting up
    3. Check your docker-compose
        ```console
        docker ps
        ```
    4. Try to startup docker-compose
        ```console
        docker-compose up
        ```
    5. Startup docker-compose
        ```console
        docker-compose up -d {--force-recreate}
        ```

## Documentations

## Configuration
- Database Method: SQLite

- Project/Container folder structure
    + /srv : The folder path that you want to serve to the browser
    + /database.db # Store the SQLite DB file

- Service Specifications
    - Ports 
        + 80 : For HTTP browsing
        + 443 : For HTTPS browsing

- Default credentials
    - Admin
        + Username: admin
        + Password: admin

## Wiki 
### Terminologies
+ Scope : The scope is where you specify the folder/paths that the user can see, starting the root ('.'). With the scope set, the user can only see the file/folders created within their "Scope"

### Tips and Tricks
- User with custom private folders 
    - When you create a new user in "User Management"
        + Set the "Scope" of the user as "./[username]"
        + With the scope set, the user can only see files/folders created within their "Scope"

### Snippets/Usage

### Resources

### References
+ [Techno Tim Docs - Meet file browser](https://docs.technotim.live/posts/meet-file-browser/)

## Remarks
