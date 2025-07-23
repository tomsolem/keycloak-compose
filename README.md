# Keycloak Compose

A simple Docker Compose project to set up a development environment with Keycloak 26.1.2 and PostgreSQL 17.3.

Keycloak is already set up to output extremely verbose logs. Debugging and metrics are enabled as well.

## Getting Started

### Prerequisites

- Docker
- Docker Compose

### Running the Project

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Run the following command to start the services:

    ```sh
    docker compose up -d
    ```

### Accessing Keycloak

- Admin username: `temp-admin`
- Admin password: `temp-admin`

Once the services are up and running, you can access the admin console at the following address:

[http://localhost:8080](http://localhost:8080)

#### Other endpoints
- Hostname debugging: [http://localhost:8080/realms/master/hostname-debug](http://localhost:8080)
- Metrics: [https://localhost:9000/management/metrics](https://localhost:9000/management/metrics)

### Customization

To customize Keycloak, edit/place your files in the `./custom` folder. All changes to this mounted volume will be checked at startup and copied over to `/opt/keycloak/`. 

### Keycloak token exchange

[Token exchange tutorial](https://keycloak.ch/keycloak-tutorials/tutorial-token-exchange/).

See `./scrpts` folder for scripts connected to tutorial.