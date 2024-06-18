#!/bin/bash

# Wait for MariaDB to start
service mariadb start
sleep 10

# Create database
echo "Creating database: ${DB_NAME}..."
mariadb  -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create user
echo "Creating user: ${DB_USER}..."
mariadb  -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user
echo "Granting privileges to ${DB_USER}..."
mariadb  -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;"

# Alter root user's password
echo "Altering root user's password..."
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges
mariadb -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Wait for MariaDB to shut down
mariadb-admin -u root -p"${DB_ROOT_PASSWORD}" shutdown
sleep 10

# Restart MariaDB in safe mode
exec mysqld_safe
