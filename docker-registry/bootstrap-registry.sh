#!/bin/sh
set -e

sudo apt-get -qy update
sudo apt-get install -qy git-core

git clone https://github.com/dotcloud/docker-registry.git
cd docker-registry/

sudo apt-get install -qy build-essential python-dev libevent-dev python-pip libssl-dev liblzma-dev
sudo pip install -r requirements.txt

cp -f config/config_sample.yml config/config.yml
mkdir -p /var/log/docker-registry

sudo cat << EOF > /etc/init/docker-registry.conf
description "Docker Registry"
version "0.6.3"
author "Docker, Inc."

start on runlevel [2345]
stop on runlevel [016]
respawn respawn limit 10 5

# set environment variables
env REGISTRY_HOME=/opt/docker-registry
env SETTINGS_FLAVOR=prod

script
	cd $REGISTRY_HOME
	exec gunicorn -k gevent --max-requests 100 --graceful-timeout 3600 -t 3600 -b 0.0.0.0:5000 -w 8 --access-logfile /var/log/docker-registry/access.log --error-logfile /var/log/docker-registry/error.log wsgi:application
end script
EOF

sudo start docker-registry
