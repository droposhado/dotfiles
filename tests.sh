#!/bin/bash

# check brew file packages
# python scripts/check_packages_homebrew.py .Brewfile

# check shell scripts
# The --shell=bash remove shebang error
shellcheck --shell=bash .aliases
shellcheck --shell=bash .bash_profile
shellcheck --shell=bash .bashrc
shellcheck --shell=bash .exports
shellcheck --shell=bash .functions
shellcheck --shell=bash .xinitrc
shellcheck bin/lock
shellcheck bin/logout
shellcheck bin/ngit
shellcheck bin/nw
shellcheck bin/week

# check python files
find . -name "*.py" -not -path "./.vim/*" | xargs pylint
flake8
isort .
bandit -r . -v
