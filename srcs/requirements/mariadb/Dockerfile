FROM debian:buster
EXPOSE 3306
RUN apt-get update && apt-get install mariadb-server -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./start.sh /
CMD ./start.sh