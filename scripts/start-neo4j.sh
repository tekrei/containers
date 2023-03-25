#!/usr/bin/env bash

# get fully qualified hostname
HOSTNAME=$(hostname -f)
if [[ -z ${HOSTNAME} ]]; then
    # if it doesn't work get only hostname
    HOSTNAME=$(hostname)
fi
export HOSTNAME=${HOSTNAME}

CONTAINER_LABEL="${1:-local}"
HTTP_PORT="${2:-7474}"
BOLT_PORT="${3:-7687}"
CONTAINER_NAME=neo4j-${CONTAINER_LABEL}

# --------------------------------------------
# Additional APOC specific configuration  (https://neo4j.com/labs/apoc/4.0/config/) starts with apoc.*
# It is also possible to define the following in a apoc.conf file and bind it as a volume: ./conf/apoc.conf:/var/lib/neo4j/conf/apoc.conf
# --------------------------------------------
# https://hub.docker.com/_/neo4j
docker run --pull always -d --restart unless-stopped --name ${CONTAINER_NAME} \
    -v /var/opt/neo4j-${CONTAINER_LABEL}/data:/data \
    -v /var/opt/neo4j-${CONTAINER_LABEL}/logs:/logs \
    -v /var/opt/neo4j-${CONTAINER_LABEL}/import:/var/lib/neo4j/import \
    -e NEO4J_AUTH=neo4j/vlab \
    -e NEO4J_dbms_default__listen__address=0.0.0.0 \
    -e NEO4J_dbms_default__advertised__address=${HOSTNAME} \
    -e NEO4J_dbms_connector_bolt_advertised__address=:${BOLT_PORT} \
    -e NEO4J_dbms_connector_http_advertised__address=:${HTTP_PORT} \
    -e NEO4JLABS_PLUGINS='["apoc", "graph-data-science", "n10s"]' \
    -e NEO4J_dbms_unmanaged__extension__classes=n10s.endpoint=/rdf \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=false \
    -e apoc.http.timeout.connect=0  \
    -e apoc.http.timeout.read=0  \
    --health-cmd "wget --no-verbose --tries=1 --spider http://localhost:7474 || exit 1" \
    -p ${HTTP_PORT}:7474 -p ${BOLT_PORT}:7687 neo4j

echo "Started Neo4j container ${CONTAINER_NAME} at http://localhost:${HTTP_PORT}"
