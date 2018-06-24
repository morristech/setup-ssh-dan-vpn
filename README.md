# Auto Script, By admin@white-vps (083871649005)
=================================================================================

# SETUP SSH,VPN,SSL/TLS OS debian8-32bit ( script sudah di update 26-06-2018 )
```
$ wget https://raw.githubusercontent.com/Dacung555/setup-ssh-dan-vpn/master/debian7.sh && chmod +x debian7.sh && ./debian7.sh
```
# Setup mysql-php-nginx OS debian8-32bit ( script belum di update )
```
$ wget https://raw.githubusercontent.com/Dacung555/ocspanel/master/mysql-php-nginx.sh && chmod +x mysql-php-nginx.sh && ./mysql-php-nginx.sh

++ Buat password mysql ( password harus di ingat karena saat set OCS mesti input ulang password mysql )
++ Test php info via website : http://ip-vps:81/info.php atau http://ip-vps:81/info.php
```
# Setup OCS PANEL OS Debian7-32bit ( script belum di update )

```
wget https://raw.githubusercontent.com/Dacung555/ocspanel/master/ocs-panel.sh && chmod +x ocs-panel.sh && ./ocs-panel.sh
```
# Setting OCS panel ( cara setting belum di update )

```
# Masukan password mysql lalu isi file database di bawah ini
# Database mysql :
# CREATE DATABASE IF NOT EXISTS OCSPANEL;EXIT;


setting database admin OCS PANEL via website
============================================
# http://IP_VPS:81/
# Lakukan setting seperti berikut:

# DATABASE
# Database Host: localhost (WAJIB!)
# Database Name: OCSPANEL (WAJIB!)
# Database User: root (WAJIB!) 
# Database Pass: Password MySQL yang telah dibuat tadi

# ADMIN LOGIN
# Username: admin (WAJIB!)
# Password Baru: (WAJIB!) Isikan dengan password root vps bukan pass mysql
# Masukkan Ulang Password: Input ulang password
# Selesai,lalu hapus history istallasi ocs dengan command di bawah ini
# rm -R /home/vps/public_html/installation
```

