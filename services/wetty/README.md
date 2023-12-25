# wetty 

## Information
### Summary
```
WeTTY = Web + TTY, WeTTY is a Web Application terminal over HTTP and HTTPS.

WeTTY is an alternative to ajaxterm and anyterm but WeTTY uses xterm.js which is a full fledged implementation of terminal emulation written entirely in JavaScript. 
    - WeTTY also uses websockets rather than Ajax and hence better response time.
```

### Project
+ Author: butlerx
+ Application Name: wetty
- Repositories
    + GitHub: https://github.com/butlerx/wetty
    + Documentations Website: https://butlerx.github.io/wetty/

### Operational Flow
- WeTTY will first attempt to SSH into the specified SSH target hostname/ip address (specified in '--ssh-host')
- WeTTY uses WebSocket to intercept the TTY display and display the connection into the WebSocket server interface

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

### Installing from source
- using npm
    ```console
    npm -g i wetty
    ```

### Accessing
- To access the Web-SSH browser
    - HTTP
        - Default
            + Open `http://[target-ssh-hostname|ip-address]:3000/wetty`
        - To specify the user beforehand
            + Open `http://[target-ssh-hostname|ip-address]:3000/wetty/ssh/<username>`

## Documentations

### Application
#### Synopsis/Syntax
```console
wetty {options} <arguments>
```

#### Parameters
- Positionals
- Optionals
    - With Arguments
        - `-b | --base=[subpage]` : Set the base URL to access here
            + Default: '/wetty'
            - Base examples
                - '/' : 'http(s)://ssh-host-ip-domain:3000/'
        - `-p | --port=[custom-port-number]` : Set the port number for wetty to listen with
            + Default: 3000
        + `--ssh-host=[target-hostname-ip-address]` : Specify the target hostname/ip address you want to SSH connect to
        + `--ssh-port=[custom-port-number]` : Specify the port number you want to SSH connect with
    - Flags
        + -h | --help : Display all options

#### Usage
- Start web-ssh terminal and SSH connect to a target server
    ```console
    wetty --ssh-host=[your-target-hostname-ip-address]
    ```

- Start web-ssh terminal with a custom base URL
    - Access the WebUI with 'http(s)://ssh-host-ip-domain:3000/'
    ```console
    wetty --ssh-host=[your-target-hostname-ip-address] --base=/
    ```

- Connect to WebUI through a custom port number
    ```console
    wetty --ssh-host=[your-target-hostname-ip-address] --port=[custom-port-number]
    ```

### Start
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=wetty \
        --restart=unless-stopped \
        -p "3000:3000" \
        wettyoss/wetty --ssh-host=[your-target-hostname-ip-address] --base=/
    ```

- Teardown/Shutdown
    ```console
    docker container stop wetty && docker container rm wetty
    ```

- Start a stopped container
    ```console
    docker container start wetty
    ```

- Stop a running container
    ```console
    docker container stop wetty
    ```

- Restart a running container
    ```console
    docker container restart wetty
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
    docker-compose start wetty
    ```

- Stop a running container
    ```console
    docker-compose stop wetty
    ```

- Restart a running container
    ```console
    docker-compose restart wetty
    ```

### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping
+ 3000 : HTTP WebUI

### Container directories

### Project file structure

### Docker mappings
#### Default Volumes

## Wiki

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  wetty:
    image: wettyoss/wetty
    container_name: wetty
    restart: unless-stopped
    ports:
      ## Port forward/translate/map from host system into container
      ## [ip-address]:[host-port]:[container-port]
      - 3000:3000 # HTTP WebUI
    command:
      ## Parse the following options into the application here
      - --base=[base-url]             # Set the base URL to access here; Examples: '--base=/' = 'http(s)://ssh-host-ip-domain:3000/'
      - --ssh-host=[target-ip-domain] # Set your target hostname/ip address that you want to SSH into here
```

### Notes and Findings

## Resources

## References
+ [Wetty Documentations - Flags](https://butlerx.github.io/wetty/flags)

## Remarks

