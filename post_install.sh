#!/bin/bash -ex

sed "s/${NISE_IP_ADDRESS}/0.0.0.0/g" /var/vcap/jobs/nats/config/nats.yml > /var/vcap/jobs/nats/config/nats.yml
