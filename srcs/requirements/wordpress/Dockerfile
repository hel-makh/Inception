FROM        debian:stable

EXPOSE      9000

RUN         apt -y update\
                && apt -y install\
                    curl\
                    php\
                    php-mysql\
                    php-fpm\
                    php-curl\
                    php-gd\
                    php-intl\
                    php-mbstring\
                    php-soap\
                    php-xml\
                    php-xmlrpc\
                    php-zip\
                    mariadb-client\
                && service php7.4-fpm start\
                && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
                && chmod +x wp-cli.phar\
                && mv wp-cli.phar /usr/local/bin/wp

COPY        conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY        tools/wp-cli_install.sh   /tmp/

ENTRYPOINT  ["/tmp/wp-cli_install.sh"]