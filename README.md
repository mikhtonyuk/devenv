Collection of Vagrant bootstraps.

docker
------

Vagrant base box with ``lxc-docker`` package installed.

Run `make-box.sh` to:

- download base VM - ``Ubuntu 13.10``

- install ``Docker`` inside of it

- create base ``ubuntu1310-docker.box`` box

docker-registry
---------------

Private ``Docker`` registry to be able to push and pull images internally.

Run `vagrant up` to:

- download base VM - ``Ubuntu 13.10``

- download and build ``docker-registry``

- create an ``upstart`` job for it

Registry will be available on port ``5000`` of this VM.

mesos-docker
------------

Vagrant base box for running ``Mesos`` cluster OS with ``Docker`` support.

Run `make-box.sh` to:

- set up ``ubuntu1310-docker`` VM

- download and install ``Zookeeper``, ``Mesos``, and ``Python`` extensions

- install ``mesos-docker`` executor to ``/usr/loca/libexec/mesos/mesos-docker``

- create base ``ubunto1310-mesos.box``

mesos-master
------------

Sets up ``Mesos`` master node.

Run `vagrant up` to:

- set up ``ubuntu1310-mesos`` VM

- download and install ``Marathon`` and ``Chronos`` frameworks

- configure ``upstart`` jobs

``Mesos`` master web UI will be available on port 5050 of the VM

``Marathon`` web UI will be available on port 5051 of the VM

``Chronos`` web UI will be available on port 5052 of the VM

mesos-cluster
-------------

Brings up ``Mesos`` cluster:

- Node ``docker-reg`` has ``docker-registry`` running on port 5000

- Node ``mesos-master`` has ``mesos`` (5050), ``marathon`` (5051), and ``chronos`` (5052) running

- Nodes ``slave-1`` and ``slave-2`` have ``mesos-slave`` running connected to master node

Make sure to install ``Vagrant Hostmanager`` plugin with `vagrant plugin install vagrant-hostmanager` so that VMs and host machine can use hostnames to referr to nodes. This is required for mesos to work properly.
