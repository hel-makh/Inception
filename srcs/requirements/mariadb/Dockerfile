FROM        debian:stable

LABEL       author hel-makh

EXPOSE      3306

RUN         apt -y update\
                && apt -y install mariadb-server

COPY        tools/mysql_secure_install.sh   /tmp/

ENTRYPOINT  ["/tmp/mysql_secure_install.sh"]