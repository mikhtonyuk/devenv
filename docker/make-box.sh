#!/bin/bash
set -e

vagrant up
vagrant package --output ubuntu1310-docker.box
vagrant destroy -f