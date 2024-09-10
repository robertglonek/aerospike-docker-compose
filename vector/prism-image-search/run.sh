#!/bin/bash

command -v docker-compose >/dev/null 2>&1
if [ $? -ne 0 ]
then
    echo "ERROR: 'docker-compose' does not appear to be installed!"
    exit 1
fi

if [ ! -f ./container-volumes/avs/etc/aerospike-vector-search/features.conf ]; then
    echo "ERROR: './container-volumes/avs/etc/aerospike-vector-search/features.conf' not found"
    exit 1
fi

if [ ! -f ./container-volumes/aerospike/etc/aerospike/features.conf ]; then
    echo "ERROR: './container-volumes/aerospike/etc/aerospike/features.conf' not found"
    exit 1
fi

case $1 in
    up)
        docker-compose up -d
        ;;
    down)
        docker-compose down
        ;;
    start)
        docker-compose start
        ;;
    stop)
        docker-compose stop
        ;;
    web)
        echo "http://127.0.0.1:8080 OR http://0.0.0.0:8080"
        ;;
    status)
        docker-compose ps
        ;;
    logs)
        docker-compose logs -f
        ;;
    *)
        echo "Usage: $0 command"
        echo "  up      - create and start services"
        echo "  down    - stop and destroy services"
        echo "  start   - start stopped services"
        echo "  stop    - stop services"
        echo "  web     - show access URL"
        echo "  status  - show service status"
        echo "  logs    - tail service logs"
        ;;
esac
