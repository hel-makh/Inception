FROM        debian:stable

EXPOSE      80

RUN         apt -y update\
                && apt -y install nginx

COPY        conf  /var/www/html

CMD         ["nginx", "-g", "daemon off;"]