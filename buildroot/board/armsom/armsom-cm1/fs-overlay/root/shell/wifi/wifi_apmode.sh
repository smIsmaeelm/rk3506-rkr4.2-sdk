echo 0 > /sys/class/rfkill/rfkill1/soft
sleep 1
if [ "$(pidof dnsmasq)" ]; then
    kill -9 $(pidof dnsmasq)
fi
if [ "$(pidof hostapd)" ]; then
    kill -9 $(pidof hostapd)
fi
ifconfig wlan1 192.168.4.1 netmask 255.255.255.0 up
sleep 1
hostapd hostapd.conf -B
sleep 1
dnsmasq -C dnsmasq.conf

