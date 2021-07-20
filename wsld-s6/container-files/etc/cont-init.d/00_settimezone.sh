#!/usr/bin/with-contenv sh

set -e

#User params
# TIMEZONE=${TZ:="UTC"}
TIMEZONE=${TZ:="CST-8"}

# Set Timezone
echo "${TIMEZONE}" > /etc/TZ
