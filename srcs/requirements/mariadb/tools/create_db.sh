#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod -R 777 /var/lib/mysql

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]
then
    echo "Database already exists"
else

    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
    
    echo "FLUSH PRIVILEGES;" > /tmp/init.sql
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> /tmp/init.sql
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$(cat $MYSQL_PASSWORD_FILE)';" >> /tmp/init.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /tmp/init.sql
    echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
    
    mariadbd --user=mysql --bootstrap < /tmp/init.sql
    
    rm /tmp/init.sql

fi

exec "$@"