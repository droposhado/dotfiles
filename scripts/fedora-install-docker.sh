#!/bin/bash

dnf -y install dnf-plugins-core

dnf config-manager --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

systemctl enable docker

systemctl start docker