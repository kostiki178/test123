#!/bin/bash

user_wp="bp_2233_user"
pass_wp="sysVGdGikq98399g2LQA"

FILENAME="latest.tar.gz"
PERIOD='-41day'



PHP_VER=$(php -v | head -n 1 | cut -d " " -f 2 | cut -c 1-3)
echo -e "\nphpVersion= $PHP_VER"

sed -e  "s/unix:\/run\/php\/php7.*/unix:\/run\/php\/php$PHP_VER-fpm.sock;/g" -i  nginx.conf
grep php7 nginx.conf

sed -e  "s/unix:\/var\/run\/php\/php7.*/unix:\/var\/run\/php\/php$PHP_VER-fpm.sock;/g" -i  nginx_https.conf
grep php7 nginx_https.conf



echo -e  "\nDownload Latest Wordpress..."
if [[ -f "$FILENAME" ]]; then
    DATELOCALFILE=$(stat -c '%Y' "$FILENAME")
    DATEFREEZPERIOD=$(date -d "$PERIOD" +%s)
    echo "local file exists!"
    echo "DATELOCALFILE   = $DATELOCALFILE"
    echo "DATEFREEZPERIOD = $DATEFREEZPERIOD"
    [[ "$DATELOCALFILE" -lt "$DATEFREEZPERIOD" ]] && echo "local file has freezed version" && \
    wget https://wordpress.org/latest.tar.gz -O latest.tar.gz && \
    echo "Download newest file OK!" || echo "Download newest file no necessary or Failed!!!"
else
    echo "local file not  exists, download file"
    wget https://wordpress.org/latest.tar.gz -O latest.tar.gz  && \
    echo "Download OK!" || echo "Download Failed!!!"
fi



echo "Create database, install wordpress, enable http config nginx!..."
mkdir -p /var/www/letsencrypt

while read name
do

database=$(echo $name | sed "s/\./_/g;s/-/_/g")

#Create database, nginx.conf, enable http
#[[ -d "/var/www/$name" ]] && echo "dir EXISTS!!!" && continue
mkdir -p  /var/www/$name
tar -xzf latest.tar.gz -C /var/www/$name
cp -r /var/www/$name/wordpress/wp-config-sample.php /var/www/$name/wordpress/wp-config.php
chown -R www-data. /var/www/$name
sed -i "s/database_name_here/$database/g" /var/www/$name/wordpress/wp-config.php
sed -i "s/username_here/$user_wp/g" /var/www/$name/wordpress/wp-config.php
sed -i "s/password_here/$pass_wp/g" /var/www/$name/wordpress/wp-config.php
sed "s/domain/$name/g" < nginx_https.conf > /etc/nginx/sites-available/$name.conf
ln -s /etc/nginx/sites-available/$name.conf /etc/nginx/sites-enabled/$name.conf





#while read name
#do

nginx -t && nginx -s reload
# && \
#letsencrypt certonly -n -a webroot --webroot-path=/var/www/letsencrypt -d $name -d www.$name --dry-run && \
#letsencrypt certonly -n -a webroot --webroot-path=/var/www/letsencrypt -d $name -d www.$name
#done < conf.txt

echo "Wordpress Installed!!!"


#letsencrypt certonly -an webroot --webroot-path=/var/www/letsencrypt -d $name -d www.$name 
#sed "s/domain/$name/g" < nginx_https.conf > /etc/nginx/sites-available/$name.conf

done < conf.txt


sleep 1

echo "All Done!"
