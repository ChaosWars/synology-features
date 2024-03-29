#!/bin/bash

if [[ ! -v ARCHITECTURE ]]; then
    echo "ARCHITECTURE is not set"
    exit 1
fi

if [[ ! -v PKGSCRIPTSPATH ]]; then
    echo "PKGSCRIPTSPATH is not set"
    exit 1
fi

ARCHITECTURE_INCLUDES="$PKGSCRIPTSPATH/include/platform.$ARCHITECTURE"

if [[ ! -f "$ARCHITECTURE_INCLUDES" ]]; then
    echo "Platform file $ARCHITECTURE_INCLUDES does not exist"
    exit 1
fi

source $ARCHITECTURE_INCLUDES

if [[ ! -v DSMVERSION ]]; then
    echo "DSMVERSION is not set"
    exit 1
fi

if [[ ! -v TOOLKITPATH ]]; then
    echo "TOOLKITPATH is not set"
    exit 1
fi

BUILD_ENV="$TOOLKITPATH/build_env/ds.$ARCHITECTURE-$DSMVERSION"
TARBALL_DIR="$TOOLKITPATH/toolkit_tarballs"

if [[ ! -d "$BUILD_ENV" ]]; then
    _ENV_DEPLOY_ARGS=""

    if [[ -f "$TARBALL_DIR/base_env-$DSMVERSION.txz" && -f "$TARBALL_DIR/ds.$ARCHITECTURE-$DSMVERSION.env.txz" && -f "$TARBALL_DIR/ds.$ARCHITECTURE-$DSMVERSION.dev.txz" ]]; then
        echo "Tarballs already present in $TARBALL_DIR"
        _ENV_DEPLOY_ARGS="-t $TARBALL_DIR"
    fi

    ${PKGSCRIPTSPATH}/EnvDeploy -v $DSMVERSION -p $ARCHITECTURE $_ENV_DEPLOY_ARGS
else
    echo "Environment already deployed"
fi
