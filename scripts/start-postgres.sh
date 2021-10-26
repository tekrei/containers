#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_PORT="${2:-5432}"
CONTAINER_NAME=postgres-${CONTAINER_LABEL}

# default user is postgres, if you want to change provide it with POSTGRES_USER
# initial database name is provided as POSTGRES_DB environment variable, if not provided it will use postgres default database
# data is persisted to the /var/opt/postgres-${CONTAINER_LABEL} folder in the host
# https://hub.docker.com/_/postgres
docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} \
    -e "POSTGRES_PASSWORD=postgres" \
    -v /var/opt/postgres/${CONTAINER_LABEL}:/var/lib/postgresql/data \
    --health-cmd "pg_isready -U postgres || exit 1" \
    --health-interval=15s --health-timeout=30s \
    -p ${CONTAINER_PORT}:5432 postgres:alpine

echo "Started PostgreSQL container ${CONTAINER_NAME}"
