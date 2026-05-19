#!/usr/bin/env bash

xdg-mime default org.pwmt.zathura.desktop application/pdf

# https://stackoverflow.com/a/67185532
xdg-mime default firefox-esr.desktop x-scheme-handler/https
xdg-mime default firefox-esr.desktop x-scheme-handler/http

# update font cache
fc-cache -f -v

cp "${PWD}/.config/mutt/muttrc.local.example" "${HOME}/.config/mutt/muttrc.local"

sudo timedatectl set-timezone $(chezmoi execute-template '{{ join " " .chezmoidata.timezone }}')

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

#systemctl --user enable vdirsyncer.timer
#systemctl --user start vdirsyncer.timer
#systemctl --user enable offlineimap-oneshot.timer
#systemctl --user start offlineimap-oneshot.timer
systemctl --user daemon-reload

if command -v apt-get >/dev/null; then
  LOCALE_NEW=$(chezmoi execute-template '{{ .chezmoidata.locale }}')

  sudo locale-gen "$LOCALE_NEW.UTF-8"
  sudo dpkg-reconfigure -f noninteractive locales
  sudo update-locale LANG=$LOCALE_NEW.utf8
fi
