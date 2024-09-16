FROM debian:bullseye

RUN apt-get update

RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 3306

ENTRYPOINT ["/script.sh"]

CMD ["mariadbd"]