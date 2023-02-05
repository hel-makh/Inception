#!/bin/bash

WP_DIR="/var/www/html/"
WP_CONF="wp-config.php"

if [ ! -d $WP_DIR ]; then
    mkdir -p $WP_DIR
fi

if [ -d $WP_DIR ] && [ ! -f $WP_DIR$WP_CONF ]; then
    cd $WP_DIR
    wp --allow-root core download
    wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
    wp --allow-root db create
    wp --allow-root core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --skip-email
    wp --allow-root user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PW
    wp --allow-root plugin install redis-cache --path=/var/www/html --activate
    wp --allow-root redis enable --path=/var/www/html
    echo "
        define( 'WP_REDIS_CLIENT', 'predis' );
        define( 'WP_REDIS_HOST', 'redis' );
        define( 'WP_REDIS_PORT', 6379 );
        define( 'WP_REDIS_DISABLED', false );
        define( 'WP_CACHE_KEY_SALT', '$DOMAIN_NAME' );

        \$redis_server = array(
            'host'      => '127.0.0.1',
            'port'      => 6379,
            'database'  => 0,
        );

        if ( file_exists( WP_CONTENT_DIR . '/plugins/redis-cache/object-cache.php' ) ) {
            require_once WP_CONTENT_DIR . '/plugins/redis-cache/object-cache.php';
        }
    " >> wp-config.php
fi

php-fpm7.4 --nodaemonize