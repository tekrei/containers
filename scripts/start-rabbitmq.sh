#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_PORT="${2:-5672}"
WEB_PORT="${3:-15672}"
CONTAINER_NAME=rabbitmq-${CONTAINER_LABEL}

# Note: Default username and password is guest
docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} \
    --hostname ${CONTAINER_LABEL}-mb \
    --health-cmd "rabbitmq-diagnostics -q ping || exit 1" \
    --health-interval=15s --health-timeout=30s \
    -p ${WEB_PORT}:15672 -p ${CONTAINER_PORT}:5672 rabbitmq:management-alpine

echo "Started RabbitMQ container ${CONTAINER_NAME}"
