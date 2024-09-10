# Aerospike Vector Search (AVS) Docker Compose

## Prerequisites

* docker / podman
* docker-compose

## Getting started

### Clone this repository

```bash
git clone https://github.com/robertglonek/aerospike-docker-compose.git
cd aerospike-docker-compose/vector/docker
```

### License

Put a valid `features.conf` file in `./config/features.conf`

### Create the stack

```bash
docker-compose up
```

### Access

The vector search port is `5050`.

### Destroy the stack

```bash
docker-compose down
```
