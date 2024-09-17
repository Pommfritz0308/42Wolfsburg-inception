build:
	docker compose -f srcs/docker-compose.yml up --build

up:
	docker compose -f srcs/docker-compose.yml up -d 

down:
	docker compose -f srcs/docker-compose.yml down

clear_volumes:
	docker compose -f srcs/docker-compose.yml down -v

clean: down
	docker system prune -a --volumes -f

dry-run:
	docker compose -f srcs/docker-compose.yml --dry-run up --build -d

re:
	docker compose -f srcs/docker-compose.yml restart
	
.PHONY: build up down clean dry-run re
