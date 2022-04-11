#!/bin/bash

# LOCALE and TIMEZONES comming from Makefile

locale-gen "${LOCALE}.UTF-8"
dpkg-reconfigure -f noninteractive locales
update-locale LANG=${LOCALE}.utf8

# for systemd
# timedatectl set-timezone $(TIMEZONE)

ln -sfn /usr/share/zoneinfo/${TIMEZONES} /etc/localtime
