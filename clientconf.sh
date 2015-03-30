#!/usr/bin/env bash

sudo yum update
sudo yum install -y perl
sudo cp /vagrant/crontabclient.txt .
sudo crontab crontabclient.txt
