#!/usr/bin/env bash

export COMPOSE_FILE="${1:-docker-compose.yml}"
export SERVICE_PREFIX="${2:-local}"

# get fully qualified hostname
HOSTNAME=$(hostname -f)
if [[ -z ${HOSTNAME} ]]; then
    # if it doesn't work get only hostname
    HOSTNAME=$(hostname)
fi
export HOSTNAME=${HOSTNAME}

if test -f ${COMPOSE_FILE}; then
    echo "Deploying ${SERVICE_PREFIX}* services using ${COMPOSE_FILE} file."

    # pull the images
    docker-compose -f ${COMPOSE_FILE} pull

    # run the containers
    docker-compose -f ${COMPOSE_FILE} -p ${SERVICE_PREFIX} up -d
else
    echo "${COMPOSE_FILE} does not exist!"
fi

