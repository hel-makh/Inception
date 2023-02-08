#!/bin/bash

service vsftpd start

adduser $FTP_USER

FTP_USER_PW=$(expect -c "
    set timeout 10
    spawn passwd $FTP_USER
    expect \"New password:\"
    send \"$FTP_PW\r\"
    expect \"Retype new password:\"
    send \"$FTP_PW\r\"
    expect eof
")

echo "$FTP_USER_PW"

usermod -a -G www-data $FTP_USER

chmod -R 775 /var/www/wordpress

echo $FTP_USER | tee -a /etc/vsftpd.userlist

service vsftpd stop

vsftpd