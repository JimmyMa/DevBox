#!/bin/bash -ex

CF_SERVICES_RELEASE_URL=${CF_SERVICES_RELEASE_URL:-https://github.com/cloudfoundry/cf-services-release.git}
CF_SERVICES_RELEASE_BRANCH=${CF_SERVICES_RELEASE_BRANCH:-master}
if [ ! -d ${DEVBOX_WORKING_DIR}/cf-services-release1 ]; then
(
    cd ${DEVBOX_WORKING_DIR}

   # git clone ${CF_SERVICES_RELEASE_URL}
    (
        cd cf-services-release
        git checkout ${CF_SERVICES_RELEASE_BRANCH}
        ./update
    )
)
fi
