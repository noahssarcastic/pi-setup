#!/bin/bash -x

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/CN=octoprint" \
    -keyout /etc/ssl/private/nginx-selfsigned.key  \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    > /dev/null
