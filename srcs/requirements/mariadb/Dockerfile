FROM debian:buster

# INSTALL MARIADB SERVER
RUN	apt update -y
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

# REPLACE MARIADB CONFIG FILE WITH OUR CONFIG FILE
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# COPY THE LAUNCH SCRIPT INTO usr/local/bin AND RUN IT
COPY ./tools/mariaDB.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariaDB.sh
ENTRYPOINT ["/usr/local/bin/mariaDB.sh"]

# RUN THE CONTAINER
CMD ["mysqld", "--bind-address=0.0.0.0"]