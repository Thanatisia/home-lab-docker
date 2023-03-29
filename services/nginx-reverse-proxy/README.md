# nginx docker documentation

## Project Workspace
### File Structure
```
/
|-- docker-compose.yml         : The docker-compose environment file
|-- nginx/                     : Contains nginx files and resources
    |
    |-- backend-not-found.html : Error 404 page
    |-- Dockerfile             : A Dockerfile for a custom base image 
    |-- configs
        |
        |-- default.conf       : The nginx default routing configuration file
    |-- etc/                   : Contains system definitions required for the container
        |
        |-- hosts              : The '/etc/hosts' host file
    |-- includes/              : Additional resource files to be included
        |
        |-- proxy.conf         : Proxy definitions for the routing tables
        |-- ssl.conf           : SSL Configuration file
    |-- ssl/                   : SSL-related files and utilities
        |
        |-- gen_rsa.sh         : SSL RSA self-sign key-pair generator script using OpenSSL
        |-- README.md
    |-- template/
        |
        |-- nginx/             : Template nginx filesystem structure retrieved from the base nginx image
    |-- www/                   : Location to place your webserver files
        |
        |-- index.html         : The webserver index file
|
|-- README.md                  : docker-compose README (this)
```

### Folders


## Setup

### Pre-Requisites
- Edit 'nginx/etc/hosts'
    + This is the host file for the nginx container
    + This is mapped to '/etc/hosts' in the container
    + Change this to map the IP address of your server(s) to their respective domain names so that the container is able to locate the DNS name; 
    + (Testing) you do not need to do this step if you have pihole running alongside the compose
- Edit 'nginx/nginx.conf'
    + This is mapped to '/etc/nginx/nginx.conf' and is the nginx main routing configuration file by default
    + Change this to include other configuration files and/or routing
- Edit 'nginx/configs/default.conf'
    + This is mapped to '/etc/nginx/conf.d/default.conf' and is the nginx default routing configuration file
    + Change this to include your server definition and routes

### Dependencies
+ docker(-ce)
+ docker-compose

## Documentation

### Explanations
+ proxy_pass : Pass to a webpage in the nginx server (/var/www/html)
+ proxy_redirect : Redirect and pass to another webserver domain/URL path

### Synopsis/Syntax

### Parameters

### Usage

## Wiki

## Resources

## References
+ [Nginx docs - Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

## Remarks
