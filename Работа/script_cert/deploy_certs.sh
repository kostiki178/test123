#!/bin/bash

# Check
if [[ "$1" == "" ]];
then
    echo "Wrong Domain"
    exit 0
else

# Create Certs
    certbot certonly --webroot -w /var/www/letsencrypt -d $1

# Create nginx enviroment for certs
    mkdir /var/certs/$1
    cp /etc/letsencrypt/live/$1/fullchain.pem /var/certs/$1/
    cp /etc/letsencrypt/live/$1/privkey.pem /var/certs/$1/
    chown -R www-data. /var/certs/$1
    chmod 755 /var/certs/$1/*
fi
