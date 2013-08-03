#!/bin/bash -ex
(
  cd ${DEVBOX_WORKING_DIR}/cf-services-release
  bosh create release --force --non-interactive
)
