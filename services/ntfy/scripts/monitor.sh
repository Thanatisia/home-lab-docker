: "
System Monitoring using notification
"

# Initialize Variables
i=0
TIMEOUT=5
msg=""
down_flag=false

start_monitoring()
{
    # Get arguments
    argv=("$@")
    argc="${#argv[@]}"
    TARGET_SERVER="$1"

    # Start
    echo -e "Monitoring $TARGET_SERVER..."
    # Perform while loop with sleep for timeout
    while true; do
        # Start Monitoring

        # Get current datetime
        curr_dt="$(date +'%Y-%m-%d %H:%M:%S')"

        # Print statistics
        echo -e "[$curr_dt] System up."

        # Check if downtime
        ping -c ${TIMEOUT} $TARGET_SERVER > /dev/null 

        # Check result/return code
        if [[ "$?" -gt "0" ]]; then
            # 0 = Success
            # >= 0 = Error
            
            ## Set downtime message
            msg="[$curr_dt] System down/unable to connect";

            echo -e "$msg";

            ## Raise the downtime flag
            down_flag=true;

            # Send downtime message to notifications server
            curl -k -d "${msg}" https://notifications.apps.home/Home-lab
        fi

        # Check if down flag is up (server is down)
        if [[ $down_flag == true ]]; then
            ## Check for server to come back up
            while [[ $down_flag == true ]]; do
                ## While down flag is still up
                ping -c ${TIMEOUT} $TARGET_SERVER > /dev/null

                # Check result/return code
                if [[ "$?" == "0" ]]; then
                    ## Set uptime message
                    msg="[$curr_dt]: System is back up.";
                    echo -e "$msg";

                    ## Set downtime flag to false
                    down_flag=false;

                    ## Send uptime message
                    curl -k -d "$(msg)" https://notifications.apps.home/Home-lab
                fi
            done
        fi

        # Sleep for 1 second
        sleep ${TIMEOUT}
    done
}

main()
{
    argv=("$@")
    argc="${#argv[@]}"
    TARGET_SERVER="${1:-192.168.1.1}"

    start_monitoring "$TARGET_SERVER"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
