.PHONY: build up start stop volumes container status
all: up

build:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

up: 
	@docker-compose -f ./srcs/docker-compose.yml up -d

start:
	@docker-compose -f ./srcs/docker-compose.yml start -d

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

volumes:
	@docker volume ls

ip:
	@docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(ID)

status:
	@docker ps

images:
	@docker images

help:

	@echo "---------------"
	@echo "  make build"
	@echo "  make up"
	@echo "  make start"
	@echo "  make stop"
	@echo "  make volumes"
	@echo "  make ip ID=<volume ID>"
	@echo "  make status"
	@echo "  make images"