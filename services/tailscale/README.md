# Tailscale docker-compose

## Information
### Program
+ Docker Hub: https://hub.docker.com/r/tailscale/tailscale
+ GitHub: https://github.com/tailscale/tailscale

### Background Information and Understanding of Tailscale mesh/tunnel network
- The head/tailscale (commonly known as scale) mesh network is a web of interconnected devices whereby 
    + Every authorized and authenticated device in the scale mesh network are valid exit nodes that you can set to access their local network
    + In the case of mobile devices, just the server they are beaconing

## Setup

### Steps
- PC
    - Login to tailscale Web Admin using either your personal email, gmail etc
    - Exit Node Setup
        + This is to set the network you wish to access within the scale mesh network
        + Click on the button next to your target node
        + Click "Edit Route"
        + Set as Exit Node
- Mobile
    + Install the tailscale mobile application from the playstore/fdroid
    - (Optional) Using your own headscale instance
        + Click on the top right hand corner (...) about 6 times and it should show a "Use custom node"
        + Click on that buton
    + Login to your mesh network
    - Exit Node Setup
        + Click on the top right corner menu
        + Click "Run exit node"


### Pre-Requisites
-  Generate API Key for authentication
    > Used with '--auth'
    + Click on Settings
    + Click on Keys
    + Click on 'Generate auth keys'
    + Record the keys and place it with the tailscale node definitions
    + Startup the node

## Documentations
### Using CLI
TBC 

### Using WebUI Admin
TBC

## Wiki
### Environment Variables
+ TS_AUTHKEY=tskey-auth-[key] # To use an auth key for an ephemeral node; Generate from your admin Dashboard; a Tailscale auth key, i.e. what you'd pass to tailscale --authkey=
+ TS_KUBE_SECRET  : if running in Kubernetes, secret name where to store Tailscale state
+ TS_DEST_IP      : destination IP, if deploying Tailscale as a proxy
+ TS_ROUTES       : tailscale --advertise-routes=
+ TS_ACCEPT_DNS   : tailscale --accept-dns=[true|false]; To opt out of Tailscale DNS
+ TS_SOCKET       : tailscale --socket=
- TS_EXTRA_ARGS   : any other CLI flags for tailscale
    + --advertise-exit-node : To allow setting of exit nodes
+ TS_USERSPACE    : tailscaled --tun=userspace-networking
+ TS_STATE_DIR=/var/lib/tailscale    : tailscaled --statedir=[path-to-state-directory]; To make the machine maintain the same IP and name on reboot
+ TS_SOCKS5_SERVER: set to an addr+port for the SOCKS5 proxy like :1055, which will be passed to tailscaled --socks5-server=:1055
+ TS_OUTBOUND_HTTP_PROXY_LISTEN: set to an addr+port for the HTTP proxy like :1055, which will be passed to tailscaled --outbound-http-proxy-listen=:1055
+ TS_TAILSCALED_EXTRA_ARGS: any other flags for tailscaled
+ TS_HOSTNAME=Tailscaled: To set a unique machine name for the device

## Resources

## References
+ [Tailscale forums - How do you create a persistent Docker TS container](https://forum.tailscale.com/t/how-do-you-create-a-persistent-docker-ts-container/4805)
+ [StackOverflow - Set machine name for docker-compose](https://stackoverflow.com/questions/41501921/set-machine-name-for-docker-compose)
+ [wundertech - How to setup tailscale on Docker](https://www.wundertech.net/how-to-set-up-tailscale-on-docker/)
+ [Tailscale - CLI](https://tailscale.com/kb/1080/cli/)
+ [Tailscale Dockerhub and baasic documentation](https://hub.docker.com/r/tailscale/tailscale)
+ [Tailscale - Troubleshooting](https://tailscale.com/kb/1023/troubleshooting/)

## Remarks
