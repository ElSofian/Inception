WP_DATA = /home/soelalou/data/wordpress #define the path to the wordpress data
DB_DATA = /home/soelalou/data/mariadb #define the path to the mariadb data
NC = 5#define the number of containers

# **************************************************************************** #
# COLORS

GREEN       = \033[0;32m
GREY        = \033[1;30m
PURPLE      = \033[0;35m
BLUE        = \033[0;94m
CYAN        = \033[0;36m
PINK        = \033[1;35m
RED			= \033[0;31m
DEFAULT		= \033[0;39m

# default target
all: up

# start the biulding process
# create the wordpress and mariadb data directories.
# start the containers in the background and leaves them running
up: build
	@sudo mkdir -p $(WP_DATA)
	@sudo mkdir -p $(DB_DATA)
	@sudo docker-compose -f srcs/docker-compose.yml up -d
	@echo "$(BLUE)[Containers]$(DEFAULT) ${NC} containers are up !"

# stop the containers
down: stop
	@sudo docker-compose -f srcs/docker-compose.yml down
	@echo "$(RED)[Containers]$(DEFAULT) All containers are down !"

# stop the containers
stop:
	@sudo docker-compose -f srcs/docker-compose.yml stop
	@echo "$(RED)[Containers]$(DEFAULT) Stopping all containers..."

# start the containers
start:
	@echo "$(GREEN)[Containers]$(DEFAULT) Launching $(NC) containers..."
	@sudo docker-compose -f srcs/docker-compose.yml start

# build the containers
build:
	@echo "$(BLUE)[Containers]$(DEFAULT) Building all containers..."
	@sudo docker-compose -f srcs/docker-compose.yml build

# clean the containers
# stop all running containers and remove them.
# remove all images, volumes and networks.
# remove the wordpress and mariadb data directories.
# the (|| true) is used to ignore the error if there are no containers running to prevent the make command from stopping.
clean:
	@sudo docker stop $$(docker ps -qa) || true
	@sudo docker rm $$(docker ps -qa) || true
	@sudo docker rmi -f $$(docker images -qa) || true
	@sudo docker volume rm $$(docker volume ls -q) || true
	@sudo docker network rm $$(docker network ls -q) || true
	@echo "$(RED)[Containers]$(DEFAULT) Cleaned !"

fclean: clean
	@sudo rm -rf $(WP_DATA) || true
	@sudo rm -rf $(DB_DATA) || true
	@echo "$(RED)[Containers]$(DEFAULT) Fully cleaned !"

# down, clean and start the containers
re: down clean up