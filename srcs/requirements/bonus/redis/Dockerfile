FROM        debian:stable

EXPOSE      6379

RUN         apt -y update\
                && apt -y install redis-server

CMD         redis-server --bind "0.0.0.0" --protected-mode no