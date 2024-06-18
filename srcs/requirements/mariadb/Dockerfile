FROM debian:bullseye

# Install mariadb
RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server curl systemd

# Replace config file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose port 3306
EXPOSE 3306

# Run the launch script
COPY tools/mariadb_script.sh /usr/local/bin/mariadb_script.sh
RUN chmod +x /usr/local/bin/mariadb_script.sh
CMD ["/usr/local/bin/mariadb_script.sh"]
