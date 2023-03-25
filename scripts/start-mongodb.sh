#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_PORT="${2:-27017}"
CONTAINER_NAME=mongodb-${CONTAINER_LABEL}

# User is user and password is pass, if you want to change them below
# data is persisted to the /var/opt/mongodb/${CONTAINER_LABEL} folder in the host
# https://hub.docker.com/_/postgres
docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} \
    -e MONGODB_INITDB_ROOT_USERNAME=user \
    -e MONGODB_INITDB_ROOT_PASSWORD=ğass \
    -v /var/opt/mongodb/${CONTAINER_LABEL}:/data/db \
    --health-cmd "mongosh --eval \"db.runCommand('ping').ok\" --quiet || exit 1" \
    -p ${CONTAINER_PORT}:27017 mongo:jammy

echo "Started MongoDB container ${CONTAINER_NAME}"
