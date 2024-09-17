FROM debian:bullseye

RUN apt-get update

RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/create_db.sh /

RUN chmod +x /create_db.sh

EXPOSE 3306

ENTRYPOINT ["/create_db.sh"]

CMD ["mariadbd"]