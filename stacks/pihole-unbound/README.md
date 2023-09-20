# Pihole + Unbound containerized

## Information
### Background
```
This stack is on running a DNS Server/Sinkhole + DNS Resolver combo.
```

### Issues
```
Classically, if you were to install pihole and unbound on bare metal, or on separate machines 
    you should be able to communicate on the same machine relatively easily as they are able to communicate with each other.

However, with containerization comes isolation, this means that by default (and by design), the pihole and unbound containers are unable to communicate with each other
    - not without some Network Address administration such as having a VLAN subnet group

Assigning VLAN subnet groups + setting a virtual static IP address allows you to join 2 containers that are, by default, isolated from each other together so that they are able to communicate
    + This ensures that the DNS server (pihole) and the DNS resolver (unbound) are able to communicate and send data to each other
```

## Setup
### Dependencies
+ docker
+ docker-compose

### Pre-Requisites
- Understand some understanding of 
    - Computer Networks 
        + OSI 7 layers
        + TCP/IP
        - Subnetting
            + Network Address
            + Subnet Prefix
    - docker networking
        + docker network modes
        + docker bridging
    - container isolation
        + communication between containers

## Documentation

### Components
- port forwarding (publish)
    - Translate/forward/map ports from the host system to the container
        + Format: `[ip-address]:[host-system-port]:[container-port]`

- docker VLAN subnetting
    - VLAN group properties
        + name: The name of the VLAN network group you wish to assign/attach to your containers
        + driver: The network type of the VLAN group you wish to create; Default = bridge
        - ipam: Network IP Address Management of the VLAN network group
            - config: Set the configurations of the IPAM
                - subnet: Set the subnet address of the VLAN group (i.e. 172.28.0.0/16)
                    - 172.28.0.0 = Subnet Network Address
                    - /16 = The Prefix; i.e. 8.8.8.8

## Wiki

### Network Configuration and Structure Design
- docker-compose
    - Explanation
        - VLAN group properties
            + name: The name of the VLAN network group you wish to assign/attach to your containers
            + driver: The network type of the VLAN group you wish to create; Default = bridge
            - ipam: Network IP Address Management of the VLAN network group
                - config: Set the configurations of the IPAM
                    - subnet: Set the subnet address of the VLAN group (i.e. 172.28.0.0/16)
                        - 172.28.0.0 = Subnet Network Address
                        - /16 = The Prefix; i.e. 8.8.8.8

    - Goal
        - The purpose of the VLAN subnet group via bridge is to join 2 containers that are, by default, isolated from each other together so that they are able to communicate
            + If you were to install pihole and unbound on bare metal, you will be able to communicate on the same machine relatively easily
            + However, due to the containerization property of running the 2 containers separately, you need some bridging to ensure that - in this case - the DNS server (pihole) and the DNS resolver (unbound) are able to communicate and send data to each other
    ```yaml
    ## Specify VLAN group name
    networks:
        [vlan-network-name]:
            ## Specify VLAN group properties
            name: [vlan-network-group-name]
            driver: bridge
            ipam:
                config:
                    - subnet: 172.28.0.0./16
    ```

## Resources

## References

## Remarks

