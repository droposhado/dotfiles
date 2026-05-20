#!/usr/bin/env bash
set -e

if command -v apt-get >/dev/null; then
  CODINAME=$(lsb_release -cs)

  echo "
deb http://deb.debian.org/debian/ ${CODINAME} main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ ${CODINAME} main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free non-free-firmware" | \
  sudo tee /etc/apt/sources.list

  sudo apt-get update
  sudo apt-get install -y "linux-headers-$(uname -r)" --no-install-recommends

  sudo apt-get install -y --no-install-recommends \
    $(chezmoi execute-template '{{ join " " .chezmoidata.packages.debian.base }}')

  if [ "${AMD}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.debian.amd }}')
  fi

  if [ "${DEV}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.debian.dev }}')
  fi

  if [ "${GUI}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.debian.gui }}')
  fi
fi