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
- caddy : A powerful, enterprise-ready, open source web/proxy/reverse proxy server alternative to Nginx/Traefik with automatic HTTPS written in Go(lang)
- code-server : DevOps, Development utility, Web-based Code Editor
    - author
        + 32-bit : linuxserver
- drawio : Self-hosted implementation of the online UML drawing utility of the same name
    - author
        + jgraph
- duckdns : Dynamic DNS auto-updater service
- excalidraw : Network Diagram and Drawing Tool
    - author
        + excalidraw
- file-browser : Utility
- gitea : Self-hosted Git remote repository hosting service
- guacamole : Network-based Browser-based Remote Desktop Protocol/utility
- headscale : Self-hosted master node/server implementation of the tailscale mesh network project
- heimdall : Dashboard
- homer : Dashboard
- ipsec-vpn-server : VPN Server
- jellyfin : Media Server
- mariadb : Database Management System Utility
- metube : Self-hosted yt-dlp Web UI
- minecraft-server : Docker image that provides a Minecraft Server that will automatically download selected version at startup
    - author
        + itzg
- mysql : Database Management System Utility
- nerd-font-patcher : A font patcher for the Nerd Fonts projects that patches targeted fonts with a high number of Glyph(icon)/Font Icon
- Nextcloud : NAS service
- nginx-proxy-manager : Proxy server, Reverse proxy server
- nginx-reverse-proxy : Proxy server, Reverse proxy server, Web server
- nodejs : DevOps, Development utility, web server
- phpmyadmin : A widely-used Database Management System WebUI made in php
- pi-hole : DNS server, DNS sinkhole, Firewall
- portainer : A Docker container management platform
- postgresql : Database Management System Utility
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
- uptime kuma : Monitoring utility
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
- tubearchivist : Self-hosted YouTube Media Server with yt-dlp capability
    - author
        + tubearchivist
    - dependencies
        + elasticsearch: For dynamic searching algorithms; FOSS
        + redis: For Cache and ephemeral data storage

