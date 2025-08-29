#!/bin/sh

CONFIG_DIR="/root/shell/wifi"

case "$1" in
    station)
        echo "切换到Station模式..."
        killall hostapd 2>/dev/null
        killall dnsmasq 2>/dev/null
        ifconfig wlan0 up
        connmanctl enable wifi
        echo "Station模式已启用"
        echo "请使用以下命令连接WiFi网络:"
        echo "1. connmanctl"
        echo "2. enable wifi"
        echo "3. agent on"
        echo "4. scan wifi"
        echo "5. services"
        echo "6. connect [网络ID]"
        echo "7. exit"
        ;;
    ap)
        echo "切换到SoftAP模式..."
        killall hostapd 2>/dev/null
        killall dnsmasq 2>/dev/null
        connmanctl disable wifi 2>/dev/null
        echo 0 > /sys/class/rfkill/rfkill1/soft 2>/dev/null
        sleep 1
        ifconfig wlan0 192.168.4.1 netmask 255.255.255.0 up
        hostapd $CONFIG_DIR/hostapd.conf -B
        sleep 1
        dnsmasq -C $CONFIG_DIR/dnsmasq.conf
        echo "热点已启动: SSID=ArmSoM, 密码=armsom123"
        ;;
    stop)
        echo "停止所有WiFi服务..."
    
        # 停止AP模式服务
        killall hostapd 2>/dev/null
        killall dnsmasq 2>/dev/null
    
        # 断开Station连接
        connmanctl disable wifi 2>/dev/null
		
		# 尝试断开所有活动连接
        connmanctl disconnect 2>/dev/null
    
        # 清除IP地址并关闭接口
        ip addr flush dev wlan0 2>/dev/null
        ifconfig wlan0 down 2>/dev/null
    
        echo "所有WiFi服务已停止"
        ;;
    *)
        echo "用法: $0 [station|ap|status|stop]"
        echo "  station - 切换到Station模式"
        echo "  ap      - 切换到SoftAP模式"
        echo "  stop    - 停止所有服务"
        ;;
esac

exit 0
