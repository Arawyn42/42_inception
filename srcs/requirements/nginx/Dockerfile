FROM debian:bullseye

# Install nginx and openSSL
RUN apt update -y && apt upgrade -y && apt install -y nginx
RUN apt install -y openssl

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Create a config directory
RUN mkdir -p /var/run/nginx

# Replace config file
COPY /conf/nginx.conf /etc/nginx/nginx.conf

# Grant privileges to root and main user
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Run the launch script
COPY tools/nginx_script.sh /usr/local/bin/nginx_script.sh
RUN chmod +x /usr/local/bin/nginx_script.sh
CMD ["/usr/local/bin/nginx_script.sh"]
