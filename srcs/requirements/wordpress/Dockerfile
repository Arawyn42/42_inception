FROM debian:bullseye

# Install php, wget and mariaDB client
RUN apt update -y && apt upgrade -y
RUN apt install -y php7.4 php-mysql php-fpm php-intl php-curl mariadb-client wget

# Download wordpress and place its folder in /var/www/html
RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN tar -xvf /var/www/wordpress-6.4.3.tar.gz -C /var/www
RUN rm -rf /var/www/wordpress-6.4.3.tar.gz
RUN mv /var/www/wordpress /var/www/html

# Grant folder access to root
RUN chown -R root:root /var/www/html

# Install WP CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Create /run/php/ directory
RUN mkdir /run/php/
RUN chmod 755 /run/php

# Expose port 9000
EXPOSE 9000

# Replace wordpress config file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Run wordpress launch script
COPY tools/wordpress_script.sh /usr/local/bin/wordpress_script.sh
RUN chmod +x /usr/local/bin/wordpress_script.sh
CMD ["/usr/local/bin/wordpress_script.sh"]
