# Kanban Board - Planka

## Information
### Background
+ Plankan is a realtime kanban board for workgroups built with React and Redux.

- Features
    + Create projects, boards, lists, cards, labels and tasks
    + Add card members, track time, set a due date, add attachments, write comments
    + Markdown support in a card description and comment
    + Filter by members and labels
    + Customize project background
    + Real-time updates
    + User notifications
    + Internationalization

### Project
- Repository URL: 
    + [Planka Repo](https://github.com/plankanban/planka)
+ Marketing Page: https://planka.app/

### Container
- Docker Repository:
    - Planka
        + GitHub Container Repository: ghcr.io/plankanban/planka:latest
    + Postgresql: 
        + Docker Hub: https://hub.docker.com/_/postgres/tags
- Images:
    + Planka: ghcr.io/plankanban/planka:latest
- Resources and Files:
    + GitHub Docker-compose file: https://github.com/plankanban/planka/blob/master/docker-compose.yml

## Setup
### Docker
#### Dependencies
+ docker
+ docker-compose
+ postgresql

#### Pre-Requisites
- Edit docker-compose.yaml configuration file
    - Generate a secret key for the database authentication
        - Using OpenSSL
            + Paste the generated key in the 'SECRET_KEY' variable
            ```console
            openssl rand -hex 64
            ```
    + Change the 'BASE_URL' to the URL you wish to access the WebUI at
    - Setup your default admin user
        - Uncomment the lines starting with 'DEFAULT_ADMIN_*'
            + DEFAULT_ADMIN_NAME : Default admin's profile name
            + DEFAULT_ADMIN_EMAIL : Default admin's email
            + DEFAULT_ADMIN_USERNAME : Default admin's username
            + DEFAULT_ADMIN_PASSWORD : Default admin's password
    - (Optional) Database
        - The default example configuration for the PostgreSQL database connection stream is added in the config by default
            - If you have a dedicated PostgreSQL database instance already setup
                - You can setup 
                    + the table as necessary in your database instance and
                    + set the database stream to point to your personal database instance instead

#### Using docker run
- Starting up
    - PostgreSQL Database
        ```console
        docker run -itd --name=postgresql \
            --restart=unless-stopped \
            -e POSTGRES_DB=planka \ 
            -e POSTGRES_HOST_AUTH_METHOD=trust \
            -v /path/to/postgresql/data:/var/lib/postgresql/data \
            --health-cmd="pg_isready -U postgres -d planka" \
            --health-interval=10s \
            --health-timeout=5s \
            --health-retries=5 \
            postgres:[tag]
            ```
    - Plank
        ```console
        docker run -itd --name=planka \
            --restart=unless-stopped \
            # The WebUI Base URL
            -e BASE_URL=http://[server-ip|domain]:[web-ui-port-number] \
            # The Database connection stream
            -e DATABASE_URL=postgresql://postgres@postgres/planka \
            # Secret Key for communication to the database; generate the secret key using 'openssl rand -hex 64'
            -e SECRET_KEY=notsecretkey \
            # Default admin user information; Change this before starting up
            ## Do not remove if you want to prevent this user from being edited/deleted
            -e DEFAULT_ADMIN_EMAIL=demo@demo.demo \
            -e DEFAULT_ADMIN_PASSWORD=demo \
            -e DEFAULT_ADMIN_NAME=Demo Demo \
            -e DEFAULT_ADMIN_USERNAME=demo \
            -p 1337:1337 \
            -v path/to/planka/app/public/user-avatars:/app/public/user-avatars \
            -v path/to/planka/app/public/project-background-images:/app/public/project-background-images \
            -v path/to/planka/app/private/attachments:/app/private/attachments \
            ghcr.io/plankanban/planka:latest
        ```

- Teardown/Shutdown
    ```console
    docker container stop planka && docker container rm planka
    ```

- Start a stopped container
    ```console
    docker container start planka
    ```

- Stop a running container
    ```console
    docker container stop planka
    ```

- Restart a running container
    ```console
    docker container restart planka
    ```

#### Using docker-compose
- Prepare
    + Please refer to [Template - docker compose](#docker-compose) for more information

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
    docker-compose start planka
    ```

- Stop a running container
    ```console
    docker-compose stop planka
    ```

- Restart a running container
    ```console
    docker-compose restart planka
    ```

### Host Machine
#### Dependencies
+ postgresql
+ postgresql-contrib
+ nodejs

#### Pre-Requisites
- Setup PostgreSQL
    - Create User and Database for Planka in Postgresql
        - Create User
            - The script will prompt you with some choices and, 
                - based on your responses, 
                    + execute the correct Postgres commands to create a user to your specifications.
                - Choices
                    + Name of role to add
                    + Set as superuser
            ```console
            sudo -u postgres createuser --interactive
            ```
        - Create Database
            - Change directory to /tmp to prevent a sudo permission error
                ```console
                cd /tmp
                ```
            - Create the database
                ```console
                sudo -u postgres createdb planka
                ```
            - Create a Unix user and test database access and change the password
                - Create Unix user
                    ```console
                    sudo adduser planka
                    ```
                - Login to the database as user 'planka'
                    ```console
                    sudo -u planka psql
                    ```
                - Change the database password
                    ```console
                    ALTER USER planka PASSWORD 'YOUR_DATABASE_PASSWORD';
                    ```
                - Close the database
                    ```console
                    \q
                    ```

- Setup NodeJS
    - Install using package manager
        - apt-based
            ```console
            sudo apt install nodejs
            ```
        - pacman-based
            ```console
            sudo pacman -S nodejs
            ```
    - Verify installation
        ```console
        node -v
        ```

- Setup Planka
    - Create Planka installation directory
        ```console
        sudo mkdir -pv /var/www/planka
        ```

    - Set planka installation directory as chown 'planka:planka'
        ```console
        sudo chown -R planka:planka /var/www/planka
        ```

    - Change user to 'planka'
        ```console
        sudo -i -u planka
        ```

    - Change directory to '/var/www/planka'
        ```console
        cd /var/www/planka
        ```

    - Obtain the source file
        - Using prebuild release
            - Download prebuild version
                ```console
                curl -fsSL https://github.com/plankanban/planka/releases/download/v1.14.2/planka-prebuild-v1.14.2.zip -o planka-prebuild.zip
                ```
            - Unzip the zip file to webserver directory ('/var/www')
                ```console
                unzip planka-prebuild.zip -d /var/www/
                ```
            - Delete zip file
                ```console
                rm planka-prebuild.zip
                ```
            - Change directory into 'planka'
                ```console
                cd planka
                ```
            - Install dependencies via npm
                ```console
                npm install
                ```

    - Configure environment variables
        - Copy the '.env.sample' sample environment variable file to modify
            ```console
            cd .env.sample .env
            ```
        - Generate a secret key for the database authentication
            - Using OpenSSL
                ```console
                openssl rand -hex 64
                ```
        - Edit the '.env' file
            + Paste the generated key in the 'SECRET_KEY' variable
            - Your .env file should look like this
                ```
## Required
BASE_URL=http://YOUR_DOMAIN_NAME:YOUR_PORT
DATABASE_URL=postgresql://planka:YOUR_DATABASE_PASSWORD@localhost/planka
SECRET_KEY=YOUR_GENERATED_KEY

## Optional

# TRUST_PROXY=0
# TOKEN_EXPIRES_IN=365 # In days

# related: https://github.com/knex/knex/issues/2354
# As knex does not pass query parameters from the connection string we
# have to use environment variables in order to pass the desired values, e.g.
# PGSSLMODE=<value>

# Configure knex to accept SSL certificates
# KNEX_REJECT_UNAUTHORIZED_SSL_CERTIFICATE=false

DEFAULT_ADMIN_EMAIL=YOUR_ADMIN_EMAIL # Do not remove if you want to prevent this user from being edited/deleted
DEFAULT_ADMIN_PASSWORD=YOUR_ADMIN_PASSWORD
DEFAULT_ADMIN_NAME=YOUR_ADMIN_NAME
DEFAULT_ADMIN_USERNAME=YOUR_ADMIN_USERNAME

# OIDC_ISSUER=
# OIDC_CLIENT_ID=
# OIDC_CLIENT_SECRET=
# OIDC_SCOPES=openid email profile
# OIDC_ADMIN_ROLES=admin
# OIDC_ROLES_ATTRIBUTE=groups
# OIDC_IGNORE_ROLES=true

## Do not edit this

TZ=UTC
                ```
            ```console
            $EDITOR .env
            ```

#### Start server
- Start planka the first time
    ```console
    npm run db:init && npm start --prod
    ```

### Accessing
- To access the Web-SSH browser
    - HTTP
        - Default
            + Open `http://[server-ip-address]:[web-ui-port-number]`

## Documentations

### Environment Variables
#### PostgreSQL
+ `POSTGRES_DB=planka` : Specify the name of the database to connect to
+ `POSTGRES_HOST_AUTH_METHOD=trust` : PostgreSQL database host authentication method

#### Planka
+ `BASE_URL=http://[server-ip|domain]:[web-ui-port-number]` :  The WebUI Base URL
- `DATABASE_URL=postgresql://postgres@postgres/planka`      : The Database connection stream
    - Examples
        + Connect to a local instance            : `DATABASE_URL=postgresql://postgres@postgres/[database-name]`
        + Connect to an existing remote instance : `DATABASE_URL=postgresql://[username]:[password]@[database-server-url]/[database-name]`
+ `SECRET_KEY=notsecretkey`                                 : Secret Key for communication to the database; generate the secret key using 'openssl rand -hex 64'

+ `TRUST_PROXY=0`        : Enable/Disable Proxy Trust
+ `TOKEN_EXPIRES_IN=365` : Token Time-to-Live (TTL, aka Expiry) In days

- SSL/TLS Certification
    - PGSSLMODE=<value>
        - Explanation
            + related: https://github.com/knex/knex/issues/2354
            + As knex does not pass query parameters from the connection string we have to use environment variables in order to pass the desired values

    + KNEX_REJECT_UNAUTHORIZED_SSL_CERTIFICATE=false : Configure knex to accept SSL certificates

- Default admin user information; Change this before starting up
    + `DEFAULT_ADMIN_EMAIL=demo@demo.demo` : Do not remove if you want to prevent this user from being edited/deleted
    + `DEFAULT_ADMIN_PASSWORD=demo`
    + `DEFAULT_ADMIN_NAME=Demo Demo`
    + `DEFAULT_ADMIN_USERNAME=demo`

- OIDC
    + OIDC_ISSUER=
    + OIDC_CLIENT_ID=
    + OIDC_CLIENT_SECRET=
    + OIDC_SCOPES=openid email profile
    + OIDC_ADMIN_ROLES=admin
    + OIDC_EMAIL_ATTRIBUTE=email
    + OIDC_NAME_ATTRIBUTE=name
    + OIDC_USERNAME_ATTRIBUTE=preferred_username
    + OIDC_ROLES_ATTRIBUTE=groups
    + OIDC_IGNORE_USERNAME=true
    + OIDC_IGNORE_ROLES=true
    + OIDC_ENFORCED=true

### Networking
#### Port Forwarding/Translation/Mapping
+ 1337 : WebUI
+ 5423 : PostgreSQL database stream port

## Wiki
### Filesystem Structure
#### Folders
- postgresql
    - /var/ : The system variable files directory
        - lib/ : PostgreSQL database library directory
            - postgresql/ PostgreSQL database application directory
                - data/ : PostgreSQL database data directory

- planka
    - /app/ : The application's data directory
        - /public/ : The application's public-facing data access layer (DAL) directory
            - user-avatars/ : Place user avatars here
            - project-background-images/  : Place project background images here
        - /private/ : The application's private internal-facing data directory
            - attachments/ : Place your attachments here

#### Files 


### Docker mappings
#### Default Volumes
- PostgreSQL
    + /path/to/postgresql/data:/var/lib/postgresql/data
- Planka
    + path/to/planka/app/public/user-avatars:/app/public/user-avatars
    + path/to/planka/app/public/project-background-images:/app/public/project-background-images
    + path/to/planka/app/private/attachments:/app/private/attachments

### Templates
#### docker compose
```yaml
# Docker-compose for planka kanban board
version: "3.7"
services:
  planka:
    image: ghcr.io/plankanban/planka:latest
    restart: on-failure
    volumes:
      ## Mount volumes from host system into container
      ## [host-system-volume]:[container-volume]:[permissions]
      - path/to/planka/app/public/user-avatars:/app/public/user-avatars
      - path/to/planka/app/public/project-background-images:/app/public/project-background-images
      - path/to/planka/app/private/attachments:/app/private/attachments
    ports:
      ## Port Forward/Translate/Mapping ports from host system to container
      ## [host-ip-address]:[host-system-port]:[container-port]
      - 1337:1337
    environment:
      - BASE_URL=http://[server-ip|domain]:[web-ui-port-number]  # The WebUI Base URL
      - DATABASE_URL=postgresql://postgres@postgres/planka # The Database connection stream
      - SECRET_KEY=notsecretkey # Secret Key for communication to the database; generate the secret key using 'openssl rand -hex 64'

      # - TRUST_PROXY=0
      # - TOKEN_EXPIRES_IN=365 # In days

      # related: https://github.com/knex/knex/issues/2354
      # As knex does not pass query parameters from the connection string we
      # have to use environment variables in order to pass the desired values, e.g.
      # - PGSSLMODE=<value>

      # Configure knex to accept SSL certificates
      # - KNEX_REJECT_UNAUTHORIZED_SSL_CERTIFICATE=false

      # Default admin user information; Change this before starting up
      - DEFAULT_ADMIN_EMAIL=demo@demo.demo # Do not remove if you want to prevent this user from being edited/deleted
      - DEFAULT_ADMIN_PASSWORD=demo
      - DEFAULT_ADMIN_NAME=Demo Demo
      - DEFAULT_ADMIN_USERNAME=demo

      # - OIDC_ISSUER=
      # - OIDC_CLIENT_ID=
      # - OIDC_CLIENT_SECRET=
      # - OIDC_SCOPES=openid email profile
      # - OIDC_ADMIN_ROLES=admin
      # - OIDC_EMAIL_ATTRIBUTE=email
      # - OIDC_NAME_ATTRIBUTE=name
      # - OIDC_USERNAME_ATTRIBUTE=preferred_username
      # - OIDC_ROLES_ATTRIBUTE=groups
      # - OIDC_IGNORE_USERNAME=true
      # - OIDC_IGNORE_ROLES=true
      # - OIDC_ENFORCED=true
    depends_on:
      postgres:
        condition: service_healthy

  postgres:
    image: postgres:14-alpine
    restart: on-failure
    volumes:
      - /path/to/postgresql/data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=planka
      - POSTGRES_HOST_AUTH_METHOD=trust
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d planka"]
      interval: 10s
      timeout: 5s
      retries: 5

```

### Notes and Findings

## Resources

## References
+ [Planka Docs - Documentations - Installation - Docker - Production](https://docs.planka.cloud/docs/installation/docker/production_version)
+ [Baeldung - PostgreSQL Docker Setup](https://www.baeldung.com/ops/postgresql-docker-setup)

## Remarks


