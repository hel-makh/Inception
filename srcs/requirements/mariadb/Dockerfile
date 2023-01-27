FROM        debian:stable

LABEL       author hel-makh

EXPOSE      3306

COPY        tools/mysql_secure_installation.sh   /tmp/

ENTRYPOINT  ["/tmp/mysql_secure_installation.sh"]