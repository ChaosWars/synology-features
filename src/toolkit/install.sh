#!/bin/bash

set -eu

if [[ ! -d "${TOOLKITPATH}" ]]; then
    mkdir -p "${TOOLKITPATH}"
fi

ENTRYPOINT="/usr/local/sbin/entrypoint.sh"
PROFILE_DIR="/etc/profile.d"

./checkoutToolkit.sh

if [[ ! -d "${PROFILE_DIR}" ]]; then
    mkdir -p "${PROFILE_DIR}"
fi

ENVIRONMENT_FILE="99-synology-feature-toolkit.sh"
ENVIRONMENT_PATH="${PROFILE_DIR}/${ENVIRONMENT_FILE}"

./writeEnvironmentVariables.sh "${ENVIRONMENT_PATH}"
sed -e "s|ENVIRONMENT_PATH|$ENVIRONMENT_PATH|g" ./deployEnvironment.sh > "$ENTRYPOINT"
chmod +x "$ENTRYPOINT"
