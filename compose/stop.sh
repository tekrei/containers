#!/usr/bin/env bash
export COMPOSE_FILE="${1:-docker-compose.yml}"
export SERVICE_PREFIX="${2:-local}"

if test -f ${COMPOSE_FILE}; then
    echo "Removing ${SERVICE_PREFIX}* services using ${COMPOSE_FILE} file."
    docker-compose -f ${COMPOSE_FILE} -p ${SERVICE_PREFIX} down
else
    echo "${COMPOSE_FILE} does not exist!"
fi
