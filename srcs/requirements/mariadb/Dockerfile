FROM        debian:stable

EXPOSE      3306

RUN         apt -y update\
                && apt -y install mariadb-server
                
COPY        conf/mariadb.cnf   /etc/mysql/mariadb.cnf

COPY        tools/mysql_secure_install.sh   /tmp/

ENTRYPOINT  ["/tmp/mysql_secure_install.sh"]