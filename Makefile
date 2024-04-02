all: 
	docker-compose -f srcs/requirements/docker-compose.yml build && docker-compose -f srcs/requirements/docker-compose.yml up -d
up:
	docker-compose -f srcs/requirements/docker-compose.yml up -d
down:
	docker-compose -f srcs/requirements/docker-compose.yml down
stop:
	docker-compose -f srcs/requirements/docker-compose.yml stop
start:
	docker-compose -f srcs/requirements/docker-compose.yml start
reset: 
	docker-compose -f srcs/requirements/docker-compose.yml down -v && sudo rm -Rf ~/data/ && mkdir ~/data && mkdir ~/data/mariadb && mkdir ~/data/wordpress