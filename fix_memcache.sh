#!/bin/bash

#Quick script for testing for memecache service
STATUS="$(systemctl is-active memcached)"
MEM_PID="$(pidof memcached)"
echo $STATUS
if [ "${STATUS}" != "active" ]
then
        echo "The status of memcached is ${STATUS} and the PID is ${MEM_PID}"
        sudo kill -15 $MEM_PID
        netstat -l --protocol=tcpip --program
        echo "Deleting the last line of the memcached file"
        sudo sed -i '$d' /etc/sysconfig/memcached
        echo 'OPTIONS="-l 127.0.0.1"' >> /etc/sysconfig/memcached
        echo "Restarting the memcached service"
        sudo systemctl restart memcached
else
        echo "The service is Active"
fi