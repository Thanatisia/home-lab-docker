# nginx docker documentation

## Project Workspace
### Components
+ Private Key : /etc/ssl/private
+ SSL Certificate : /etc/ssl/certs
- Nginx Configuration File(s)
    + /etc/nginx/nginx.conf

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
        |-- Place your SSL certificate and private key here
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
- (Optional) Encrypting with HTTPS
    + Generate Self-signed certificate with Private key using OpenSSL
- Domain Names 
    + Please ensure that your custom domain names has been added into your DNS server and/or host files

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
### Snippets and Examples
- Generate a self-signed certificate
    - using OpenSSL
        + SSL Certificate path: /etc/ssl/certs/cert.crt
        + SSL Private Key path: /etc/ssl/private/private.key
        ```console
        sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/[private-key-name].key -out /etc/ssl/certs/[certificate-name].crt
        ```

- Configure nginx route
    ```
    server {
        listen 443 ssl;
        server_name [your-domain-name | ip-address];
        ssl_certificate /etc/ssl/certs/[self-signed-certificate]; # Place the Self-Signed Certificate which you generated previously in step 1 here
        ssl_certificate_key /etc/ssl/private/[private-key-name];  # Place the Self-Signed Certificate's private key which you generated previously in step 1 here

        # Routes
        location /subdomain/ {
            proxy_pass http://[server-ip|domain-name]:[port-number]/[subdomains];
            ...
        }

        location / {
            proxy_pass http://[server-ip|domain-name]:[port-number]/[subdomains];
            ...
        }
    }
    ```

- Restart nginx container
    ```console
    docker-compose down && docker-compose up -d
    ```

- Check nginx status
    ```console
    docker-compose ps
    ```

- Test status
    - Attempt to connect to your server over HTTPS
        - Examples
            ```
            https://[server-ip|domain-name]/subdomains (if any)
            ```
        - Expected result
            + It should proxy pass to your target location

### Configurations
+ Please refer to [Configurations](configurations.md) for a full list of (testing/tested) nginx configuration settings

## Resources

## References
+ [Nginx docs - Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

## Remarks
