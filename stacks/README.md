# Services

```
This folder contains docker image/services that uses effectively a stack, such as MERN, Nextcloud-LetsEncrypt-MySQL, pihole-unbound. 

For more information on the individual services, please refer to the 'services' folder

Note:
    - The docker-compose and/or service files in here does not necessarily need to be stacks, it can also be services that requires more than 1 external containers
        - i.e.
            + TubeArchivist
```

## Stack List
- pihole-unbound : DNS Sinkhole/Server + DNS Resolver combination
    - Services:
        + pihole : DNS Sinkhole/Server
        + unbound : DNS Resolver; similar to, and can be replaced with bind9


