# Nerd Font Patcher for Docker

```
Nerd Fonts Patcher 

thanks to [https://github.com/ryanoasis] and the nerd fonts team for the ability to patch our own fonts into Nerd Fonts on top of providing fantastic font icon packs for ricing.
```

## Information
### Project
+ Project Author: ryanoasis
+ Project Name: nerd-fonts
+ Image: nerdfonts/patcher
- Repositories:
    + GitHub: https://github.com/ryanoasis/nerd-fonts
- Default Filesystem Structure:
    ```
    ./
    |
    |-- fonts/
        |
        |-- in/
        |-- out/
    ```

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Create 2 folders in the path specified in your docker-compose volume mounts (default: your current working directory)
    + input fonts folder for '/in' 
    + output fonts folder for '/out'

## Documentation

### Before Running
- Before starting up the container
    + Place your target font that you want to patch in your '/in' mounted volume

### Using docker run
- Starting up
    - Note: 
        + You do not need to keep the container running after starting up the container and patching the fonts as it is a one-time operation, 
        + as such, you can just ignore them, however, if you would like to keep the patcher up for manual patching, feel free to follow the instructions below
    ```console
    docker run -itd --name=nerdfonts-patcher -v /path/to/input/fonts:/in -v /path/to/output/folder:/out nerdfonts/patcher
    ```

- Teardown/Shutdown
    ```console
    docker container stop nerdfonts-patcher && docker container rm nerdfonts-patcher
    ```

- Start a stopped container
    ```console
    docker container start nerdfonts-patch
    ```

- Stop a running container
    ```console
    docker container stop nerdfonts-patcher
    ```

- Restart a running container
    ```console
    docker container restart nerdfonts-patcher
    ```

### Using docker-compose
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
    docker-compose start nerdfonts-patcher
    ```

- Stop a running container
    ```console
    docker-compose stop nerdfonts-patcher
    ```

- Restart a running container
    ```console
    docker-compose restart nerdfonts-patcher
    ```


## Wiki
### Components
+ input folder : This is where you place the original font before you startup the docker environment.
+ output folder : This is where the converted/patched font will be placed after the docker environment has finished executing the patcher.

### File Structure
- This is basically the structure of the docker operation 
    - In Host system
        - Input ('/in') folder
            ```
            path/
            |
            |-- to/
                |
                |-- volume/
                    |
                    |-- in/
    	    ```
        - Output ('/out') folder
            ```
            path/
            |
            |-- to/
                |
                |-- volume/
                    |
                    |-- out/
    	    ```

### TODO (Pipeline)

## Resources

## References
+ [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Remarks
