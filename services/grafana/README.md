# Prometheus

## Information
### Introduction
+ Grafana is the open-source platform for monitoring and observability
+ Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. 
- Create, explore, and share dashboards with your team and foster a data-driven culture:
    + Visualizations: Fast and flexible client side graphs with a multitude of options. Panel plugins offer many different ways to visualize metrics and logs.
    + Dynamic Dashboards: Create dynamic & reusable dashboards with template variables that appear as dropdowns at the top of the dashboard.
    + Explore Metrics: Explore your data through ad-hoc queries and dynamic drilldown. Split view and compare different time ranges, queries and data sources side by side.
    + Explore Logs: Experience the magic of switching from metrics to logs with preserved label filters. Quickly search through all your logs or streaming them live.
    + Alerting: Visually define alert rules for your most important metrics. Grafana will continuously evaluate and send notifications to systems like Slack, PagerDuty, VictorOps, OpsGenie.
    + Mixed Data Sources: Mix different data sources in the same graph! You can specify a data source on a per-query basis. This works for even custom datasources.

### Project
+ Website: grafana.com
- Github: 
    + Official repository: https://github.com/grafana/grafana
- Repositories
    + Docker: https://hub.docker.com/r/grafana/grafana

## Setup
### Installation via Bare Metal (Host Machine)
#### Dependencies
- Build Essentials
    + apt : build-essential
    + pacman : base-devel

#### Pre-Requisites


#### Build from Source

#### Installation

### Installation via Docker
#### Container
- Docker Repository:
    - Docker Hub: 
        + [grafana/grafana](https://hub.docker.com/r/grafana/grafana) : Official docker image 

#### Dependencies
+ docker
+ docker-compose

#### Pre-Requisites
- Create working directories and configuration files
    - Create working directories
        ```bash
        mkdir -pv /path/to/grafana/provisioning
        ```
    - Create the dashboard 'dashboard.json' configuration file with the following
        ```json
        {
            "dashboard" : {
                "oid" : "1",
                "title" : "Home Lab Monitoring",
                "timezone" : "browser",
                "panes" : [...],
                "targets" : ["prometheus:9090"]
            }
        }
        ```
    - Create the datasources configuration file
        ```bash
        touch grafana/provisioning/datasources.json
        ```

#### Using docker run
- Starting up
    ```console
    docker run -itd --name=grafana \
        --restart=unless-stopped \
        -p 3000:3000 \
        -p 3457:3457
        -v $PWD/grafana/provisioning:/etc/grafana/provisioning \
        grafana/grafana:[tag]
    ```

- Teardown/Shutdown
    ```console
    docker container stop grafana && docker container rm grafana
    ```

- Start a stopped container
    ```console
    docker container start grafana
    ```

- Stop a running container
    ```console
    docker container stop grafana
    ```

- Restart a running container
    ```console
    docker container restart grafana
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
    docker-compose start grafana
    ```

- Stop a running container
    ```console
    docker-compose stop grafana
    ```

- Restart a running container
    ```console
    docker-compose restart grafana
    ```

- To execute a command in the container
    ```console
    docker exec -it grafana [command] {options} <arguments>
    ```

### Accessing
- Enter the container shell
    ```console
    docker exec -it grafana /bin/sh {options} <arguments>
    ```

## Documentations

### Usage

## Wiki
### Environment Variables

### Networking
#### Port Forwarding/Translation/Mapping
+ 3000 : Grafana WebUI
+ 3457

### Filesystem Structure
#### Folders
+ /etc/grafana : Contains Grafana's working directory and files
+ /etc/grafana/provisioning : Contains grafana dashboard and datasource files

#### Files
- /etc/grafana/provisioning
    + dashboard.json : Contains the Grafana Dashboard configurations
    + datasources.json : Contains the data sources used to inject and populate the dashboards

### Docker mappings
#### Default Volumes
+ `/path/to/grafana/provisioning:/etc/grafana/provisioning` : Mount the Grafana provisioning workspace directory

### Templates
#### Configuration files
- dashboard.json
    ```json
    {
        "dashboard" : {
            "oid" : "1",
            "title" : "Home Lab Monitoring",
            "timezone" : "browser",
            "panes" : [...],
            "targets" : ["prometheus:9090"]
        }
    }
    ```
- datasources.json
    ```json
    ```

#### docker compose
- Grafana
    ```yaml
    version: "3.7"
    services:
      grafana:
        image: grafana/grafana
        container_name: grafana
        restart: unless-stopped
        ports:
          ## Port Forward/Translate/Map ports from the host system to container
          ## [host-ip-address]:[host-system-port]:[container-port]
          - "3000:3000"
          - "3457:3457"
        volumes:
          ## Map volumes from the host system into the container
          ## [host-system-volume]:[container-volume]:[permission]
          - "${PWD}/grafana/provisioning:/etc/grafana/provisioning"
    ```

### Notes and Findings
#### Error Messages

#### Things to note

## Resources

## References
+ [Dockerhub - grafana/grafana](https://hub.docker.com/r/grafana/grafana)

## Remarks

