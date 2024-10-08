# CHANGELOGS

## Table of Contents
+ [2023-11-23](#2023-11-23)
+ [2023-12-18](#2023-12-18)
+ [2023-12-25](#2023-12-25)
+ [2024-01-04](#2024-01-04)
+ [2024-02-20](#2024-02-20)
+ [2024-02-21](#2024-02-21)
+ [2024-02-23](#2024-02-23)
+ [2024-02-24](#2024-02-24)
+ [2024-02-26](#2024-02-26)
+ [2024-02-27](#2024-02-27)
+ [2024-03-04](#2024-03-04)
+ [2024-10-08](#2024-10-08)

## Logs
### 2023-11-23
#### 2218H
- New
    - Added new service 'home-assistant'
    - Added new stack 'pihole-unbound-wireguard'

- Updates
    - Updated document 'TODO.md'
    - Updated document 'README.md' in 'services' with the new services
    - Updated document 'README.md' in 'stacks' with new stacks

#### 2250H
- New
    - Added folders 'pihole' and 'unbound.d' to 'stacks/pihole-unbound-wireguard/architectures/arm'

### 2023-12-18
#### 1711H
- New
    - Added new service 'louislam/dockge'
- Updates
    - Updated document 'README.md' in 'services' with the new services

#### 2104H
- Updates
    - Updated document 'README.md' in 'dockge' with Notes and Findings

### 2023-12-25
#### 2125H
- New
    - Added new service 'wettyoss/wetty'
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-01-04
#### 2305H
- New 
    - Added new service 'gethomepage/homepage' : A highly customizable homepage (or startpage / application dashboard) Web Application with Docker and service API integrations.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-02-20
#### 1645H
- New
    - Added new image author 'cavia' for service 'excalidraw' : Fork of the official image to build an image for ARM64

- Updates
    - Updated 'README.md's of 'services/' and 'services/excalidraw/'

### 2024-02-21
#### 0018H
- New
    - Added new service 'jenkins/jenkins' : Continuous Integration and Continuous Delivery (CI/CD) Pipeline automation build server
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-02-23
#### 0016H
- New
    - Added new service 'plankanban/planka' : A realtime kanban board for workgroups built with React and Redux.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

#### 1355H
- New
    - Added new service 'seriousm4x/UpSnap' : A simple wake on lan web app written with SvelteKit, Go and PocketBase.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-02-24
#### 1110H
- Updates
    - Updated 'README.md' in service 'plankanban/planka' with examples for connecting to remote postgresql server instances (so that you dont have to use a dedicated postgresql server container)

### 2024-02-26
#### 0102H
- New
    - Added new service 'charmbracelet/vhs' : A screen recorder CLI utility that allows you to create terminal GIFs as code for integration testing and demoing your CLI tools.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

#### 0113H
- New
    - Added new service 'mongo' : MongoDB is a Cross-Platform rich document-oriented NoSQL database and utilizes JSON-like documents with optional schemas.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-02-27
#### 1443H
- New
    - Added new service 'nixos/nix' : The Nix Package Manager is a standalone package manager that uses declarative configuration and containerization to create reproducibility and portability.
- Updates
    - Updated document 'README.md' in 'services' with the new services 

### 2024-03-04
#### 1555H
- New
    + Added new author for service 'nix' - 'nixpkgs/nix' : Made and community-managed, this uses Rootfs image instead of BusyBox

### 2024-10-08
#### 2257H
- New
    - Added new services
        + 'grafana/grafana' : Grafana 
        + 'prom/prometheus' : Prometheus
        + 'prom/node-exporter' : Node-Exporter
        + 'registry' : CNCF Docker private remote repository/registry server
        + 'ollama' : Open Source Local AI Large Language Model Server and Management utility
        + 'open-webui' : Generic WebUI application used by LLMs to interface/interact with
        + 'ollama-webui' : WebUI application similar to open-webui but designed specifically for ollama
- Updates
    + Updated document 'README.md' in 'services' with the new services 
    - Updated document 'docker-compose.yaml' in 'services/netbootxyz/authors/netbootxyz/'
        + Refactored/reorganized docker-compose key-value configuration settings
        + Added new description

