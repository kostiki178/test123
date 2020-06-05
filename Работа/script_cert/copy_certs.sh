#!/bin/bash

cd /var/certs

while read line;
do
    cp /etc/letsencrypt/live/$line/fullchain.pem /var/certs/$line/
    cp /etc/letsencrypt/live/$line/privkey.pem /var/certs/$line/
    chown -R www-data. /var/certs/$line
    chmod 755 /var/certs/$line/*
done < <(ls -1)

