#!/bin/sh
sed -i "/\/etc\/connect\/autoconnect.sh/d" /etc/crontabs/root
sed -i "/\/var\/connection.log/d" /etc/crontabs/root
rm -rf /etc/connect
