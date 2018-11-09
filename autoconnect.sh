#!/bin/sh
#
# test net connection
# TEST_HOST=114.114.114.114
TEST_HOST=baidu.com
LOG_PATH=/var/connection.log
OK_CODE=200

RESULT=`curl -I --connect-timeout 5 -m 10 -o /dev/null -s -w %{http_code} $TEST_HOST`
if [ $RESULT -eq $OK_CODE ];then  
    echo [`date`] ok1 >> $LOG_PATH
else  
    echo [`date`] bad net1 >> $LOG_PATH
    RESULT=`curl -I --connect-timeout 5 -m 10 -o /dev/null -s -w %{http_code} $TEST_HOST`
    if [ $RESULT -eq $OK_CODE ];then  
        echo [`date`] ok2  >> $LOG_PATH
    else  
        echo [`date`] bad net2  >> $LOG_PATH
        RESULT=`curl -I --connect-timeout 5 -m 10 -o /dev/null -s -w %{http_code} $TEST_HOST`
        if [ $RESULT -eq $OK_CODE ];then  
            echo [`date`] ok3  >> $LOG_PATH
        else  
            echo [`date`] connecting...  >> $LOG_PATH
            /bin/sh /etc/connect/connect.sh
        fi  
    fi    
fi  
