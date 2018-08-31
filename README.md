# UESTC-NetworkAutoConnect
实现电子科大沙河校区的教育网或电信网自动连接, 断线重连 
兼容openwrt, xiaomi路由器(需要ssh)

## 安装

### openwrt
1. 安装curl
```bash
opkg install curl
```
2. 自动安装脚本
```bash
./install.sh
```
3. 用chrome抓取登录的http包转换为curl格式, 将抓取到的数据放到/etc/connect/connect.sh中
在chrome中打开http://192.168.9.8/srun_portal_pc.php?ac_id=1& 页面，按f12打开调试窗口（windows），切换到network标签，输入账号密码，点击登陆

![curl01](https://github.com/LomotHo/UESTC-NetworkAutoConnect/raw/master/img/curl01.png)

调试窗口中会显示一个叫auth_action.php的http请求

![curl02](https://github.com/LomotHo/UESTC-NetworkAutoConnect/raw/master/img/curl02.png)

右键copy - copy as curl(bash)

![curl03](https://github.com/LomotHo/UESTC-NetworkAutoConnect/raw/master/img/curl03.png)

然后将内容粘贴到connect.sh里面，删除请求尾部的 "--compressed"

### 小米路由器
1. 自带curl
2. 自动安装脚本
```bash
./install-for-xiaomi.sh
```
3. 用chrome抓取登录的http包转换为curl格式, 将抓取到的数据放到/etc/connect/connect.sh中，方法同openwrt的第三步

## 卸载
```bash
./uninstall.sh
```
