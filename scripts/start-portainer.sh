#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_PORT="${2:-9443}"
CONTAINER_NAME=portainer-${CONTAINER_LABEL}

# Health check is only available at alpine image: <https://github.com/portainer/portainer/issues/3572#issuecomment-948098948>

# 8000 is the edge port <https://docs.portainer.io/v/ce-2.9/admin/environments/add/edge#exposing-port-8000>
# This will start portainer as always restarting is stopped
docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/opt/portainer/${CONTAINER_LABEL}:/data \
    --health-cmd "wget --no-verbose --tries=1 --spider http://localhost:9000/api/status || exit 1" \
    --health-interval=30s --health-timeout=30s \
    -p 8000:8000 -p ${CONTAINER_PORT}:9443 portainer/portainer-ce:alpine

echo "Started Portainer container ${CONTAINER_NAME} at https://localhost:${CONTAINER_PORT}"
