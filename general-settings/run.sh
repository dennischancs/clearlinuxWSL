#!/bin/sh
# wsl setting，DNS no 172.28.160.1
rm -f /etc/wsl.conf
cp -f wsl.conf /etc/wsl.conf
chmod 644 /etc/wsl.conf

rm -f /etc/resolv.conf
cp resolv.conf /etc/resolv.conf
chmod 644 /etc/resolv.conf

# readonly & cannot del
chattr +i /etc/resolv.conf
  #chmod -wx /etc/resolv.conf