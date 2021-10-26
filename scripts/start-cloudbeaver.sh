#!/usr/bin/env bash

CONTAINER_LABEL="${1:-local}"
CONTAINER_NAME=cloudbeaver-${CONTAINER_LABEL}

docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} --network host \
    -v /var/cloudbeaver/${CONTAINER_LABEL}/workspace:/opt/cloudbeaver/workspace \
    --health-cmd "curl --fail http://localhost:8978 || exit 1" \
    --health-interval=15s --health-timeout=30s \
    dbeaver/cloudbeaver

echo "Started Cloudbeaver container ${CONTAINER_NAME} at http://localhost:8978"
