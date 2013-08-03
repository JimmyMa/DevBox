#!/bin/bash -ex

(
  cd ${DEVBOX_WORKING_DIR}/cf-release
  bosh --non-interactive create release --force  
)
