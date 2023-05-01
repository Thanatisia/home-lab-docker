# Headscale setup

## Steps
1. [Prepare headscale configuration file](#prepare-headscale-configuration-file)

## Process

### Prepare headscale configuration file
+ Configuration Path: /etc/headscale/config.yaml
+ Configuration File Name: headscale.yaml (Ensure it is mapped to the configuration path as config.yaml)
- Defaults
    + Server URL: http://domain:8080
    + Listening Address: 0.0.0.0:8080
    + Metrics Listening Address: 127.0.0.1:9090
- Template
    ```yaml
    server_url: http://[listening-server-domain]:[listening-server-port]
    listen_addr: 0.0.0.0:[listening-port]
    metrics_listen_addr: 127.0.0.1:9090
    private_key_path: /var/lib/headscale/private.key
    noise:
      private_key_path: /var/lib/headscale/noise_private.key

    ip_prefixes:
      # - fd7a:115c:a1e0::/48
      - 100.64.0.0/10

    # Disables the automatic check for headscale updates on startup
    disable_check_updates: true

    db_type: sqlite3
    db_path: /var/lib/headscale/db.sqlite

    log:
      format: text
      level: info

    dns_config:
      override_local_dns: true
      nameservers:
        - 1.1.1.1
        - 1.0.0.1
        # - 2606:4700:4700::1111
        # - 2606:4700:4700::1001

      magic_dns: true
      base_domain: luislavena.info

    logtail:
      enabled: false
    ```