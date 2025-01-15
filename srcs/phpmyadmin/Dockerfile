# Description: PhpMyAdmin Dockerfile

# pull base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y mariadb-server netcat phpmyadmin apache2 php libapache2-mod-php

# expose the port
EXPOSE 8080
