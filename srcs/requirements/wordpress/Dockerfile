FROM debian:buster

# INSTALL WGET, PHP AND MARIADB CLIENT
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget php7.3 php-fpm php-mysql mariadb-client

# INSTALL WORDPRESS USING WGET (LAST VERSION) IN /var/www
RUN wget https://fr.wordpress.org/wordpress-6.5.3-fr_FR.tar.gz -P /var/www

# CREATE THE WORDPRESS DIRECTORY AND REMOVE THE TAR FILE
RUN cd /var/www && tar -xzf wordpress-6.5.3-fr_FR.tar.gz && rm wordpress-6.5.3-fr_FR.tar.gz

# GIVE WRITTING RIGHTS TO ROOT
RUN	chown -R root:root /var/www/wordpress

# REPLACE PHP CONFIG FILE WITH OUR CONFIG FILE
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# INSTALL CLI (TEXT INTERFACE) TO CONFIG WORDPRESS
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN SCRIPT TO CONFIGURE WORDPRESS
COPY ./tools/auto_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT [ "/usr/local/bin/auto_config.sh" ]

# RUN php-fpm
CMD [ "/usr/sbin/php-fpm7.3", "-F" ]