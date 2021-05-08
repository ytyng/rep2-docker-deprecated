build:
	docker-compose -f docker/docker-compose.yml build

login:
	docker-compose -f docker/docker-compose.yml run --rm --service-ports --name=rep2-login rep2 /bin/sh

up:
	docker-compose -f docker/docker-compose.yml up

down:
	docker-compose -f docker/docker-compose.yml down
