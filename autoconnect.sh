#!/bin/sh
#
# test net connection
# TEST_HOST=114.114.114.114
TEST_HOST=www.baidu.com
curl --connect-timeout 5 -m 10 $TEST_HOST > /dev/null 2>&1  
if [ $? -eq 0 ];then  
    echo [`date`] ok1 >> /var/connection.log
else  
    echo [`date`] bad net1 >> /var/connection.log
    curl --connect-timeout 5 -m 10 $TEST_HOST > /dev/null 2>&1
    if [ $? -eq 0 ];then  
        echo [`date`] ok2  >> /var/connection.log
    else  
        echo [`date`] bad net2  >> /var/connection.log
        curl --connect-timeout 5 -m 10 $TEST_HOST > /dev/null 2>&1
        if [ $? -eq 0 ];then  
            echo [`date`] ok3  >> /var/connection.log
        else  
            echo [`date`] connecting...  >> /var/connection.log
            /bin/sh /etc/connect/connect.sh
        fi  
    fi    
fi  
