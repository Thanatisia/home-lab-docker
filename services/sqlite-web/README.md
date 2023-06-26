# SQLite-Web by Coleifer

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information
### Background
```
'sqlite-web' is a web-based SQLite database browser written in Python.
```

### Service
+ Service Author: coleifer
+ Service Name: sqlite-web
+ URL: https://github.com/coleifer/sqlite-web
+ Docker URL: https://hub.docker.com/r/coleifer/sqlite-web

### Program
- Ports to map
    + 8080:8080
- Volumes
    + /path/to/data:/data
- Features
    + Works with your existing SQLite databases, or can be used to create new databases.
    - Add or drop:
        + Tables
        + Columns
        + Indexes
    + Export data as JSON or CSV.
    + Import JSON or CSV files.
    + Browse table data.
    + Insert, Update or Delete rows.

## Setup
### Dependencies
+ flask
+ peewee
+ pygments

### Pre-Requisites

### Installation
- Using python pip
    ```console
    python -m pip install sqlite-web
    ```

### Starting up on docker
- Check your docker-compose
    ```console
    docker ps
    ```
- Try to startup docker-compose
    ```console
    docker-compose up
    ```
- Startup docker-compose
    ```console
    docker-compose up -d
    ```

## Documentations

### Synopsis/Syntax
```console
sqlite_web {options} [database-file]
```

### Parameters
- Positionals
    + database-file : Specify the filepath and name of the target database file to open

- Optionals
    - With Arguments
        + -c [ssl-certificate] | --cert [ssl-certificate] : Specify the filepath and name of the SSL certificate
        + -d [true|false]  | --debug [true|false] : Enable/Disable debug messages
        + -e [loadable-extension] | --extension [loadable-extension] : Specify the path or name of the loadable extention(s). To load multiple extensions, specify '-e [path]' for each extension
        + -H [host-domain] | --host [host-domain] : Specify the host domain; default is 127.0.0.1
        + -k [ssl-private-key] | --key [ssl-private-key]  : Specify the filepath and name of the SSL prive key
        + -p [port-number] | --port [port-number] : Specify the WebUI port; default is 8080
        + -R [number-of-rows] | --rows-per-page [number-of-rows] : Set the pagination/maximum rows per page on content page, default is 50 rows
        + -u [url-prefix]  | --url-prefix [url-prefix] : Specify the URL prefix for the application, i.e. "/sqlite-web"
    - Flags
        + -a | --ad-hoc     : Run using an ad-hoc SSL context
        + -P | --password   : Prompts for password to access the sqlite-web WebUI; Alternatively, the password can be stored in the "SQLITE_WEB_PASSWORD" environment variable, in which case the application will not prompt for a password, but will use the value from the environment
        + -r | --read-only  : Open the database in Read-only mode
        + -x | --no-browser : Do not open a web-browser when sqlite-web starts

### Usage
- Starting up database file
    ```console
    sqlite_web /path/to/database.db
    ```

### Configuration
- Environemnt Variables
    + SQLITE_WEB_PASSWORD : Specify the web password; the application will not prompt for a password, but will use the value from the environment

- Supporting Services
    + TBC

## Wiki 

### Resources

### References

## Remarks
