#!/bin/bash -ex

(
  cd ${DEVBOX_WORKING_DIR}/cf-release
  bosh create release --force 
)
