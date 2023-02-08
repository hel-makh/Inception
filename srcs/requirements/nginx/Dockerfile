FROM        debian:stable

EXPOSE      443 444

ENV         DOMAIN_NAME=hel-makh.42.fr

RUN         apt -y update\
                && apt -y install nginx openssl\
                && mkdir /etc/nginx/ssl\
                && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
                    -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA/L=Khouribga/O=1337/CN=${DOMAIN_NAME}"

COPY        conf/default  /etc/nginx/sites-available/default

CMD         ["nginx", "-g", "daemon off;"]