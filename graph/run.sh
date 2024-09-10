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
        RET=1
        while [ $RET -ne 0 ]
        do
            docker-compose logs | grep console-is-ready
            RET=$?
            [ $RET -ne 0 ] && sleep 1
        done
        echo "=== gremlin-server port: 8182 ==="
        ;;
    down)
        docker-compose down
        ;;
    start)
        TS=$(date +%Y-%m-%dT%H:%M:%S)
        docker-compose start
        RET=1
        while [ $RET -ne 0 ]
        do
            docker-compose logs --since $TS | grep console-is-ready
            RET=$?
            [ $RET -ne 0 ] && sleep 1
        done
        echo "=== gremlin-server port: 8182 ==="
        ;;
    stop)
        docker-compose stop
        ;;
    console)
        docker-compose exec gremlin-console /opt/gremlin-console/bin/gremlin.sh
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
        echo "  console - attach to tinkerpop/gremlin-console"
        echo "  status  - show service status"
        echo "  logs    - tail service logs"
        ;;
esac
