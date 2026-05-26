#!/usr/bin/env bash

# tmux-nord-theme:
curl -sSL https://github.com/nordtheme/tmux/archive/develop.tar.gz \
  -o nord-tmux.tar.gz
tar -xzvf "${PWD}/nord-tmux.tar.gz" -C "${PWD}/.config/tmux/themes/nord-tmux" --strip-components=1
rm -rf nord-tmux.tar.gz

# zathura-nord-theme:
rm -rf "${PWD}/.config/zathura/base16-nord.config"
curl -sSL https://raw.githubusercontent.com/HaoZeke/base16-zathura/refs/heads/main/build_schemes/recolors/base16-nord.config \
  -o .config/zathura/$(PREFIX_TEST)base16-nord.config

# xresources-nord-theme:
curl -sSL https://github.com/nordtheme/xresources/archive/develop.tar.gz \
  -o nord-xresources.tar.gz
tar -xzvf "${PWD}/nord-xresources.tar.gz" -C "${PWD}/.config/xresources/themes/nord-xresources" \
  --strip-components=1
rm -rf nord-xresources.tar.gz

# font-fontawesome:
curl -sSL https://github.com/FortAwesome/Font-Awesome/archive/master.tar.gz \
  -o fontawesome.tar.gz
mkdir fontawesome
tar -xzvf "${PWD}/fontawesome.tar.gz" -C "${PWD}/fontawesome" --strip-components=1
mv "${PWD}/fontawesome/otfs/"*.otf "${PWD}/.fonts/fontawesome"
rm -rf fontawesome.tar.gz
rm -rf fontawesome

# font-noto:
curl -sSL https://github.com/googlefonts/noto-emoji/archive/main.tar.gz \
  -o noto-emoji.tar.gz
mkdir noto-emoji
tar -xzvf "${PWD}/noto-emoji.tar.gz" -C "${PWD}/noto-emoji" --strip-components=1
mv "${PWD}/noto-emoji/fonts/"*.ttf "${PWD}/.fonts/noto/"
rm -rf noto-emoji.tar.gz
rm -rf noto-emoji
