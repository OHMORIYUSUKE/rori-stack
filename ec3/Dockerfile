FROM ubuntu:18.04

# setup requirements packages
RUN apt update -y && \
    apt install -y init && \
    apt install -y systemd

# 日本語対応
# ENV LANG C.UTF-8

# vim & curl
RUN apt update -y && \
    apt install curl -y && \
    apt install vim -y

CMD [ "/sbin/init", "&&", "service", "ssh", "start" ]