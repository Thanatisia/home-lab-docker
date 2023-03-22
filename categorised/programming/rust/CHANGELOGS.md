# CHANGELOGS

## Changes
- 2023-03-21 1443H | fixes
    - Fixed docker-compose of Rust official image to work without a custom Dockerfile image (thanks 'tty: true')
    - Added new key-values
        + `tty: true`   : Corresponds to docker run's `docker run -itd`; To let rust container remain up so that user can keep compiling whenever he wants via `docker exec -it rust /bin/bash -c "command"`
        + `working_dir` : Corresponds to Dockerfile's `WORKDIR [working directory]`; To set the startup working directory of the container

