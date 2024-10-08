# node-exporter by Prometheus

## Information
### Introduction
+ node-exporter is a helper utility like Prometheus for exporting dataset (aka 'nodes') to Prometheus and Grafana for Data Visualization and Analysis

### Project
+ Website: prometheus.io
- Github: 
    + Official repository: https://github.com/prometheus/node-exporter
- Repositories
    + quay.io: quay.io/prometheus/node-exporter:latest

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
- node-exporter
    ```yaml
    version: "3.8"
    services:
      node_exporter:
        image: quay.io/prometheus/node-exporter:latest
        container_name: node_exporter
        restart: unless-stopped
        network_mode: host
        pid: host
        # ports:
          ## Port Forward/Translate/Map ports from the host system to container
          ## [host-ip-address]:[host-system-port]:[container-port]
        volumes:
          ## Map volumes from the host system into the container
          ## [host-system-volume]:[container-volume]:[permission]
          - "/:/host:ro,rslave"
        command:
          - '--path.rootfs=/host'
    ```

### Notes and Findings
#### Error Messages

#### Things to note

## Resources

## References
+ [Dockerhub - prom/node-exporter](https://hub.docker.com/r/prom/node-exporter)

## Remarks

