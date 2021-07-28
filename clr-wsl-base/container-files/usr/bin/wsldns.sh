#!/bin/sh
set -e

#---- RESET wsl setting，DNS no 172.28.160.1 ----
#---- compat. for X410 server

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

exec $@
