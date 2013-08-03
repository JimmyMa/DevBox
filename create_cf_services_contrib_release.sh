#!/bin/bash -ex
rbenv local 1.9.3-p448 

(
  cd ${DEVBOX_WORKING_DIR}/cf-services-contrib-release
  bosh --non-interactive create release --force
)
