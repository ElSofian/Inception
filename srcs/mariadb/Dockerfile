# Description: MariaDB Dockerfile

# pull base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y mariadb-server netcat

# expose the port
EXPOSE 3306

# remove the default database
#RUN rm -rf /var/lib/mysql

# create the required directories
#RUN mkdir -p /var/lib/mysql /run/mysqld

# change the owner of the directories
#RUN chown -R mysql:mysql /var/lib/mysql  /run/mysqld

# set permissions to the directories
#RUN chmod 777 /var/run/mysqld 

# copy file from host to container
COPY ./conf/mdb-conf.sh /conf/mdb-conf.sh

# set permissions to the file
RUN chmod +x /conf/mdb-conf.sh

# define entrypoint command to run when the container starts
ENTRYPOINT ["./conf/mdb-conf.sh"]