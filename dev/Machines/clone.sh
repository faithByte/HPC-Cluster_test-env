#!/bin/bash

# "RedHat/Debian Mirror Server/Client" are made using the vagrant file in this dir [Debian, RedHat] 
# + we've run the roles mirror-server(master) mirror-client(node)

# RedHat
vagrant package --output node_rocky9.box --base "Rocky Mirror Client"
vagrant box add node_rocky9 ./node_rocky9.box --force

vagrant package --output master_rhel9.box --base "RedHat Mirror Server"
vagrant box add master_rhel9 ./master_rhel9.box --force


# Debian
vagrant package --output node_debian.box --base "Debian Mirror Client"
vagrant box add node_debian ./node_debian.box

vagrant package --output master_debian.box --base "Debian Mirror Server"
vagrant box add master_debian ./master_debian.box --force

rm -f node_debian.box master_debian.box node_rocky9.box master_rhel9.box