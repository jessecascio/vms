#!/usr/bin/env bash

# used to install puppet on client VMs
sudo rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
sudo yum -y install puppet
