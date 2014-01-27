#!/bin/bash
set -e

vagrant up
vagrant package --output ubuntu1310-mesos.box
vagrant destroy -f