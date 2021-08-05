#!/usr/bin/env bash

CONTAINER_PORT="${1:-8888}"

docker run \
    -e JUPYTER_ENABLE_LAB=yes \
    -e GRANT_SUDO=yes \
    -v $(pwd):/home/jovyan/work/ \
    -p ${CONTAINER_PORT}:8888 jupyter/datascience-notebook
