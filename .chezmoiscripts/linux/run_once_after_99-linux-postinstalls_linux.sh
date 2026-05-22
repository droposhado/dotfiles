#!/usr/bin/env bash

set -e

sudo groupadd docker
sudo usermod -aG docker $USER
