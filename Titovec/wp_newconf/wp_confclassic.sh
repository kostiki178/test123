#!/bin/bash


while read name
do

# letsencrypt certonly -a webroot --webroot-path=/var/www/$name/wordpress -d $name 
sed "s/domain/$name/g" < nginx_https.conf > /etc/nginx/sites-available/$name.conf

done < .sites.txt

sleep 1


echo "All Done!"
