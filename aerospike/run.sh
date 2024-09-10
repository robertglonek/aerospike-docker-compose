#!/bin/bash

command -v docker-compose >/dev/null 2>&1
if [ $? -ne 0 ]
then
    echo "ERROR: 'docker-compose' does not appear to be installed!"
    exit 1
fi

if [ ! -f ./etc/features.conf ]; then
    echo "ERROR: ./etc/features.conf file not found"
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
        echo "  status  - show service status"
        echo "  logs    - tail service logs"
        ;;
esac
