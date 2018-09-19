#!/bin/sh
#
# test net connection
ping -c 1 www.baidu.com > /dev/null 2>&1  
if [ $? -eq 0 ];then  
    echo [`date`] ok1 >> /etc/connect/connection.log
else  
    echo [`date`] bad net1 >> /etc/connect/connection.log
    ping -c 1 114.114.114.114 > /dev/null 2>&1
    if [ $? -eq 0 ];then  
        echo [`date`] ok2  >> /etc/connect/connection.log
    else  
        echo [`date`] bad net2  >> /etc/connect/connection.log
        ping -c 1 114.114.114.114 > /dev/null 2>&1  
        if [ $? -eq 0 ];then  
            echo [`date`] ok3  >> /etc/connect/connection.log
        else  
            echo [`date`] connecting...  >> /etc/connect/connection.log
            /bin/sh /etc/connect/connect.sh
        fi  
    fi    
fi  
