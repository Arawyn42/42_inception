FROM	debian:buster

# INSTALL NGINX AND OPENSSL INTO THE CONTAINER
RUN	apt update -y
RUN	apt install nginx -y
RUN	apt install openssl -y

# CREATE SSL CERTIFICATE
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:4096 -sha256 -days 365 \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=Perpignan/L=Perpignan/O=42 School/OU=drenassi/CN=drenassi@student.42perpignan.fr"

# CREATE A CONFIG DIRECTORY
RUN mkdir -p /var/run/nginx

# MODIFY NGINX CONFIG FILE AND REPLACE IT
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# ALLOW PORT 443
EXPOSE	443

# GIVE RIGHTS TO ROOT AND MAIN USER
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# RUN THE CONTAINER
CMD ["nginx", "-g", "daemon off;"]