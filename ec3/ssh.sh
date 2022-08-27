#!/bin/bash

id_rsa.pub /root/.ssh/
mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
chmod 700 /root/.ssh && \
chmod 600 /root/.ssh/authorized_keys