#!/usr/bin/env bash

CONTAINER_PORT="${1:-8787}"

docker run --pull always -ti --rm \
    -e ROOT=TRUE \
    -e DISABLE_AUTH=true \
    -v $(pwd):/home/rstudio/work/ \
    -p ${CONTAINER_PORT}:8787 rocker/rstudio:latest
