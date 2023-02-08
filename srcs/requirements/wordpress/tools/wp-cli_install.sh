#!/bin/bash

WP_DIR="/var/www/wordpress/"
WP_CONF="wp-config.php"

if [ ! -d $WP_DIR ]; then
    mkdir -p $WP_DIR
fi

if [ -d $WP_DIR ]; then
    cd $WP_DIR
    wp --allow-root core download

    if [ ! -f $WP_DIR$WP_CONF ]; then
        wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

        START_EDIT="\/\* Add any custom values between this line and the \"stop editing\" line. \*\/"
        REDIS_CONF="\
define( 'WP_REDIS_HOST',     'redis' );\n\
define( 'WP_REDIS_PORT',     6379 );\n\
define( 'WP_REDIS_DISABLED', false );\n\
define( 'WP_CACHE',          true );\n\
\n\
\$redis_server = array(\n\
    'host'      => 'redis',\n\
    'port'      => 6379,\n\
    'database'  => 0,\n\
);"
        sed -i "/$START_EDIT/a $REDIS_CONF" $WP_DIR$WP_CONF
    fi

    wp --allow-root db create
    wp --allow-root core install --url=10.12.100.85 --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --skip-email
    # wp --allow-root core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --skip-email
    wp --allow-root user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PW

    wp --allow-root plugin install redis-cache --activate
    wp --allow-root redis enable

    chown -R www-data:www-data $WP_DIR
fi

php-fpm7.4 --nodaemonize