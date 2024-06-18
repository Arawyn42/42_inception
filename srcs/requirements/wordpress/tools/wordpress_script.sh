#!/bin/sh

# Wait for mariaDB to start
sleep 30

# Go to the wordpress directory
cd /var/www/html

# Create wp-config.php and admin user
if [ ! -f wp-config.php ]; then
  wp config create --allow-root \
                   --dbname=$DB_NAME \
                   --dbuser=$DB_USER \
                   --dbpass=$DB_PASSWORD \
                   --dbhost=mariadb:3306 \
                   --path='/var/www/html' \
  || { echo "wp-config.php creation failed..."; exit 1; }
  wp core install --allow-root \
                  --url=$DOMAIN_NAME \
                  --title=$WP_TITLE \
                  --admin_user=$WP_ADMIN \
                  --admin_password=$WP_ADMIN_PASSWORD \
                  --admin_email=$WP_ADMIN_EMAIL \
                  --skip-email \
                  --path='/var/www/html' \
  || { echo "wp admin user creation failed..."; exit 1; }
fi

# Install Hestia theme
wp theme install inspiro --activate --allow-root --path="/var/www/html" \
|| { echo "wp theme installation failed..."; }

# Create second user
wp user create	$WP_USER \
				        $WP_USER_EMAIL \
				        --role=author \
				        --user_pass=$WP_USER_PASSWORD \
				        --path='/var/www/html' \
				        --allow-root

# Execute php-fpm7.4 to allow communication between wordpress and PHP
/usr/sbin/php-fpm7.4 -F
