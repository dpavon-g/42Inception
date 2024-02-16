.PHONY: build up start stop volumes container status
all: up

build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

up: 
	docker-compose -f ./srcs/docker-compose.yml up -d

start:
	docker-compose -f ./srcs/docker-compose.yml start -d

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

volumes:
	docker volume ls

# containers:
# 	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}} {{.Name}}' $(ID)

status:
	docker ps

images:
	docker images