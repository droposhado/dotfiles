#!/usr/bin/env bash

set -e

getent group docker >/dev/null || sudo groupadd docker
sudo usermod -aG docker $USER
