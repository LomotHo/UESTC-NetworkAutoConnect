# UESTC-NetworkAutoConnect
实现电子科大沙河校区的教育网或电信网自动连接, 断线重连 
兼容openwrt, xiaomi路由器(需要ssh)

## 安装

### openwrt
1. 安装curl
```
opkg install curl
```
2. 自动安装脚本
```
./install.sh
```
3. 用chrome抓取登录的http包转换为curl格式, 将抓取到的数据放到/etc/connect/connect.sh中

### 小米路由器
1. 自带curl
2. ./install-for-xiaomi.sh
3. 用chrome抓取登录的http包转换为curl格式, 将抓取到的数据放到/etc/connect/connect.sh中

## 卸载
```
./uninstall.sh
```