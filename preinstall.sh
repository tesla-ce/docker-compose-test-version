# Create networks
docker network create tesla_public
docker network create tesla_private

# Create volume folder structure
mkdir -p ./_data/db
mkdir -p ./_data/traefik
mkdir -p ./_data/rabbitmq
mkdir -p ./_data/minio
mkdir -p ./_data/redis

mkdir -p ./_data/moodle
mkdir -p ./_data/database_moodle

# UP services with configure
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.configure.yml up configure
