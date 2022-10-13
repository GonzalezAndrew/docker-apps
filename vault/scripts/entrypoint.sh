#!/bin/sh
set -e 
OPTION=$1

usage() {
    echo "Usage: start-server | dry-run"
    echo "start: First time run, will start a new Vault server"
    echo "dry: Start up of server"
}

startserver() {
    ./start-server.sh
}
initserver() {
    ./init-server.sh
}
dryrun() {
    tail -f /dev/null
}

case $OPTION in
start)
    startserver &
    initserver 
    dryrun
    ;;
dry)
    dryrun
    ;;
*)
    usage
    ;;
esac

exec "$@"
