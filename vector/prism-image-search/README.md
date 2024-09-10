# Aerospike-Vector-Prism demo stack

## Prerequisites

* docker / podman
* docker-compose

## Getting started

### Clone this repository

```bash
git clone https://github.com/robertglonek/aerospike-docker-compose.git
cd aerospike-docker-compose/vector/prism-image-search
```

### License

Put a valid `features.conf` file in `./container-volumes/aerospike/etc/aerospike/features.conf` and `./container-volumes/avs/etc/aerospike-vector-search/features.conf`

### Add images

Put images to be used in `./container-volumes/prism/images/`

### Usage help

```bash
./run.sh
```

### Run the create script

```bash
./run.sh up
```

### Get URL to connect to prism

```bash
./run.sh web
```

### Destroy the stack

```bash
./run.sh down
```
