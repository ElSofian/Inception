# Description: Nginx Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y systemd nginx openssl nano

# copy the nginx configuration file
ADD ./nginx.conf /etc/nginx/sites-available/default

# remove the default configuration file
RUN rm -rf /etc/nginx/sites-enabled/default

# create a symbolic link to the configuration file
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# create the ssl directory
RUN mkdir -p /etc/nginx/ssl

# generate the ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=soelalou.42.fr/UID=so_admin"

# copy the nginx configuration file
COPY ./nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress

# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]