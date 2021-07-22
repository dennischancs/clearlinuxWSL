#!/bin/sh
set -e

#---- RESET wsl setting，DNS no 172.28.160.1 ----
if test -f "/etc/wsl.conf"; then
  cp -f /etc/wsl.conf /etc/wsl.conf.bak
  rm -f /etc/wsl.conf
  echo "[network]" > /etc/wsl.conf
  echo "generateResolvConf = false" >> /etc/wsl.conf
  chmod 644 /etc/wsl.conf
fi

if test -f "/etc/resolv.conf"; then
  cp -f /etc/resolv.conf /etc/resolv.conf.bak
  chattr -i /etc/resolv.conf # cannot work in docker
  rm -f /etc/resolv.conf
  echo "# /etc/resolv.conf" > /etc/resolv.conf
  echo "nameserver 223.5.5.5" >> /etc/resolv.conf
  echo "nameserver 223.6.6.6" >> /etc/resolv.conf
  chmod 644 /etc/resolv.conf
  # readonly & cannot del
  chattr +i /etc/resolv.conf # cannot work in docker
fi
#---- `service docker start` in alpine----
# Step1
mkdir -p /run/openrc
touch /run/openrc/softlevel

# Step2
echo "Service 'All': Status"
rc-status -a

echo "Service 'docker': Starting ..."

rc-service docker start

exec $@
