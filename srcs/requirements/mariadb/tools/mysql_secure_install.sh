#!/bin/bash

service mariadb start

apt -y install expect

SECURE_MYSQL=$(expect -c "
    set timeout 10
    spawn mysql_secure_installation
    expect \"Enter current password for root (enter for none):\"
    send \"\r\"
    expect \"Switch to unix_socket authentication\"
    send \"n\r\"
    expect \"Change the root password?\"
    send \"y\r\"
    expect \"New password:\"
    send \"$MYSQL_ROOT_PASSWORD\r\"
    expect \"Re-enter new password:\"
    send \"$MYSQL_ROOT_PASSWORD\r\"
    expect \"Remove anonymous users?\"
    send \"y\r\"
    expect \"Disallow root login remotely?\"
    send \"y\r\"
    expect \"Remove test database and access to it?\"
    send \"y\r\"
    expect \"Reload privilege tables now?\"
    send \"y\r\"
    expect eof
")

echo "$SECURE_MYSQL"

mysqladmin shutdown -uroot -p${MYSQL_ROOT_PASSWORD}

apt -y purge expect

mysqld_safe