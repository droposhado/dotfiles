
################################################################################
# Variables

OS := $(shell uname -s)
DISTRO := $(shell lsb_release -is)
CODINAME := $(shell lsb_release -cs)
HOSTNAME := moon
LOCALE := en_US
TIMEZONE := America/Sao_Paulo
DOCKER_APT_IMAGE=$(PWD)/scripts/check_packages_apt/Dockerfile

GUI_ENABLED=1
AMD_DRIVER_ENABLED=1

# Export to use in shell files
export OS
export DISTRO
export CODINAME
export HOSTNAME
export LOCALE
export TIMEZONE
export DOCKER_APT_IMAGE

export GUI_ENABLED
export AMD_DRIVER_ENABLED

# Import commands
include ./Makefile.setup
include ./Makefile.install
include ./Makefile.update
include ./Makefile.test

################################################################################
# default target

all: install

install: setup dot install-fonts

dot: install-dotbins install-dotfiles install-dotfolders
