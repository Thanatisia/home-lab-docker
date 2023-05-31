# Docker-compose for Search Engine service: Searx-NG 

## Table of Contents
+ [Information](#information)

## Information
### Background
```
Self-hosted free internet metasearch engine which aggregates results from various search engine services and databases.
    Searx-NG is the active branch/variant of the Searx project, whereby the latter is in maintenance mode.
```

### Service
+ Service Author: searxng
+ Service Name: searxng
+ URL: https://github.com/searxng/searxng
+ Docker URL: https://github.com/searxng/searxng-docker

## Setup
- Pre-Requisites
    - Using a custom settings file
        1. Generate the secret key in 'searxng/settings.yml'
            ```console
            sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/settings.yml
            ```
        2. Edit the searxng/settings.yml to add the settings you need
    3. Edit your docker-compose
        + change the Base URL to your webserver location
        - Note
            + Use the 'env_file' key if you want to use the '.env' file instead of the 'environment' key

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
        docker-compose up -d
        ```

## Documentations
- Environemnt Variables
    + SEARXNG_BASE_URL=<URL>      : Set a custom Searx-NG Base URL for the server
    + SEARXNG_HOSTNAME=<hostname> : Set a custom Searx-NG hostname for the server
    + LETSENCRYPT_EMAIL=<email>   : Set the email for your Let's Encrypt TLS/SSL Certificate

- Supporting Services
    + Redis : Database
    + Caddy : Reverse Proxy

## Wiki 

### Resources
+ Official Docs: https://docs.searxng.org/
+ Default Settings: https://docs.searxng.org/admin/engines/settings.html#use-default-settings
+ User handbook: https://docs.searxng.org/user
+ Admin handbook: https://docs.searxng.org/admin
+ Developer handbook: https://docs.searxng.org/
+ DockerHub: https://hub.docker.com/r/searxng/searxng

### References

## Remarks
