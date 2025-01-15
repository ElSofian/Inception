WP_DATA = /home/soelalou/data/wordpress #define the path to the wordpress data
DB_DATA = /home/soelalou/data/mariadb #define the path to the mariadb data

# default target
all: up

# start the biulding process
# create the wordpress and mariadb data directories.
# start the containers in the background and leaves them running
up: build
	@sudo mkdir -p $(WP_DATA)
	@sudo mkdir -p $(DB_DATA)
	sudo docker-compose -f srcs/docker-compose.yml up -d

# stop the containers
down: stop
	sudo docker-compose -f srcs/docker-compose.yml down

# stop the containers
stop:
	sudo docker-compose -f srcs/docker-compose.yml stop

# start the containers
start:
	sudo docker-compose -f srcs/docker-compose.yml start

# build the containers
build:
	sudo docker-compose -f srcs/docker-compose.yml build

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
	@sudo rm -rf $(WP_DATA) || true
	@sudo rm -rf $(DB_DATA) || true

# down, clean and start the containers
re: down clean up

# prune the containers: execute the clean target and remove all containers, images, volumes and networks from the system.
prune: clean
	@sudo docker system prune -a --volumes -f