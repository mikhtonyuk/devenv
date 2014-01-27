#!/bin/sh
set -e

sudo apt-get -qy update
sudo apt-get install -qy zookeeperd default-jre python-setuptools python-protobuf curl

curl -sSfL http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.16.0-rc4_amd64.deb --output /tmp/mesos.deb
sudo dpkg -i /tmp/mesos.deb
rm -f /tmp/mesos.deb

curl -sSfL http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.16.0-rc4_amd64.egg --output /tmp/mesos.egg
sudo easy_install /tmp/mesos.egg
rm -f /tmp/mesos.egg

sudo sh -c "echo 'manual' > /etc/init/mesos-master.override"
sudo sh -c "echo 'manual' > /etc/init/mesos-slave.override"
sudo sh -c "echo 'manual' > /etc/init/zookeeper.override"

sudo curl -sSfL http://downloads.mesosphere.io/mesos-docker/mesos-docker --output /usr/local/libexec/mesos/mesos-docker
sudo easy_install httpie
