#!/bin/bash
NAME=`hostname`
top -b -n 2 > /vagrant/tempTop$NAME
/vagrant/parseTop.pl $NAME > /vagrant/results$NAME
rm /vagrant/tempTop$NAME
