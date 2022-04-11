#!/bin/bash

# macOS have different paths to settings
ln -sfn "$(PWD)/.config/espanso" "$(HOME)/Library/Preferences/espanso"

espanso register
espanso start
