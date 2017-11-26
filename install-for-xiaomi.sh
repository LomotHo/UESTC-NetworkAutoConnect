#!/bin/sh	

echo "installing UESTC-NetworkAutoConnect"

# 检查是否存在 /etc/connect
if [ ! -d "/etc/connect" ]; then
  mkdir /etc/connect
fi

cp ./* /etc/connect
chmod +x /etc/connect/*

# add task to crontab
echo "*/1 * * * * /bin/sh /etc/connect/autoconnect.sh" >> /etc/crontabs/root
echo "0 19 * * 1 echo '' > /etc/connect/connection.log" >> /etc/crontabs/root
