#!/bin/bash

mkdir -p ~/opt

# Download the AppImage inside it
curl -o ~/opt/Espanso.AppImage 'https://github.com/federico-terzi/espanso/releases/download/v2.1.6-beta/Espanso-X11.AppImage'

# Make it executable
chmod u+x ~/opt/Espanso.AppImage

# Create the "espanso" command alias
sudo ~/opt/Espanso.AppImage env-path register

espanso register
espanso start