#!/usr/bin/env bash

sudo yum update
sudo yum install -y perl httpd mysql-server php php-mysql chkconfig
cp /vagrant/index.php /var/www/html/
sudo chkconfig httpd on
sudo chkconfig mysqld on
sudo cp /vagrant/crontabhost.txt .
sudo crontab crontabhost.txt
sudo /vagrant/host.pl &
