# UESTC-NetworkAutoConnect
实现电子科大沙河校区的教育网或电信网自动连接, 断线重连 
兼容openwrt, xiaomi路由器(需要ssh)

1. 安装curl
opkg install curl
2. 复制此目录下所有文件到/etc/connect文件夹, 没有就新建
3. 用chrome抓取登录的http包转换为curl格式
4. 将抓取到的数据放到/etc/connect/connect.sh中
5. 添加定时任务
crontab -e进入编辑界面
将下面两行放到文件中
*/1 * * * * /bin/sh /etc/connect/autoconnect.sh
0 19 * * 1 echo '' > /etc/connect/connection.log
