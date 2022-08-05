#!/bin/bash

dnf install -y kernel-devel

awk -F'#' '{print $1}' "${PWD}/.Dnffile" | awk 'NF > 0' | \
	xargs sudo dnf install --setopt=install_weak_deps=False -y

