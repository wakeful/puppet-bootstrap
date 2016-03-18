#!/bin/sh

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

grep -qi 'FreeBSD' /usr/bin/uname > /dev/null 2>&1

if [ $? -eq 1 ]; then
  echo "This script supports only FreeBSD based systems."
  exit 1
fi

export ASSUME_ALWAYS_YES=yes

pkg update -f
pkg install puppet4

echo "Puppet installed"

