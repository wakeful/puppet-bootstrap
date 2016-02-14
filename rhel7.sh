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

# Puppet Labs public yum repo for rhel7
repoURL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"

if grep -qi "release 6" /etc/redhat-release; then
  # Puppet Labs public yum repo for rhel6
  repoURL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm"
fi

# install Puppet Labs public yum repo
sudo rpm -ivh ${repoURL} > /dev/null

# install Puppet
sudo yum install -y puppet-agent > /dev/null

echo "Puppet installed"

