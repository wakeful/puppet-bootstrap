#!/bin/sh

set -e

if [ ! -f "/etc/redhat-release" ]; then
  echo "This script supports only rhel based systems."
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# add Puppet Labs public yum repo.
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm > /dev/null

# install Puppet
sudo yum install -y puppet-agent > /dev/null

echo "Puppet installed"

