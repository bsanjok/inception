Certainly! Below is the README file for your GitHub repository based on your provided `docker-compose.yml` configuration:

---

# Dockerized WordPress Environment with NGINX, MariaDB, and Additional Services

This repository provides a Docker Compose configuration for setting up a WordPress environment with NGINX as the web server, MariaDB as the database server, and additional services like FTP server, Adminer, Redis, Prometheus, cAdvisor, and a custom site.

## Prerequisites

Before getting started, ensure you have the following installed on your system:

- Docker
- Docker Compose

## Usage

1. Clone this repository:

    ```bash
    git clone <repository_url>
    ```

2. Navigate into the cloned repository directory:

    ```bash
    cd <repository_directory>
    ```

3. Create a `.env` file and populate it with necessary environment variables. You can use `.env.example` as a template.

4. Start the Docker containers:

    ```bash
    docker-compose up -d
    ```

5. Access WordPress via your web browser:

    ```
    http://localhost:8090
    ```

## Services

### NGINX

NGINX serves as the web server for hosting WordPress.

- **Ports**: 443 (HTTPS), 8090 (HTTP)
- **Volumes**: Mounts WordPress files to `/var/www/html`

### MariaDB

MariaDB is used as the database server for WordPress.

- **Volumes**: Mounts MariaDB data to `/var/lib/mysql`

### WordPress

WordPress service running on top of NGINX.

- **Volumes**: Mounts WordPress files to `/var/www/html`
- **Dependencies**: Depends on MariaDB service

### FTP Server

Provides FTP server functionality for file transfer.

- **Ports**: 21 (FTP), 20 (FTP Data), 21100 (Passive FTP Data)
- **Volumes**: Mounts WordPress files to `/var/www/html`

### Adminer

Adminer is a web-based database management tool for MariaDB.

- **Dependencies**: Depends on MariaDB service

### Redis

Redis is an in-memory data structure store, used for caching.

- **Ports**: 6379 (Redis)

### Prometheus

Prometheus is used for monitoring and alerting.

- **Ports**: 9090 (Prometheus UI)

### cAdvisor

cAdvisor provides container monitoring.

- **Ports**: 8080 (cAdvisor UI)

### MySite

Custom service for your site.

- **Ports**: 8082 (Custom Site)

## Volumes

- **wordpress**: Mounts WordPress files from host to container.
- **mariadb**: Binds MariaDB data from host to container.

## Networks

- **inception**: Bridge network driver.
