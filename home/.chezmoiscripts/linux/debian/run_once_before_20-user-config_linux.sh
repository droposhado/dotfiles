#!/usr/bin/env bash

set -e

xdg-mime default org.pwmt.zathura.desktop application/pdf

# https://stackoverflow.com/a/67185532
xdg-mime default firefox-esr.desktop x-scheme-handler/https
xdg-mime default firefox-esr.desktop x-scheme-handler/http

# update font cache
fc-cache -f -v

# cp "${PWD}/.config/mutt/muttrc.local.example" "${HOME}/.config/mutt/muttrc.local"

#systemctl --user enable vdirsyncer.timer
#systemctl --user start vdirsyncer.timer
#systemctl --user enable offlineimap-oneshot.timer
#systemctl --user start offlineimap-oneshot.timer
systemctl --user daemon-reload
