#!/bin/bash
#

# Lakukan Update
apt-get update

# Install MySql server
apt-get install mysql-server

# Tunggu sampai diminta memasukan password. Ingat.. password jangan sampai lupa
# Tulis password, geser ke bawah OK kemudian Enter
# setelah selsesai jalankan perintah ini :
mysql_secure_installation

# Kemudian akan diminta password, masukan password. Kemudian akan muncul tulisan seperti ini :
# Change the root password? [Y/n]: n
# Remove anonymous users? [Y/n]: y
# Disallow root login remotely? [Y/n]: y
# Remove test database and access to it? [Y/n]: y
# Reload privilege tables now? [Y/n]: y
chown -R mysql:mysql /var/lib/mysql/
chmod -R 755 /var/lib/mysql/

# Instal Nginx + PHP
apt-get -y install nginx php5 php5-fpm php5-cli php5-mysql php5-mcrypt
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
mv /etc/nginx/conf.d/vps.conf /etc/nginx/conf.d/vps.conf.backup
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Dacung555/setup-ssh-dan-vpn/master/nginx.conf"
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/Dacung555/setup-ssh-dan-vpn/master/vps.conf"
sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

# AddUser + Directory untuk Web Root
useradd -m vps
mkdir -p /home/vps/public_html

# untuk testing
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php

# beri hak akses
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html

# restart nginx + fpm-php
service php5-fpm restart
service nginx restart

# sampai sini install webserver sudah selesai, tinggal test pake browser
# http://ip-server:81/info.php

# Install OCS Panels
apt-get install git

# Kemudian clone master projectnya
cd /home/vps/public_html
git init
git remote add origin https://github.com/kangismet/ocspanel.git
git pull origin master

# Sekarang login ke MySql dan membuat Database
mysql -u root -p

# masukan password, kemudian copas kode ini

# CREATE DATABASE IF NOT EXISTS OCS_PANEL;EXIT;

# berikan hak akses untuk config
# chmod 777 /home/vps/public_html/config
# chmod 777 /home/vps/public_html/config/config.ini
# chmod 777 /home/vps/public_html/config/route.ini

# Installasi OCS Panels di Browser
# Buka browser favorit sobat, kemudian lakukan installasi. Buka alamat http://ip-server:81/
# Isi data admin login ocs dan ikuti sampai selesai
# Lakukan setting seperti berikut:

# DATABASE
# Database Host: localhost (WAJIB!)
# Database Name: OCSPANEL (WAJIB!)
# Database User: root (WAJIB!) 
# Database Pass: Password MySQL yang telah dibuat tadi

# ADMIN LOGIN
# Username: Zeph
# Password Baru: Isikan dengan password OCS yang diinginkan

# Setelah selesai installasi di browser, kembali ke putty dan hapus file installasi.
# rm -R /home/vps/public_html/installation

# Install XML Parser di Webmin
# Login ke Webmin, Pilih Other > Perl Modules > From CPAN Named > Tulis "XML::Parser" > Install

