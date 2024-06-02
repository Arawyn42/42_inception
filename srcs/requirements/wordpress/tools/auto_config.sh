#!/bin/sh

sleep 10

if [ ! -f ./wp-config.php ]; then

	wp core download --allow-root
	wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
						--dbcharset="utf8" --dbcollate="utf8_general_ci" --dbhost=mariadb:3306 --path='/var/www/wordpress'
	wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USR $WP_USR_EMAIL --role=author --user_pass=$WP_USR_PWD --allow-root
fi

if [ ! -f /run/php ]; then
	mkdir /run/php
fi