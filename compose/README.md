# Docker Compose Files

This folder contains some Docker Compose services.

:warning: Please always check them before running

## Docker Compose Services

- [Kafka](./docker-compose-kafka.yml): to deploy [Kafka](https://hub.docker.com/r/bitnami/kafka), [Zookeper](https://hub.docker.com/r/bitnami/zookeper) and [Kafdrop](https://github.com/obsidiandynamics/kafdrop) services locally.
- [Mongo](./docker-compose-mongo.yml): to deploy [MongoDB](https://hub.docker.com/_/mongo) and [Mongo Express](https://hub.docker.com/_/mongo-express) services locally.
- [Overleaf](./docker-compose-overleaf.yml): to deploy [Overleaf](https://hub.docker.com/r/sharelatex/sharelatex) services locally.
  - Please check the [compose file](<.(docker-compose-overleaf.yml)>) for various configuration
  - [Creating admin user](https://github.com/overleaf/overleaf/wiki/Creating-and-managing-users): `docker exec sharelatex /bin/bash -c "cd /var/www/sharelatex; grunt user:create-admin --email=test@test.com"`

## Helper scripts

- [start.sh](./start.sh): to start a Docker Compose deployment (e.g., `./start.sh docker-compose-kafka.yml` will start services defined in [docker-compose-kafka.yml](./docker-compose-kafka.yml) file)

- [stop.sh](./stop.sh): to stop a Docker Compose deployment (e.g., `./stop.sh docker-compose-kafka.yml` will stop services defined in [docker-compose-kafka.yml](./docker-compose-kafka.yml) file)

:warning: Second argument to the scripts is used to define the service prefixes.
