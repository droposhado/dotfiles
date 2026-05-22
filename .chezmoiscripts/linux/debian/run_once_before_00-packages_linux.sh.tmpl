#!/usr/bin/env bash

set -e

if command -v apt-get >/dev/null; then

  sudo apt-get update
  sudo apt-get install -y "linux-headers-$(uname -r)" --no-install-recommends

  sudo apt-get install -y --no-install-recommends \
    {{ range .chezmoidata.packages.debian.base }}
      {{ . }} \
    {{ end }}

  if [ "${AMD}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      {{ range .chezmoidata.packages.debian.amd }}
        {{ . }} \
      {{ end }}
  fi

  if [ "${DEV}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      {{ range .chezmoidata.packages.debian.dev }}
        {{ . }} \
      {{ end }}
  fi

  if [ "${GUI}" = "1" ]; then
    sudo apt-get install -y --no-install-recommends \
      {{ range .chezmoidata.packages.debian.gui }}
        {{ . }} \
      {{ end }}
  fi
fi