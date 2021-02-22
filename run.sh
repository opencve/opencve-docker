#!/bin/bash

set -e

# Setup helper functions
RED='\033[1;31m'
NC='\033[0m' # No Color

function error {
    echo -e "${RED}${1}${NC}"
}

case "$1" in

    'celery-worker')
        shift
        exec opencve celery worker -l INFO $@
    ;;

    'celery-beat')
        shift
        exec opencve celery beat -l INFO $@
    ;;

    'webserver')
        shift
        exec opencve webserver $@
    ;;

    *)
        error "Command not supported!"
        exit 1
	;;

esac
