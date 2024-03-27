#!/bin/bash

if [[ ! -v DSMVERSION ]]; then
    echo "DSMVERSION is not set"
    exit 1
fi

if [[ ! -v TOOLKITPATH ]]; then
    echo "TOOLKITPATH is not set"
    exit 1
fi

if [[ ! -v PKGSCRIPTSDIR ]]; then
    echo "PKGSCRIPTSDIR is not set"
    exit 1
fi

cd ${TOOLKITPATH}

_BRANCH="DSM${DSMVERSION}"

if [[ ! -d "${PKGSCRIPTSDIR}" ]]; then
    export PRODUCT="DSM"
    git clone -b $_BRANCH https://github.com/SynologyOpenSource/${PKGSCRIPTSDIR}
else
    cd "${PKGSCRIPTSDIR}"
    git pull origin
fi
