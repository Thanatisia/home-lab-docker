# Continuous Integration and Continuous Delivery server - jenkins

## Information
### Background
+ Jenkins is a popular Continuous Integration and Continuous Delivery (CI/CD) Pipeline automation server build with Java

- Use Jenkins to automate your development workflow, so you can focus on work that matters most. 
    - Jenkins is commonly used for:
        + Building projects
        + Running tests to detect bugs and other issues as soon as they are introduced
        + Static code analysis
        + Deployment
        + Execute repetitive tasks, save time, and optimize your development process with Jenkins.

### Project
- Repository URL: 
    + [Jenkins Repo](https://github.com/jenkinsci)
    + [Jenkins Docker](https://github.com/jenkinsci/docker)
+ Marketing Page: https://jenkins.io/

### Container
- Docker Repository:
    + https://hub.docker.com/r/jenkins/jenkins 
- Images:
    + jenkins/jenkins:[tags] 

## Setup
### Dependencies
+ docker
+ docker-compose
- make
- Build/Development tools
    - build-essential : for apt
    - base-devel : for pacman
+ jdk == 11, 17 or 21
+ apache maven >= 3.8.1
+ node.js >= 20.X
+ yarn
+ fontconfig

### Pre-Requisites

### Host Machine
#### Installing Dependencies
- java
    + openjdk-17-jre

#### Installing package
- Using package manager
    - apt-based
        - LTS support release
            - Notes
                + From the 'debian-stable' apt repository
            ```console
            sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
              https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
            echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
              https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
              /etc/apt/sources.list.d/jenkins.list > /dev/null
            sudo apt-get update
            sudo apt-get install jenkins
            ```
        - Weekly release
            - Notes
                + From the 'debian' apt repository
            ```console
            sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
              https://pkg.jenkins.io/debian/jenkins.io-2023.key
            echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
              https://pkg.jenkins.io/debian binary/ | sudo tee \
              /etc/apt/sources.list.d/jenkins.list > /dev/null
            sudo apt-get update
            sudo apt-get install jenkins
            ```
    - pacman-based
        - Install packages
            ```console
            sudo pacman -S jenkins fontconfig java-17-openjdk
            ```
        - Edit Jenkins default configuration file
            - Define your Java path
                - Change the following lines
                    + `JAVA=/usr/lib/jvm/java-11-openjdk/bin/java`
                    + `JAVA_ARGS="-Xmx2048m -XX:MaxPermSize=512m -Djava.awt.headless=true"`
            ```console
            $EDITOR /etc/conf.d/jenkins
            ```
        - Reload systemd daemon to apply changes
            ```console
            systemctl daemon-reload
            ```
    - yum-based
        - LTS support release
            - Notes
                + From the 'redhat-stable' yum repository
            ```console
            sudo wget -O /etc/yum.repos.d/jenkins.repo \
                https://pkg.jenkins.io/redhat-stable/jenkins.repo
            sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
            sudo dnf upgrade
            # Add required dependencies for the jenkins package
            sudo dnf install fontconfig java-17-openjdk
            sudo dnf install jenkins
            sudo systemctl daemon-reload
            ```
        - Weekly release
            - Notes
                + From the 'redhat' yum repository
            ```console
            sudo wget -O /etc/yum.repos.d/jenkins.repo \
                https://pkg.jenkins.io/redhat/jenkins.repo
            sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
            sudo dnf upgrade
            # Add required dependencies for the jenkins package
            sudo dnf install fontconfig java-17-openjdk
            sudo dnf install jenkins
            ```

#### Start server
- using systemd
    - (Optional) Enable Server
        ```console
        sudo systemctl enable jenkins
        ```
    - Start Server
        ```console
        sudo systemctl start jenkins
        ```
    - Verify Server has started
        ```console
        sudo systemctl status jenkins
        ```

#### Accessing
- To access the Web-SSH browser
    - HTTP
        - Default
            + Open `http://[server-ip-address]:8080`

## Documentations

### Docker
#### Using docker run
- Starting up
    ```console
    docker run -itd --name=jenkins \
        --restart=unless-stopped \
        -p 8080:8080 \
        -p 50000:50000 \
        -v /path/to/jenkins/home:/var/jenkins_home \
        jenkins/jenkins:lts-jdk17
    ```

- Teardown/Shutdown
    ```console
    docker container stop jenkins && docker container rm jenkins
    ```

- Start a stopped container
    ```console
    docker container start jenkins
    ```

- Stop a running container
    ```console
    docker container stop jenkins
    ```

- Restart a running container
    ```console
    docker container restart jenkins
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
    docker-compose start jenkins
    ```

- Stop a running container
    ```console
    docker-compose stop jenkins
    ```

- Restart a running container
    ```console
    docker-compose restart jenkins
    ```

### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping
+ 8080 : HTTP WebUI
+ 50000 : For connecting agents to the controller through an inbound TCP connection

## Wiki
### Filesystem Structure
#### Folders
- /var/ : The container's variable directory
    - jenkins_home/ : The applications home directory; Jenkin's data will be written here

#### Files 


### Docker mappings
#### Default Volumes
- /path/to/jenkins/home:/var/jenkins_home : Jenkins Home directory

### Templates
#### docker compose
```yaml
version: "3.7"
services:
  jenkin:
    image: jenkins/jenkins:lts
    container_name: "jenkins"
    restart: unless-stopped
    ports:
      ## Map host system port to container port
      ## [host-ip]:[host-system-port]:[container-port]
      - "8080:8080" # WebUI
      - "50000:50000" # For connecting agents to the controller through an inbound TCP connection
    volumes:
      ## Map volume from host system to container
      ## [host-system-volume]:[container-volume]:[permissions]
      - "/path/to/jenkins/home:/var/jenkins_home" # Jenkins Home directory
```

### Notes and Findings

## Resources

## References
+ [Jenkins build process](https://github.com/jenkinsci/jenkins/blob/master/CONTRIBUTING.md)
+ [Atlantic - Dedicated Server Hosting - how to install Jenkins on Archlinux](https://www.atlantic.net/dedicated-server-hosting/how-to-install-jenkins-on-arch-linux/)

## Remarks


