#!/bin/sh
#
echo "installing UESTC-NetworkAutoConnect"
#
# 检查是否存在 /etc/connect
if [ ! -d "/etc/connect" ]; then
  mkdir /etc/connect
else
	echo "0"
fi
cp ./autoconnect.sh /etc/connect
cp ./connect.sh /etc/connect
cp ./connection.log /etc/connect
chmod +x /etc/connect/*
#
# add task to crontab
echo "*/1 * * * * /bin/sh /etc/connect/autoconnect.sh" >> /etc/crontabs/root
echo "0 10 * * * echo '' > /etc/connect/connection.log" >> /etc/crontabs/root
#
# enable cron
/etc/init.d/cron enable
/etc/init.d/cron start