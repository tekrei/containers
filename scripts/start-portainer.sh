#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_PORT="${2:-9443}"
CONTAINER_NAME=portainer-${CONTAINER_LABEL}

# Health check is not available yet: <https://github.com/portainer/portainer/issues/3572>
# --health-cmd "curl --fail http://localhost:9000/api/status || exit 1" \
# --health-interval=30s --health-timeout=30s \

# 8000 is the edge port <https://docs.portainer.io/v/ce-2.9/admin/environments/add/edge#exposing-port-8000>
# This will start portainer as always restarting is stopped
docker run --pull=always -d --restart=always --name ${CONTAINER_NAME} \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/opt/portainer/${CONTAINER_LABEL}:/data \
    -p 8000:8000 -p ${CONTAINER_PORT}:9443 portainer/portainer-ce:alpine

