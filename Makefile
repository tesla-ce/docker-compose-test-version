services:
	docker-compose -f docker-compose.tesla_services.yml up -d

core:
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d

moodle:
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml up -d

provider-tfr:
	docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml up -d


.PHONY: services core moodle provider-tfr
