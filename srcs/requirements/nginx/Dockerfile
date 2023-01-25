FROM    debian:stable

LABEL   author hel-makh

EXPOSE  80

RUN     apt update -y\
            && apt install nginx -y

CMD     ["nginx", "-g", "daemon off;"]
