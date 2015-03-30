#!/bin/bash

#Given we have all 4 results files
sudo /vagrant/catResults.pl > /vagrant/results
sudo /vagrant/inject.pl > /vagrant/mysql.txt
sudo mysql < /vagrant/mysql.txt
#Database is updates
