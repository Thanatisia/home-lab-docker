# Prometheus

## Information
### Introduction
+ Prometheus, a Cloud Native Computing Foundation (CNCF) project, is a **systems and service monitoring system**. 
- Prometheus
    1. collects metrics from configured targets at given intervals, 
    2. evaluates rule expressions, 
    3. displays the results, and 
    4. can trigger alerts when specified conditions are observed.

- The features that distinguish Prometheus from other metrics and monitoring systems are:
    + A multi-dimensional data model (time series defined by metric name and set of key/value dimensions)
    + PromQL, a powerful and flexible query language to leverage this dimensionality
    + No dependency on distributed storage; single server nodes are autonomous
    + An HTTP pull model for time series collection
    + Pushing time series is supported via an intermediary gateway for batch jobs
    + Targets are discovered via service discovery or static configuration
    + Multiple modes of graphing and dashboarding support
    + Support for hierarchical and horizontal federation

### Project
+ Website: prometheus.io
- Github: 
    + Official repository: https://github.com/prometheus/prometheus
- Repositories
    + Docker: https://hub.docker.com/r/prom/prometheus

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
+ go >= 1.17
+ nodejs >= 16
+ npm >= 7
- Build Essentials
    + apt : build-essential
    + pacman : base-devel

#### Pre-Requisites
- Obtaining source code repository
    - Clone repository
        ```bash
        git clone https://github.com/prometheus/prometheus.git
        ```

    - Change directory into repository
        ```bash
        cd prometheus
        ```

#### Build from Source
- Using `go install`
    - Build and install the `prometheus` and `promtool` binaries into your GOPATH environment variable
        ```bash
        GO111MODULE=on go install github.com/prometheus/prometheus/cmd/...
        prometheus --config.file=<your-config-file>.yml
        ```
    - (Optional) Compile the web assets so that Prometheus can be run from anywhere
        ```bash
        make build
        ./prometheus --config.file=<your-config-file>.yml
        ```

#### Installation

### Installation via Docker
#### Container
- Docker Repository:
    - Docker Hub: 
        + [prom/prometheus](https://hub.docker.com/r/prom/prometheus) : Official docker image 

#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites
- Obtaining source code repository
    - Clone repository
        ```bash
        git clone https://github.com/prometheus/prometheus.git
        ```
    - Change directory into repository
        ```bash
        cd prometheus
        ```

- Create working directories and configuration files
    - Create working directories
        ```bash
        mkdir -pv /path/to/prometheus
        ```
    - Create prometheus.yml configuration file with the following
        ```yml
        global:
          scrape_interval: 5s
          external_labels:
            monitor: 'node'

        scrape_configs:
          - job_name: 'prometheus'
            static_configs:
              - targets: ['<your-prometheus-server-host-ip-address>:9090']
        ```

#### Using docker run
- Starting up
    ```console
    docker run -itd --name=prometheus \
        --restart=unless-stopped \
        -p 9090:9090 \
        -v $PWD/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
        prom/prometheus:[tag]
    ```

- Teardown/Shutdown
    ```console
    docker container stop prometheus && docker container rm prometheus
    ```

- Start a stopped container
    ```console
    docker container start prometheus
    ```

- Stop a running container
    ```console
    docker container stop prometheus
    ```

- Restart a running container
    ```console
    docker container restart prometheus
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
    docker-compose start prometheus
    ```

- Stop a running container
    ```console
    docker-compose stop prometheus
    ```

- Restart a running container
    ```console
    docker-compose restart prometheus
    ```

- To execute a command in the container
    ```console
    docker exec -it prometheus [command] {options} <arguments>
    ```

### Accessing
- Enter the container shell
    ```console
    docker exec -it prometheus /bin/sh {options} <arguments>
    ```

## Documentations

### Usage

## Wiki
### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping
+ 9090 : Prometheus WebUI

### Filesystem Structure
#### Folders
+ /etc/prometheus : Contains prometheus' working directory and files

#### Files
- /etc/prometheus
    + prometheus.yml : Contains the prometheus configuration file

### Docker mappings
#### Default Volumes
+ `/path/to/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml` : Mount the prometheus configuration file

### Templates
#### Configuration files
- prometheus.yml
    ```yml
    global:
      scrape_interval: 5s
      external_labels:
        monitor: 'node'

    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['<your-prometheus-server-host-ip-address>:9090']
    ```

#### docker compose
- Prometheus
    ```yaml
    version: "3.7"
    services:
      prometheus:
        image: prom/prometheus
        container_name: prometheus
        restart: unless-stopped
        ports:
          ## Port Forward/Translate/Map ports from the host system to container
          ## [host-ip-address]:[host-system-port]:[container-port]
          - "9090:9090"
        volumes:
          ## Map volumes from the host system into the container
          ## [host-system-volume]:[container-volume]:[permission]
          - "${PWD}/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml"
    ```

### Notes and Findings
#### Error Messages

#### Things to note

## Resources

## References
+ [Dockerhub - prom/prometheus](https://hub.docker.com/r/prom/prometheus)

## Remarks

