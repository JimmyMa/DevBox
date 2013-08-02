#!/bin/bash -ex

(
  cd ${DEVBOX_WORKING_DIR}/cf-services-contrib-release
  bosh create release --force
)
