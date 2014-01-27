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