#!/bin/bash

# CODINAME comming from Makefile
# generated with:
# lsb_release -cs

cat <<-EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ ${CODINAME} main contrib non-free
deb-src http://deb.debian.org/debian/ ${CODINAME} main contrib non-free

deb http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free
deb-src http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free

deb http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free
deb-src http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free
EOF

cat <<-EOF > /etc/apt/sources.list.d/deb.droposhado.org.list
deb [trusted=yes] https://deb.droposhado.org/ /
EOF
