#!/bin/bash -ex
(
    cd ${DEVBOX_WORKING_DIR}/nise_bosh
    bundle install
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh -y ../cf-release ${DEVBOX_INSTALLER_DIR}/manifests/micro.yml micro
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-release ${DEVBOX_INSTALLER_DIR}/manifests/deploy.yml micro_ng
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-services-release ${DEVBOX_INSTALLER_DIR}/manifests/mysql.yml mysql
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-services-contrib-release ${DEVBOX_INSTALLER_DIR}/manifests/mongodb.yml mongodb

)
