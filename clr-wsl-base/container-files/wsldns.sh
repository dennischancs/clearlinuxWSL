#!/bin/sh
set -e

#---- wsl setting，DNS no 172.28.160.1 ----
rm -f /etc/wsl.conf
echo "[network]" > /etc/wsl.conf
echo "generateResolvConf = false" >> /etc/wsl.conf
chmod 644 /etc/wsl.conf

chattr -i /etc/resolv.conf # cannot work in docker
rm -f /etc/resolv.conf
echo "# /etc/resolv.conf" > /etc/resolv.conf
echo "nameserver 223.5.5.5" >> /etc/resolv.conf
echo "nameserver 223.6.6.6" >> /etc/resolv.conf
chmod 755 /etc/resolv.conf
# readonly & cannot del
chattr +i /etc/resolv.conf # cannot work in docker

exec $@
