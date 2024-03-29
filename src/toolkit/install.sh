#!/bin/bash

set -eu

if [[ ! -d "${TOOLKITPATH}" ]]; then
    mkdir -p "${TOOLKITPATH}"
fi

ENTRYPOINT="/usr/local/sbin/entrypoint.sh"

./checkoutToolkit.sh
./writeEnvironmentVariables.sh "/etc/profile.d/99-synology-feature-toolkit.sh"
cp ./deployEnvironment.sh "$ENTRYPOINT"
chmod +x "$ENTRYPOINT"
