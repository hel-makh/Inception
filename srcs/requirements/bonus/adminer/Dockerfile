FROM        debian:stable

EXPOSE      9001

RUN         apt -y update\
                && apt -y install\
                    wget\
                    php\
                    php-mysql\
                    php-fpm\
                    default-mysql-client\
                && service php7.4-fpm start\
                && mkdir -p /var/www/adminer\
                && wget https://www.adminer.org/latest.php -O /var/www/adminer/index.php\
                && chown -R www-data:www-data /var/www/adminer/index.php\
                && chmod 755 /var/www/adminer/index.php

COPY        conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD         ["/usr/sbin/php-fpm7.4", "--nodaemonize"]