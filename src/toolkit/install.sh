#!/bin/bash

set -eu
env

if [[ ! -d "${TOOLKITPATH}" ]]; then
    mkdir -p "${TOOLKITPATH}"
fi

./checkoutToolkit.sh
cp ./deployEnvironment.sh "/usr/local/sbin/deployEnvironment.sh"
chmod +x "/usr/local/sbin/deployEnvironment.sh"
