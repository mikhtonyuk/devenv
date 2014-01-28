Collection of Vagrant bootstraps.

docker
------

Run `make-box.sh` to:

- download base VM - ``Ubuntu 13.10``

- install ``Docker`` inside of it

- create base ``ubuntu1310-docker.box`` box

docker-registry
---------------

Run `vagrant up` to:

- download base VM - ``Ubuntu 13.10``

- download and build ``docker-registry``

- creates an ``upstart`` job for it

Registry will be available on port ``5000`` of this VM.

mesos-docker
------------

Run `make-box.sh` to:

- set up ``ubuntu1310-docker`` VM

- download and install ``Zookeeper``, ``Mesos``, and ``Python`` extensions

- install ``mesos-docker`` executor to ``/usr/loca/libexec/mesos/mesos-docker``

- create base ``ubunto1310-mesos.box``

mesos-master
------------

Run `vagrant up` to:

- set up ``ubuntu1310-mesos`` VM

- download and install ``Marathon`` and ``Chronos`` frameworks

- configure ``upstart`` jobs

``Mesos`` master web UI will be available on port 5050 of the VM

``Marathon`` web UI will be available on port 5051 of the VM

``Chronos`` web UI will be available on port 5052 of the VM
