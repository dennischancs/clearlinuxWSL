#!/bin/sh
set -e

echo "Service 'All': Status"

rc-status -a

echo "Service 'docker': Starting ..."

rc-service docker start

exec $@
