#!/bin/bash -ex

if ! (which git); then
   sudo apt-get update
   sudo apt-get install -y git-core
fi

DEVBOX_URL=${DEVBOX_URL:-http://9.115.210.47:9393/mayunfeng/cloudoe_devbox.girt}

git clone ${DEVBOX_URL:-master}

cd cloudoe_devbox
sudo ./install.sh
