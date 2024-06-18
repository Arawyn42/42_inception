COMPOSE	=	@docker-compose -f ./srcs/docker-compose.yml

all:
	@mkdir -p /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	${COMPOSE} up

stop:
	${COMPOSE} stop

clean: stop
	${COMPOSE} down

prune: clean
	@docker system prune -af
	@sudo rm -rf /home/$(USER)/data/mariadb/ /home/$(USER)/data/wordpress/

re: clean all

.PHONY: all stop clean prune re