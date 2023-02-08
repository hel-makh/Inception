FROM        debian:stable

EXPOSE      8080

RUN         apt -y update\
                && apt -y install wget\
                && wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O /usr/local/bin/cadvisor\
                && chmod +x /usr/local/bin/cadvisor

CMD         ["/usr/local/bin/cadvisor"]