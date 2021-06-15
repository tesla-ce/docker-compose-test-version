# Create networks
docker network create tesla_public
docker network create tesla_private

# Create volume folder structure
mkdir -p ${PWD}/_data/db
mkdir -p ${PWD}/_data/traefik
mkdir -p ${PWD}/_data/rabbitmq
mkdir -p ${PWD}/_data/minio
mkdir -p ${PWD}/_data/redis

mkdir -p ${PWD}/_data/moodle
mkdir -p ${PWD}/_data/database_moodle

cp ${PWD}/.env_moodle ${PWD}/config/env_moodle_template
cp ${PWD}/.env_tfr ${PWD}/config/env_tfr_template

# UP services with configure
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.configure.yml up configure
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.configure.yml up configure_mc
