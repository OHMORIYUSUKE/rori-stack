FROM ubuntu:18.04

# setup requirements packages
RUN apt update -y && \
    apt install -y init && \
    apt install -y systemd

# Install SSH server
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends openssh-server && \
#     rm -rf /var/lib/apt/lists/* && \
#     echo "root:root" | chpasswd && \
#     sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config && \
#     sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config

# Register public key
# ADD id_rsa.pub /root/.ssh/
# RUN mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
#     chmod 700 /root/.ssh && \
#     chmod 600 /root/.ssh/authorized_keys

# 日本語対応
# ENV LANG C.UTF-8

# vim & curl
RUN apt update -y && \
    apt install curl -y && \
    apt install vim -y

CMD [ "/sbin/init", "&&", "service", "ssh", "start" ]