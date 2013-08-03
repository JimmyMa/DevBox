#!/bin/bash -ex
(
  cd ${DEVBOX_WORKING_DIR}/cf-services-release
  bosh --non-interactive create release --force 
)
