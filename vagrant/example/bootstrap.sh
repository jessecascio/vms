#!/usr/bin/env bash

sudo yum -y update
sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo yum --enablerepo=remi,remi-test install -y  mysql mysql-server
sudo service mysqld start
sudo chkconfig  mysqld on
