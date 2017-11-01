#!/bin/bash
# Derived via: https://www.scalyr.com/help/install-agent-linux
# This is a little diddy by James T Snell. Perhaps I'd be smarter

SCALYR_API_KEY=""

if [ -z "$SCALYR_API_KEY" ] ; then
	echo "Error: The SCALYR_API_KEY variable must be set to use this script ($0)"
	exit 1
fi

wget -q https://www.scalyr.com/scalyr-repo/stable/latest/scalyr-repo-bootstrap-1.2.1-1.noarch.rpm
sudo yum -y remove scalyr-repo scalyr-repo-bootstrap  # Remove any previous repository definitions, if any.
sudo yum -y install --nogpgcheck scalyr-repo-bootstrap-1.2.1-1.noarch.rpm
sudo yum -y install scalyr-repo
sudo yum -y install scalyr-agent-2

sudo scalyr-agent-2-config --set-key "$SCALYR_API_KEY"

sudo scalyr-agent-2 start
