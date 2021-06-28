CUR_DIR = $(CURDIR)

.PHONY: configure
configure:
	@if [ `docker network ls | grep 'tesla_public' | wc -l` -eq 0 ]; then echo `docker network create tesla_public`; fi;
	@if [ `docker network ls | grep 'tesla_private' | wc -l` -eq 0 ]; then echo `docker network create tesla_private`; fi;
	mkdir -p $(CUR_DIR)/_data/db
	mkdir -p $(CUR_DIR)/_data/traefik
	mkdir -p $(CUR_DIR)/_data/rabbitmq
	mkdir -p $(CUR_DIR)/_data/minio
	mkdir -p $(CUR_DIR)/_data/redis
	mkdir -p $(CUR_DIR)/_data/moodle
	mkdir -p $(CUR_DIR)/_data/database_moodle
	cp $(CUR_DIR)/.env_moodle $(CUR_DIR)/config/env_moodle_template
	cp $(CUR_DIR)/.env_tfr $(CUR_DIR)/config/env_tfr_template
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.configure.yml up configure
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.configure.yml up configure_mc

.PHONY: services
services:
	docker-compose -f docker-compose.tesla_services.yml up -d

.PHONY: core
core:
	docker-compose -f docker-compose.tesla_services.yml up -d
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d

.PHONY: moodle
moodle:
	docker-compose -f docker-compose.tesla_services.yml up -d
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml up -d

.PHONY: provider-tfr
provider-tfr:
	docker-compose -f docker-compose.tesla_services.yml up -d
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml up -d

.PHONY: stop
stop:
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml -f docker-compose.moodle.yml stop

.PHONY: clean
clean:
	@echo "Cleaning"
	export $PWD && docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml -f docker-compose.moodle.yml down --remove-orphans
	rm -rf _data
	docker network rm tesla_public
	docker network rm tesla_private

.PHONY: configure services core moodle provider-tfr
