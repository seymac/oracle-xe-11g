FROM gliderlabs/alpine:latest

MAINTAINER Seyma Cakmak <seymaccakmak@gmail.com>


COPY assets /assets
RUN /bin/sh /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080
