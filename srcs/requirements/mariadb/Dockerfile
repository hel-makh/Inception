FROM        debian:stable

EXPOSE      3306

RUN         apt -y update\
                && apt -y install mariadb-server expect\
                && sed -i 's/# port = 3306/port = 3306/' /etc/mysql/mariadb.cnf\
                && sed -i 's/socket = \/run\/mysqld\/mysqld.sock/# socket = \/run\/mysqld\/mysqld.sock/' /etc/mysql/mariadb.cnf\
                && sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY        tools/mysql_secure_install.sh   /tmp/

ENTRYPOINT  ["/tmp/mysql_secure_install.sh"]