# Home Lab - Self-hosting your own private docker repository distribution server - Using docker 'registry'

## Information
### Description
+ 'registry' is a docker image using 'The Registry' created and managed by the CNCF (Cloud Native Computing Foundation) Distribution Registry for setting up your own private docker distribution registry (aka 'remote repository') server
- What is 'The Registry?'
    + The Registry is a stateless, highly scalable server side application that stores and lets you distribute container images and other content. 
    + The Registry is open-source, under the permissive Apache license.

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Create the volume mount points
    ```bash
    mkdir -pv registry/{etc,var}
    ```

- Create a sample configuration file for registry ('config.yml') file
    - Explanation
        - version : Specify the YAML version for this configuration file
            + Type: String
            + Default: 0.1
        - log : Specify the attributes/properties to apply to the logs
            + Type: Dictionary
            - Key-Values
                - fields : Specify the fields of the log file
                    + Type: Dictionary
                    - Key-Values
                        - service : Specify the service to log
                            + Type: String
                            + Default: registry
        - storage : Specify the attributes/properties to apply to storage and metadata within the container
            + Type: Dictionary
            - Key-Values
                - cache : Specify the attributes of cache in the container
                    + Type: Dictionary
                    - Key-Values
                        - blobdescriptor : Specify the descriptor used to handle blob cache data
                            + Type: String
                            + Default: inmemory (Internal cache)
                - filesystem : Specify the attributes of the container's filesystem contents
                    + Type: Dictionary
                    - Key-Values
                        - rootdirectory : Specify the root directory for the registry's data contents
                            + Type: String
                            + Default: /var/lib/registry
        - http : Specify the HTTP Server configuration settings for the docker repository server
            + Type: Dictionary
            - Key-Values
                - addr : Specify the HTTP server's base hostname/address (Format/Syntax: `{server-ip|hostname}:[server-port]`)
                    + Type: String
                    + Default: ':5000'
                    - Notes
                        + You can leave the server IP address empty to default to 'localhost'/127.0.0.1
                - headers : Specify the HTTP Header options to apply to the HTTP server packets
                    + Type: Dictionary
                    - Key-Values
                        - X-Content-Type-Options : Specify content type
                            + Type: List
                            + Default: `[nosniff]`
        - health : Specify the properties/attributes to look out for regarding the health level of the container and drivers
            + Type: Dictionary
            - Key-Values
                - storagedriver : Specify the storage driver's health
                    + Type: Dictionary
                    - Key-Values
                        - enabled : Enable/Disable this health checkup
                            + Type: Boolean
                            + Default: true
                        - interval : Specify the time interval/delay/pauses between each check
                            + Type: String
                            + Default: 10s
                        - threshold : Specify the maximum number of retries/negative health before it kills the server
                            + Type: Integer
                            + Default: 3
    ```yaml
version: 0.1
log:
  fields:
    service: registry
storage:
  cache:
    blobdescriptor: inmemory
  filesystem:
    rootdirectory: /var/lib/registry
http:
  addr: :5000
  headers:
    X-Content-Type-Options: [nosniff]
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
    ```

### Security
- Create directories for the local self-signed SSL/TLS certificates and components
    ```bash
    mkdir -pv certs
    ```
- Generate a local Self-Signed SSL/TLS certificate
    - Explanation
        - `openssl` : OpenSSL can be used to handle/work with the SSL/TLS protocol, such as creating SSL certificates required for cryptographically encrypting/decrypting data, such as HTTP/TCP Network traffic
            - `req` : Request OpenSSL to generate a local SSL certificate
                + `-newkey rsa:4096` : Generate a local SSL certificate using the Encryption algorithm/scheme - RSA-4096(bits)
                + `-nodes`
                + `-sha256` : Use the cryptographic hashing algorithm 'SHA256' to hash the certificate
                + `-keyout certs/registry.local.key` : Generate and output the Private Key used to encrypt the Local SSL certificate (using Private-Public Key Encryption Scheme)
                + `-x509` : Use the X.509 format when writing the private key
                + `-days 365` : Specify the Time-to-Live (TTL) before the key expires and you need to renew the key (365 days/1 year)
                + `-out certs/registry.local.crt` : Generate and output the encrypted Local SSL Certificate
    ```bash
    openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/registry.local.key -x509 -days 365 -out certs/registry.local.crt
    ```

- (Optional) To add the created certificate file to other docker servers
    - SSH into the remote docker server
        ```bash
        ssh [server-username]@[server-ip|domain]
        ```
    - Create the 'certs.d' directory in the remote server
        ```bash
        mkdir -pv /etc/docker/certs.d/[registry-server-IP|domain]:[registry-server-port]
        ```
    - Secure Copy the self-signed certificate from the registry server to your new docker server
        ```bash
        scp [registry-server-username]@[registry-server-IP|domain]:/path/to/[ssl-certificate-name] /etc/docker/certs.d/[registry-server-IP|domain]:[registry-server-port]/ca.crt
        ```
    - Restart docker service
        ```bash
        systemctl restart docker.service
        ```

### Customization

> docker-compose.yaml

```yaml
# docker-compose for CNCF Private docker Distribution registry
version: "3.7"
services:
  registry:
    image: registry:2
    container_name: "registry"
    restart: unless-stopped
    environment:
      ## Map your environment variables from the host system to the container here
      - REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.local.crt
      - REGISTRY_HTTP_TLS_KEY=/certs/registry.local.key
    ports:
      ## Port Forward/Translate/Map port from host system to container
      ## Syntax: [ip-address]:[host-system-port]:[container-port]
      - "5000:5000"
    volumes:
      ## Mount volumes from host system into container
      ## Syntax: [host-system-volume]:[container-volume]:[permission]
      - "/path/to/registry/etc/config.yml:/etc/docker/registry/config.yml"
      - "/path/to/registry/var:/var/lib/registry"
      - "/path/to/certs:/certs"
```

### Startup Image and container

> Using docker run CLI

- Startup registry
    ```bash
    docker run -itd \
        --name "registry" \
        -p 5000:5000 \
        -v "/path/to/registry/etc/config.yml:/etc/docker/registry/config.yml" \
        -v "/path/to/registry/var:/var/lib/registry" \
        registry:2
    ```

- Stop and remove container
    ```bash
    docker stop registry && docker rm registry
    ```

> Using docker-compose

- Startup docker-compose environment
    ```bash
    docker-compose {-f <custom-docker-filename>} up -d
    ```

- Teardown docker-compose environment
    ```bash
    docker-compose {-f <custom-docker-filename>} down
    ```

### Manage docker service

- Start a stopped docker container
    ```bash
    docker container start [container-name]
    ```

- Stop a running docker container
    ```bash
    docker container stop [container-name]
    ```

- Restart a running docker container
    ```bash
    docker container restart [container-name]
    ```

### QuickStart 
- Pull/Build some image from an existing docker registry
    - Dockerhub
        ```bash
        docker pull ubuntu
        ```
- Tag the image so that it points to the registry
    - Explanation
        + Docker will copy the specified base image to tag and create a new image with the image name `[your-registry-server-IP|host]:[your-registry-server-port-number]/[your-image-repository-name]`
    ```bash
    docker image tag [base-image-to-tag] [your-registry-server-IP|host]:[your-registry-server-port-number]/[your-image-repository-name]
    ```
- Push the tagged image to your private docker registry server
    - Notes
         + The pushed docker image repository will be stored in "/var/lib/registry/docker/registry/[registry-version]/repositories"
    ```bash
    docker push [your-registry-server-IP|host]:[your-registry-server-port-number]/[your-image-repository-name]
    ```
- Test the pushed image
    - List all images in your local docker image list
        ```bash
        docker image ls --all
        ```
    - Remove the tagged image from your local docker image list
        ```bash
        docker image rm [your-registry-server-IP|host]:[your-registry-server-port-number]/[your-image-repository-name]:[image-tag|version]
        ```
    - List all images in your local docker image list
        ```bash
        docker image ls --all
        ```
    - Pull the image from your docker registry
        ```bash
        docker pull [your-registry-server-IP|host]:[your-registry-server-port-number]/[your-image-repository-name]:[image-tag|version]
        ```
    - List all images in your local docker image list
        ```bash
        docker image ls --all
        ```

## Documentations

### Container

### Environment Variables
> Security
- SSL/TLS Self-Signed Certificate
    + `REGISTRY_HTTP_TLS_CERTIFICATE=/certs/[self-signed-ssl-certificate]` : Specify the TLS/SSL Certificate used to encrypt the HTTP traffic into HTTPS for the registry
    + `REGISTRY_HTTP_TLS_KEY=/certs/[self-signed-ssl-certificate-private-key]` : Specify the Private Key used to encrypt the Local SSL Certificate (via Public-Private Key Encryption)

### Network Ports
- 5000 : This port is used for the docker repository server

#### Volumes
- bin/
    + registry : This is the registry executable/binary
- etc/
    - docker/
        - registry : This folder contains configuration files and data used by the 'registry' docker image
            + config.yml : This is the 'registry' docker image's main configuration file
- var/
    - lib/
        - registry/ : This folder contains registry data in general
            - docker/ : This folder contains all docker-related datasets
                - registry/ : This folder contains data used by the 'registry' docker image for setting up your own private docker "remote repository" distribution server
                    - v2 : 'registry' docker image version
                        - repositories : Your images will be pushed here
                            - [repository_name]/ : This folder will contain the metadata and layers for the image
                                

## Wiki

## Resources

## References
+ [Bacardi55 - 2021-03-29 - Home Lab Part 8 - Create a local docker registry to manage your own images](https://bacardi55.io/2021/03/29/home-lab-part-8-create-a-local-docker-registry-to-manage-your-own-images/)
+ [CNCF Distribution Website](https://distribution.github.io/distribution/)

## Remarks
