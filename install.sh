#!/bin/bash -ex

export DEVBOX_WORKING_DIR=${DEVBOX_WORKING_DIR:-~/devbox/workspace}
export DEVBOX_INSTALLER_DIR=$(pwd)

if [ ! -d ${DEVBOX_WORKING_DIR} ]; then
  mkdir ${DEVBOX_WORKING_DIR}
fi
# Git bootstrap
if ! (which git); then
    sudo apt-get update
    sudo apt-get install -y git-core
fi

# Nise BOSH
if [ ! -d ${DEVBOX_WORKING_DIR}/nise_bosh ]; then
  git clone https://github.com/nttlabs/nise_bosh.git ${DEVBOX_WORKING_DIR}/nise_bosh	
fi
(
  cd ${DEVBOX_WORKING_DIR}/nise_bosh
#Jimmy  sudo ./bin/init
)

# Ruby
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
    echo 'eval "$(rbenv init -)"' >> ~/.profile
fi
. ~/.profile
if ! (rbenv versions | grep -q 1.9.3-p448); then
    rbenv install 1.9.3-p448
fi
rbenv local 1.9.3-p448

# BOSH CLI and CF commands
#Jimmy gem install bundler --no-rdoc --no-ri
#gem install bosh_cli -v "~> 1.5.0.pre" --source https://s3.amazonaws.com/bosh-jenkins-gems/ --no-rdoc --no-ri
#gem install cf admin-cf-plugin --no-rdoc --no-ri
rbenv rehash

# cf-release
./clone_cf_release.sh
./create_cf_release.sh

#./clone_cf_services_release.sh
#./create_cf_release.sh

#./clone_cf_services_contrib_release.sh
#./create_cf_services_contrib_release.sh
# Run
./launch_nise_bosh.sh


echo "Done!"
echo "RESTART your server!"
