#!/bin/bash -ex
NISE_IP_ADDRESS=${NISE_IP_ADDRESS:-`ip addr | grep 'inet .*global' | cut -f 6 -d ' ' | cut -f1 -d '/' | head -n 1`}

sed "s/192.168.10.10/${NISE_IP_ADDRESS}/g" ${DEVBOX_INSTALLER_DIR}/manifests/micro.yml > ${DEVBOX_INSTALLER_DIR}/manifests/micro_deploy.yml
sed "s/192.168.10.10/${NISE_IP_ADDRESS}/g" ${DEVBOX_INSTALLER_DIR}/manifests/services1.yml > ${DEVBOX_INSTALLER_DIR}/manifests/services1_deploy.yml
sed "s/192.168.10.10/${NISE_IP_ADDRESS}/g" ${DEVBOX_INSTALLER_DIR}/manifests/services2.yml > ${DEVBOX_INSTALLER_DIR}/manifests/services2_deploy.yml

(
    cd ${DEVBOX_WORKING_DIR}/nise_bosh
    bundle install
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh -y ../cf-release ${DEVBOX_INSTALLER_DIR}/manifests/micro_deploy.yml micro
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-release ${DEVBOX_INSTALLER_DIR}/manifests/micro_deploy.yml micro_ng
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-services-release ${DEVBOX_INSTALLER_DIR}/manifests/services1_deploy.yml mysql
    sudo env PATH=$PATH bundle exec ./bin/nise-bosh --keep-monit-files -y ../cf-services-contrib-release ${DEVBOX_INSTALLER_DIR}/manifests/services2_deploy.yml mongodb

)
