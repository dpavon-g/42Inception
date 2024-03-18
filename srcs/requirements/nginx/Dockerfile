FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt install -y nginx && apt install openssl -y

COPY ./tools/install.sh /

ENTRYPOINT ["/install.sh" ]