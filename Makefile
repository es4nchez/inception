NAME	=	inception
COMPOSE	=	-f srcs/docker-compose.yml
DOCK	=	docker compose $(COMPOSE) -p $(NAME)

##@ General
all:	build start    ## Build and start all services

help:	## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Services
build:	## Build all services
	$(DOCK) build

start:	## Start all services
	$(DOCK) up

wordpress:	## Build and start WordPress
	$(DOCK) build wordpress
	$(DOCK) up -d wordpress

nginx:	## Build and start NGINX
	$(DOCK) build nginx
	$(DOCK) up -d nginx

mariadb:	## Build and start MariaDB
	$(DOCK) build mariadb
	$(DOCK) up -d mariadb

##@ Maintenance Commands
down:	## Stop services and remove containers
	$(DOCK) down

clean:	## Remove all containers and networks (also volumes with '--volumes' flag)
	$(DOCK) down --volumes

status:	## Show service status
	$(DOCK) ps

##@ Cleanup
vclean:	## Remove all unused volumes
	docker volume prune -f

iclean:	## Remove all unused images, containers, networks, and build cache
	docker system prune -a --force

prune:	## Remove all unused data and volumes
	docker system prune -a --volumes --force

aclean:	clean vclean iclean    ## Full cleanup: containers, volumes, and other unused data

re:	clean all    ## Recreate all services from scratch

##@ Shell Access
mariadbrun:	## Access shell for MariaDB
	$(DOCK) exec mariadb zsh

wprun:	## Access shell for WordPress
	$(DOCK) exec wordpress zsh

ngrun:	## Access shell for NGINX
	$(DOCK) exec nginx sh

.PHONY: all build start wordpress nginx mariadb down clean status vclean iclean prune aclean re mariadbrun wprun ngrun help

