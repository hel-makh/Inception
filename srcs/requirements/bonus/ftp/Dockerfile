FROM        debian:stable

EXPOSE      21 22

RUN         apt -y update\
                && apt -y install vsftpd expect

COPY        conf/vsftpd.conf   /etc/vsftpd.conf

COPY        tools/ftp_add_user.sh   /tmp/

ENTRYPOINT  ["/tmp/ftp_add_user.sh"]