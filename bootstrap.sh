#!/bin/bash -ex

if ! (which git); then
   sudo apt-get update
   sudo apt-get install -y git-core
fi

DEVBOX_URL=${DEVBOX_URL:-https://github.com/yudai/cf_nise_installer.git}

git clone ${DEVBOX_URL:-master}
