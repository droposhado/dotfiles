#!/usr/bin/env bash

set -e

if command -v nvim >/dev/null 2>&1; then
  nvim --headless +PlugInstall +qall 2>/dev/null || true
elif command -v vim >/dev/null 2>&1; then
  vim -E -s +PlugInstall +qall 2>/dev/null || true
fi
