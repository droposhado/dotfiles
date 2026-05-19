#!/usr/bin/env bash
set -e

AMD=$(chezmoi execute-template '{{ .chezmoidata.amd }}')
DEV=$(chezmoi execute-template '{{ .chezmoidata.dev }}')
GUI=$(chezmoi execute-template '{{ .chezmoidata.gui }}')

if command -v apt-get >/dev/null; then
  CODINAME=$(lsb_release -cs)

  sudo cat <<-EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ ${CODINAME} main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ ${CODINAME} main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ ${CODINAME}-updates main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security ${CODINAME}-security main contrib non-free non-free-firmware
EOF

  sudo apt-get update
  sudo apt-get install -y "linux-headers-$(uname -r)" --no-install-recommends

  sudo apt-get install -y --no-install-recommends \
    $(chezmoi execute-template '{{ join " " .chezmoidata.packages.base }}')

  if [ "$AMD" = "true" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.amd }}')
  fi

  if [ "$DEV" = "true" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.dev }}')
  fi

  if [ "$GUI" = "true" ]; then
    sudo apt-get install -y --no-install-recommends \
      $(chezmoi execute-template '{{ join " " .chezmoidata.packages.gui }}')
  fi
fi