FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends init

ENV LANG=C.UTF-8

# vim , curl & sudo
RUN apt update -y && \
    apt install curl -y && \
    apt install vim -y && \
    apt install sudo -y

ENTRYPOINT ["/sbin/init"]