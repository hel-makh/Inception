#!/bin/bash

WP_DIR="/var/www/html/"
WP_CONF="wp-config.php"

if [ ! -d $WP_DIR ]; then
    mkdir -p $WP_DIR
fi

cd $WP_DIR

if [ -d $WP_DIR ] && [ ! -f $WP_DIR$WP_CONF ]; then
    wp --allow-root core download

    wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

    wp --allow-root db create

    wp --allow-root core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_PASSWORD --admin_email=$WP_ADMIN_EMAIL
fi

php-fpm7.4 --nodaemonize