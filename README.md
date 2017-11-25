# UESTC-NetworkAutoConnect
电子科大沙河校区网络自动连接


*/1 * * * * /bin/sh /etc/connect/autoconnect.sh
0 19 * * 1 echo '' > /etc/connect/connection.log
