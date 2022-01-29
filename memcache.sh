#!/bin/bash
sudo yum install epel-release -y
sudo yum install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached
firewall-cmd --add-port=11211/tcp --permanent
firewall-cmd --reload
sudo memcached -p 11211 -U 11111 -u memcached -d