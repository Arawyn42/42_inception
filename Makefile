COMPOSE	=	@docker-compose -f ./srcs/docker-compose.yml

all:
	${COMPOSE} up -d --build

stop:
	${COMPOSE} stop

clean: stop
	${COMPOSE} down -v

prune: clean
	@docker system prune -af

re: clean all

.PHONY: all stop clean prune re