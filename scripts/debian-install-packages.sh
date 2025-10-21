#!/bin/bash

apt-get update
apt-get install -y "linux-headers-$(uname -r)" --no-install-recommends

awk -F'#' '{print $1}' "${PWD}/.Aptfile" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y

awk -F'#' '{print $1}' "${PWD}/.Aptfile.dev" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y

if [[ $AMD_DRIVER_ENABLED -eq 1 ]];then
	awk -F'#' '{print $1}' "${PWD}/.Aptfile.amd" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y
fi

if [[ $GUI_ENABLED -eq 1 ]];then
	awk -F'#' '{print $1}' "${PWD}/.Aptfile.gui" | awk 'NF > 0' | \
	xargs sudo apt-get --no-install-recommends install -y
fi
