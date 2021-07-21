#!/bin/sh
set -e

# `service docker start` in alpine
# Step1
mkdir -p /run/openrc
touch /run/openrc/softlevel

# Step2
echo "Service 'All': Status"
rc-status -a

echo "Service 'docker': Starting ..."

rc-service docker start

exec $@
