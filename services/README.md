# Services

```
This folder contains docker-compose/dockerfile/docker files for running various home lab services as a container.

Each folder represents a service and every service contains a docker-compose file and/or other required dependencies to build a proper docker environment for the utility.

The services found here are all generally useful tools and utilities used in a home lab server and/or self-hosted purposes.
```

## Services List
### Elemental
```
These services are all standalone projects that requires no additional dependencies, and 
can be used to mix and match with other images as optional dependencies
```
- adguard : Adblocker service
- apache : Web Server
- archivebox : Open Source, self-hosted Web Archiving solution
    - author
        + archivebox
- flaresolverr : Proxy Server to bypass cloudflare protection
    - author
        + flaresolverr
- caddy : A powerful, enterprise-ready, open source web/proxy/reverse proxy server alternative to Nginx/Traefik with automatic HTTPS written in Go(lang)
- code-server : DevOps, Development utility, Web-based Code Editor
    - author
        + 32-bit : linuxserver
- dockge : A fancy, easy-to-use and reactive self-hosted docker compose WebUI, stack-oriented, application/service manager made by the creator of Uptime Kuma
    - author
        + louislam
- drawio : Self-hosted implementation of the online UML drawing utility of the same name
    - author
        + jgraph
- duckdns : Dynamic DNS auto-updater service
- emulatorjs : Self-Hosted Web/browser-based retro emulation platform powered by libretro (used/created by retroarch)
    - author
        + linuxserver
- excalidraw : Network Diagram and Drawing Tool
    - author
        + excalidraw : Official image; AMD64 only
        + cavia : Custom ARM64 fork of the official image; outdated
- file-browser : Utility
- gitea : Self-hosted Git remote repository hosting service
- grafana : Open Source platform for system monitoring and observability
    - author
        + grafana
- guacamole : Network-based Browser-based Remote Desktop Protocol/utility
- headscale : Self-hosted master node/server implementation of the tailscale mesh network project
- heimdall : Dashboard
- home-assistant : Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts.
    - author
        + home-assistant
- homepage : A highly customizable homepage (or startpage / application dashboard) Web Application with Docker and service API integrations.
    - author
        + gethomepage
- homer : Dashboard
- ipsec-vpn-server : VPN Server
- jellyfin : Media Server
- jenkins : Continuous Integration and Continuous Delivery (CI/CD) Pipeline automation server
    - author
        + jenkins
- jupyter-base-notebook : aka Jupyter Notebooks; collection of various variant of the python WebUI REPL server; This is the 'base-notebook' image
    - author
        + jupyter
- jupyter-datascience-notebook : aka Jupyter Notebooks; collection of various variant of the python WebUI REPL server; This is the 'datascience-notebook' image
    - author
        + jupyter
- jupyter-minimal-notebook : aka Jupyter Notebooks; collection of various variant of the python WebUI REPL server; This is the 'minimal-notebook' image
    - author
        + jupyter
- mariadb : Database Management System Utility
- metube : Self-hosted yt-dlp Web UI
- minecraft-server : Docker image that provides a Minecraft Server that will automatically download selected version at startup
    - author
        + itzg
- mongodb : MongoDB is a Cross-Platform rich document-oriented NoSQL database and utilizes JSON-like documents with optional schemas.
    - author
        + mongo
- mysql : Database Management System Utility
- nerd-font-patcher : A font patcher for the Nerd Fonts projects that patches targeted fonts with a high number of Glyph(icon)/Font Icon
- netbootxyz : A PXE a network boot loader/service that lets you install or boot to any operating system simply by booting to the network
- Nextcloud : NAS service
- nginx-proxy-manager : Proxy server, Reverse proxy server
- nginx-reverse-proxy : Proxy server, Reverse proxy server, Web server
- nix : The Nix Package Manager is a standalone package manager that uses declarative configuration and containerization to create reproducibility and portability.
    - author
        + nixos : Uses BusyBox
        + nixpkgs : Uses Rootfs
- node-exporter : Helper utility like Prometheus for exporting dataset (aka 'nodes') to Prometheus and Grafana for Data Visualization and Analysis
    - author
        + prometheus
- nodejs : DevOps, Development utility, web server
- ntfy.sh : Simple HTTP-based pub-sub notification service that allows you to send push notifications to your phone or desktop using PUT/POST
    - author
        + binwiederhier
- ollama : Open Source self-hostable AI Large Language Model (LLM) framework made and maintained by Meta that allows for the management, pulling, pushing and listing of various open source LLM models - for example, Mista - which you can pull and use locally
    - author
        + ollama
- ollama-webui : Generic WebUI (Web interface) for AI models to use as a chatbot; based on the Open-WebUI Web interface but configured specifically for Ollama usage right Out of the Box (OOTB)
    - author
        + ollama-webui
- open-webui : Generic WebUI (Web interface) for AI models to use as a chatbot; This concept is similar to OpenAI using ChatGPT as a web interface to interact with the AI Language Model (Recommended)
    - author
        + open-webui
- phpmyadmin : A widely-used Database Management System WebUI made in php
- pi-hole : DNS server, DNS sinkhole, Firewall
- portainer : A Docker container management platform
- postgresql : Database Management System Utility
- prometheus : Open Source systems and service monitoring and metrics system
    - author
        + prom
- registry : CNCF Docker private remote repository/registry server
    - author
        + registry
- samba-file-server : File Server
- searx-ng : Self-hosted free internet metasearch engine which aggregates results from various search engine services and databases
- scrypted : Self-Hosted Home Hub devices (Ring, Unifi, Google Home etc) management WebUI
- sqlite-browser : WebGUI Database Management System
    - author
        + linuxserver
- sqlite-web : A WebUI for SQLite
- syncthing : Self-hosted file synchronization service
- tailscale : Tailscale daemon for the tunnel Mesh network VPN service based on Wireguard VPN without the need to port forward
- unbound : DNS Resolver
- upsnap : A simple wake on lan web app written with SvelteKit, Go and PocketBase.
    - author
        + seriousm4x
- uptime kuma : Monitoring utility
    - author
        + louislam
- vhs : A screen recorder CLI utility that allows you to create terminal GIFs as code for integration testing and demoing your CLI tools.
    - author
        + charmbracelet
- watchtower : Open Source automated docker container base image updater
    - author
        + containrrr
- wetty : WeTTY = Web + TTY, WeTTY is a Web Application terminal over HTTP and HTTPS.
    - author
        + wettyoss
- whitebophir : Open Source, Self-hosted Collaborative Whiteboard alternative
    - author
        + lovasoa
- wireguard : VPN server
- yt-dlp-webui : Self-hosted yt-dlp Web UI
- youtubedl-material : A youtube-dl/yt-dlp WebUI

### Compound
```
These services are generally bigger projects with extra features. 
As such, these projects will contain various additional dependencies, such as
    - Databases
    - Storage services
    - Networking 
    - etc etc

The individual dependency services can be found above in the 'Elemental' section

However, on the flipside, this means that if you were to use these services in your project stack, lets say - MySQL Database Server
    You do not need to deploy another instance of the database, you can just make use of that instance as a dependency for every other services.

[Template]
- service-name : service-description
    - Dependencies
        + dependency : Description
```
- bookstack : Documentation/Wiki static site generator platform
    - author
        + linuxserver
        + solidnerd
- planka : A realtime kanban board for workgroups built with React and Redux.
    - author
        + plankanban
- tubearchivist : Self-hosted YouTube Media Server with yt-dlp capability
    - author
        + tubearchivist
    - dependencies
        + elasticsearch: For dynamic searching algorithms; FOSS
        + redis: For Cache and ephemeral data storage

