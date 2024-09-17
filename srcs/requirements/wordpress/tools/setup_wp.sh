#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wordpress already installed"
else
	wp core download --path=/var/www/html --allow-root
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$(cat $WORDPRESS_DB_PASSWORD_FILE) --dbhost=$WORDPRESS_DB_HOST --allow-root
	wp core install --url=$WORDPRESS_URL --title="Freddy's Inception" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$(cat $WORDPRESS_ADMIN_PASSWORD_FILE) --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
	wp user create freddy freddy@author.com --role=author --user_pass=$(cat $WORDPRESS_USER_PASSWORD_FILE) --porcelain --allow-root
	wp theme install boardwalk --activate --allow-root
	wp theme install cubic --activate --allow-root
	echo "wordpress installed"
fi

exec "$@"