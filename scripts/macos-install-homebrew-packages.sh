#!/bin/bash

brew doctor
brew update
brew bundle --file="${PWD}/.Brewfile" --verbose
brew cleanup
