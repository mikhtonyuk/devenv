#!/bin/sh
set -e

cd /opt

mkdir marathon
curl -sSfL http://downloads.mesosphere.io/maven/mesosphere/marathon/0.4.0/marathon-0.4.0-jar-with-dependencies.jar --output marathon/marathon.jar

curl -sSfL http://downloads.mesosphere.io/chronos/chronos-2.0.1_mesos-0.14.0-rc4.tgz --output chronos.tgz
tar xzf chronos.tgz 
rm chronos.tgz



rm /etc/init/zookeeper.override
rm /etc/init/mesos-master.override


cat << EOF > /etc/init/marathon.conf
description "Marathon Mesos Framework"
version "0.4.0"
author "Mesosphere, Inc."

start on runlevel [2345]
stop on runlevel [!2345]

respawn
respawn limit 10 5

env MESOS_NATIVE_LIBRARY=/usr/local/lib/libmesos.so
exec java -jar /opt/marathon/marathon.jar --master zk://127.0.0.1:2181/mesos --zk_hosts 127.0.0.1:2181 --http_port 5051
EOF


cat << EOF > /etc/init/chronos.conf
description "Chronos Mesos Framework"
version "2.0.1"
author "Airbnb, Inc."

start on runlevel [2345]
stop on runlevel [!2345]

respawn
respawn limit 10 5

env MESOS_NATIVE_LIBRARY=/usr/local/lib/libmesos.so
exec /opt/chronos/bin/start-chronos.bash --master zk://127.0.0.1:2181/mesos --zk_hosts 127.0.0.1:2181 --http_port 5052
EOF


start zookeeper
start mesos-master
start marathon
start chronos
