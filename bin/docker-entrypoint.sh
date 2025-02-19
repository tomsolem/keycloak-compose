#!/bin/sh

set -e

custom_volume=/home/keycloak/customizations

# Copy any file changes mounted to customization folder
test -d ${custom_volume} && [ "$(ls -A ${custom_volume})" ] && cp -RL ${custom_volume}/* /opt/keycloak/

# Start Keycloak in development mode
sh /opt/keycloak/bin/kc.sh start-dev --verbose
