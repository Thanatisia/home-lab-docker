# TubeArchivist

## Information
### Project
+ Project Author: tubearchivist
+ Project Name: tubearchivist
- Repositories:
    + GitHub: https://github.com/tubearchivist/tubearchivist
    - DockerHub
        + tubearchivist-es : https://hub.docker.com/r/bbilly1/tubearchivist-es

### Background
```
Self-hosted YouTube Media Server with yt-dlp capability
```

## Setup
### Dependencies
+ docker
+ docker-compose
+ redis
+ elasticsearch

### Pre-Requisites
- Create your mount points as necessary
    ```console
    mkdir -p ./tubearchivist/{cache,media,redis,es}
    ```
- Possible Errors
    - Maybe these locations are not writeable
        - Change/Set permission of folders to match the permissions with the UID and GID of elasticsearch process within the container
            ```console
            chown 1000:0 -R /path/to/mount/point
            ```
    - Set the maximum map count to 262144
        - Temporarily set value
            ```console
            sudo sysctl -w vm.max_map_count=262144
            ```
        - Permanent change
            - Ubuntu Server
                - Add `vm.max_map_count = 262144` to the file '/etc/sysctl.conf'
                    ```console
                    echo -e "vm.max_map_count = 262144" >> /etc/sysctl.conf
                    ```
            - Arch-based
                - Create file '/etc/sysctl.d/max_map_count.conf'
                    ```console
                    touch /etc/sysctl.d/max_map_count.conf
                    ```
                    - Write `vm.max_map_count = 262144` to file
                        ```console
                        echo -e "vm.max_map_count = 262144" >> /etc/sysctl.d/max_map_count.conf
                        ```

## Documentation

## Wiki
### Customization/Configuration
#### Project Filesystem Structure
+ ElasticSearch Data Folder: /usr/share/elasticsearch/data
+ Redis cache folder: /data
+ TubeArchivist cache data folder: /cache
+ TubeArchivist YouTube media folder: /youtube

#### Container Volume Mount Points
+ "./tubearchivist/es:/usr/share/elasticsearch/data:rw"    # check for permission error when using bind mount, see readme
+ "./tubearchivist/redis:/data:rw"
+ "./tubearchivist/media:/youtube:rw"
+ "./tubearchivist/cache:/cache:rw"

## Resources

## References
+ [ElasticSearch Guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)
+ [GitHub - TubeArchivist - Docker-compose example](https://github.com/tubearchivist/tubearchivist/blob/master/docker-compose.yml)
+ [TubeArchivist Docs](https://docs.tubearchivist.com/installation/docker-compose/)

## Remarks
