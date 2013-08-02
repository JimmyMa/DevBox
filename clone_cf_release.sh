#!/bin/bash -ex

CF_RELEASE_URL=${CF_RELEASE_URL:-https://github.com/cloudfoundry/cf-release.git}
CF_RELEASE_BRANCH=${CF_RELEASE_BRANCH:-master}
if [ ! -d ${DEVBOX_WORKING_DIR}/cf-release1 ]; then
(
  cd ${DEVBOX_WORKING_DIR}
#Jimmy  git clone ${CF_RELEASE_URL} 
  (
    cd cf-release
    git checkout ${CF_RELEASE_BRANCH}
    ./update
    ./update_sub
  )
)
fi
