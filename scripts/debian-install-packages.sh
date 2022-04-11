#!/bin/bash

apt-get update
apt-get install -y "linux-headers-$(uname -r)" --no-install-recommends

awk -F'#' '{print $1}' "${PWD}/.Aptfile" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y

awk -F'#' '{print $1}' "${PWD}/.Aptfile.selfpackaged" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y
