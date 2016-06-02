#!/bin/sh

set -e

if [ ! -f "/etc/debian_version" ]; then
  echo "This script supports only debian based systems."
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

if ! grep -qi "8." /etc/debian_version; then
  echo "This script supports only debian 8 jessie."
  exit 1
fi

# Puppet Labs public apt repo for debian 8 jessie
repoURL="https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb"

# install Puppet Labs public apt repo
sudo curl $repoURL > /tmp/repo.deb
sudo dpkg -i /tmp/repo.deb > /dev/null

# install Puppet
sudo apt-get update > /dev/null
sudo apt-get install -y puppet-agent > /dev/null

echo "Puppet installed"
