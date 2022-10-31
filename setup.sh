<<EOF
Makefile setup script for creating docker

## Documentation
### Synopsis/Syntax
    ./setup.sh {options} [commands] <arguments...>
### Usage
- Install with a new user
    ./setup.sh --set-user [new-user-name] install

## Wiki
### Scripting Usage
- Get current user name for scripting
    docker_user="\$(./setup.sh --get-user)"
    echo -e "\$docker_user"

### Beginner's guide
- To startup your docker-compose environment
    # -d : Startup the docker-compose in the background (as a daemon)
    # --build : Automatically build all local Dockerfiles specified into images for use within the docker-compose environment
    # specify container names to startup only those specified.
    docker-compose up -d --build {container name}

- To teardown the a container in the docker-compose environment
    # Leave the container name empty to tear down the whole environment
    docker-compose down {container name}

- Stop a running container in the docker-compose environment
    docker-compose stop [container name]

- Start a stopped container in the docker-compose environment
    docker-compose start [container name]

- Restart a running container in the docker-compose environment
    docker-compose restart {container name}
EOF

## Docker Parameters
DOCKER_USER=admin # Define your docker user

## Recipes/Rules
show_help() 
{
    : "
    Display this help menu
    "
    cat << EOF
Help:
    commands:
        setup: Setup the environment and prepare for installation
        install: Install docker and setup environment to use docker
    options:
        --get-user : Get docker user, return to standard output and exit
        --set-user [new-docker-user] : Set an alternative docker user name
    flags:
        -h | --help : Display this help menu with detailed information
EOF
}

setup() 
{
    : " 
    Setup Docker Environment
    "
    
    # Update Online Repositories
    apt update && apt upgrade
}

install()
{
    : " 
    Install repositories and setup docker settings
    "
    # Setup the environment and prepare for installation
    setup

    # Install Docker and docker-compose
    apt install docker docker-compose

    # Add user to docker-group
    useradd -aG docker ${DOCKER_USER}

    # Start docker service
    systemctl start docker

    # Enable docker service
    systemctl enable docker
}

install_complete()
{
    : "
    When installation of docker is completed
    "
    printf "%s\n\n" "Installation of docker is completed."
    printf "[+] %s\n" "User [$DOCKER_USER] has been added to the group [docker]"
    printf "[+] %s\n" "Service [docker] has been started."
    printf "[+] %s\n" "Service [docker] has been enabled, you do not have to start it manually after restarting."
    
    echo ""
   
    echo -e "Please restart after this to take full effect of the docker group"
}

main()
{
    argv=("$@")
    argc="${#argv[@]}"

    if [[ "$argc" -gt 0 ]]; then
        while [[ "$1" != "" ]]; do
            case "$1" in
                # Commands
                "setup")
                    setup
                    shift 1
                    ;;
                "install")
                    install
                    install_complete
                    shift 1
                    ;;
                # Options
                "-h" | "--help")
                    # Show help menu
                    show_help
                    shift 1    
                    ;;
                "--get-user")
                    # Get docker user and return it and quit
                    echo -e "$DOCKER_USER"
                    break
                    ;;
                "--set-user")
                    # Set Docker user
                    if [[ "$2" != " " ]]; then
                        # echo -e "==========="
                        # echo -e "| Changes |"
                        # echo -e "==========="
                        # echo -e "Old docker user : $DOCKER_USER"
                        DOCKER_USER="$2"
                        # echo -e "New docker user : $DOCKER_USER"

                        shift 2
                    else
                        echo -e "Alternative docker user not specified."
                        shift 1
                    fi
                    ;;
                *)
                    # Default
                    show_help
                    ;;
            esac
        done
    else
        echo -e "No arguments provided."
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

