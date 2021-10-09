# Service Scripts

These scripts are used to deploy different Docker containers. They are meant to be self-contained and you need to update
environment variables before running them for deployment and check their volumes for proper persistence.

:warning: Please always check them before running any script

## Container scripts

- [start-neo4j.sh](./start-neo4j.sh): to start a [Neo4j](https://www.neo4j.com) container (<https://hub.docker.com/_/neo4j>)
- [start-postgres.sh](./start-postgres.sh): to start a [PostgreSQL](https://www.postgresql.org/) container (<https://hub.docker.com/_/postgres>)
- [start-rabbitmq.sh](./start-rabbitmq.sh): to start a [RabbitMQ](https://www.rabbitmq.com/) container (<https://hub.docker.com/_/rabbitmq>)
- [start-portainer.sh](./start-portainer.sh): to start a community edition [Portainer](https://www.portainer.io/) container (<https://registry.hub.docker.com/r/portainer/portainer-ce/>)
- [start-ds-notebook.sh](./start-ds-notebook.sh): to start a [Data Science Jupyter Notebook Server](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-datascience-notebook) container (<https://hub.docker.com/r/jupyter/datascience-notebook>)
- [start-tf-notebook.sh](./start-tf-notebook.sh): to start a [TensorFlow Jupyter Notebook Server](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-tensorflow-notebook) container (<https://hub.docker.com/r/jupyter/tensorflow-notebook>)
- [start-r-studio.sh](./start-r-studio.sh): to start a [R Studio](https://github.com/rocker-org/rocker) container (<https://hub.docker.com/r/rocker/rstudio>)

## Helper scripts

- [stop-container.sh](./stop-container.sh): to stop containers (e.g., `./stop-container.sh local-postgres` will stop and remove `local-postgres` container)
