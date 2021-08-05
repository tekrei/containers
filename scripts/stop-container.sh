#!/usr/bin/env bash

CONTAINER_NAME=$1

if [ -v $CONTAINER_NAME ]; then
    echo "Please provide the name or ID of the container"
else
    docker stop $CONTAINER_NAME || true && docker rm $CONTAINER_NAME || true
fi
