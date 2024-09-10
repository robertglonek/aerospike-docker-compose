# Aerospike-Graph

## Prerequisites

* docker / podman
* docker-compose

## Getting started

### Clone this repository

```bash
git clone https://github.com/robertglonek/aerospike-docker-compose.git
cd aerospike-docker-compose/graph
```

### License

Put a valid `features.conf` file in `./etc/features.conf`

### Usage help

```bash
./run.sh
```

### Run the create script

```bash
./run.sh up
```

### Connect using `gremlin-console`

```bash
./run.sh console
```

### Connect using other clients

Exposed port for `gremlin-server` is `8182`

### Destroy the stack

```bash
./run.sh down
```
