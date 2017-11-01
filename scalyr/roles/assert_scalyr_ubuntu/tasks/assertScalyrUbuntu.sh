#!/bin/bash
# Refs: https://www.scalyr.com/help/install-agent-linux

SCALYR_API_KEY=""

if [ -z "$SCALYR_API_KEY" ] ; then
	echo -e "Please set the \"SCALYR_API_KEY\" variable"
	exit 1
fi


wget -q https://www.scalyr.com/scalyr-repo/stable/latest/scalyr-repo-bootstrap_1.2.1_all.deb
sudo dpkg -r scalyr-repo scalyr-repo-bootstrap  # Remove any previous repository definitions, if any.
sudo dpkg -i scalyr-repo-bootstrap_1.2.1_all.deb
sudo apt-get update
sudo apt-get install scalyr-repo
sudo apt-get install scalyr-agent-2

sudo scalyr-agent-2-config --set-key "$SCALYR_API_KEY"
