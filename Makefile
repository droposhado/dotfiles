
################################################################################
# Variables

OS := $(shell uname -s)
DISTRO := $(shell lsb_release -is)
CODINAME := $(shell lsb_release -cs)
HOSTNAME := moon
LOCALE := en_US
TIMEZONE := America/Sao_Paulo
DOCKER_APT_IMAGE=$(PWD)/scripts/check_packages_apt/Dockerfile

# Export to use in shell files
export OS
export DISTRO
export CODINAME
export HOSTNAME
export LOCALE
export TIMEZONE
export DOCKER_APT_IMAGE

################################################################################
# default target

all: install

install: setup dot install-fonts

dot: install-dotbins install-dotfiles install-dotfolder

################################################################################
# SETUP

setup: setup-$(OS)

setup-Darwin: install-starship install-gvm
	chsh -s /bin/bash

	sudo scutil --set LocalHostName $(HOSTNAME)
	sudo scutil --set ComputerName $(HOSTNAME)
	sudo scutil --set ComputerName $(HOSTNAME)

	bash "$(PWD)/scripts/macos-config-general.sh"
	bash "$(PWD)/scripts/macos-config-battery.sh"
	bash "$(PWD)/scripts/macos-config-desktop.sh"
	bash "$(PWD)/scripts/macos-config-energy-saving.sh"
	bash "$(PWD)/scripts/macos-config-finder.sh"
	bash "$(PWD)/scripts/macos-config-input.sh"
	bash "$(PWD)/scripts/macos-config-mac-app-store.sh"
	bash "$(PWD)/scripts/macos-config-mail.sh"
	bash "$(PWD)/scripts/macos-config-photos.sh"
	bash "$(PWD)/scripts/macos-config-safari.sh"
	bash "$(PWD)/scripts/macos-config-screen.sh"
	bash "$(PWD)/scripts/macos-config-timemachine.sh"

	bash "$(PWD)/scripts/macos-install-homebrew.sh"
	bash "$(PWD)/scripts/macos-install-homebrew-packages.sh"
	bash "$(PWD)/scripts/macos-config-rectangle.sh"
	bash "$(PWD)/scripts/macos-config-itsycal.sh"
	bash "$(PWD)/scripts/macos-config-tweetbot.sh"
	bash "$(PWD)/scripts/macos-config-espanso.sh"

setup-Linux: setup-$(DISTRO) install-pyenv install-starship install-gvm
	xdg-mime default org.pwmt.zathura.desktop application/pdf

setup-Debian:
	sudo -E bash "$(PWD)/scripts/debian-config-locales.sh"
	sudo -E bash "$(PWD)/scripts/debian-config-sourceslist.sh"
	sudo bash "$(PWD)/scripts/debian-install-packages.sh"

	# bash "$(PWD)/scripts/debian-config-espanso.sh"

setup-Arch:
	# bash "$(PWD)/scripts/arch-config-espanso.sh"
	@echo "No Arch specific commands"

setup-Fedora:
	sudo bash "$(PWD)/scripts/fedora-install-packages.sh"
	sudo bash "$(PWD)/scripts/fedora-install-i3status.sh"
	sudo bash "$(PWD)/scripts/fedora-install-docker.sh"

	# bash "$(PWD)/scripts/fedora-config-espanso.sh"

################################################################################
# INSTALL

install-dotbins:
	if test ! -d $(HOME)/bin; then mkdir $(HOME)/bin; fi
	ln -sfn $(PWD)/bin/horizonte.py $(HOME)/bin/horizonte
	ln -sfn $(PWD)/bin/lock $(HOME)/bin/lock
	ln -sfn $(PWD)/bin/logout $(HOME)/bin/logout
	ln -sfn $(PWD)/bin/ndate.py $(HOME)/bin/ndate
	ln -sfn $(PWD)/bin/ngit $(HOME)/bin/ngit
	ln -sfn $(PWD)/bin/nw $(HOME)/bin/nw
	ln -sfn $(PWD)/bin/play-pause.sh $(HOME)/bin/play-pause
	ln -sfn $(PWD)/bin/rename.py $(HOME)/bin/rename
	ln -sfn $(PWD)/bin/week $(HOME)/bin/week

install-dotfiles:
	if test ! -d $(HOME)/.config; then mkdir $(HOME)/.config; fi
	ln -sfn "${PWD}/.aliases" "${HOME}/.aliases"
	ln -sfn "${PWD}/.bash_profile" "${HOME}/.bash_profile"
	ln -sfn "${PWD}/.bash_prompt" "${HOME}/.bash_prompt"
	ln -sfn "${PWD}/.bashrc" "${HOME}/.bashrc"
	ln -sfn "${PWD}/.exports" "${HOME}/.exports"
	ln -sfn "${PWD}/.functions" "${HOME}/.functions"
	ln -sfn "${PWD}/.gitconfig" "${HOME}/.gitconfig"
	ln -sfn "${PWD}/.inputrc" "${HOME}/.inputrc"
	ln -sfn "${PWD}/.taskrc" "${HOME}/.taskrc"
	ln -sfn "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
	ln -sfn "${PWD}/.vimrc" "${HOME}/.vimrc"
	ln -sfn "${PWD}/.xinitrc" "${HOME}/.xinitrc"
	ln -sfn "${PWD}/.Xresources" "${HOME}/.Xresources"
	ln -sfn "${PWD}/.config/starship.toml" "${HOME}/.config/starship.toml"

install-dotfolder:
	if test ! -d $(HOME)/.config; then mkdir $(HOME)/.config; fi
	if test ! -d $(HOME)/.config/alacritty; then rm -rf $(HOME)/.config/alacritty; fi
	if test ! -d $(HOME)/.config/dunst; then rm -rf $(HOME)/.config/dunst; fi
	if test ! -d $(HOME)/.config/espanso; then rm -rf $(HOME)/.config/espanso; fi
	if test ! -d $(HOME)/.config/git; then rm -rf $(HOME)/.config/git; fi
	if test ! -d $(HOME)/.config/i3; then rm -rf $(HOME)/.config/i3; fi
	if test ! -d $(HOME)/.config/i3status-rust; then rm -rf $(HOME)/.config/i3status-rust; fi
	if test ! -d $(HOME)/.config/tmux; then rm -rf $(HOME)/.config/tmux; fi
	if test ! -d $(HOME)/.config/xresources; then rm -rf $(HOME)/.config/xresources; fi
	ln -sfn "${PWD}/.config/alacritty" "${HOME}/.config/alacritty"
	ln -sfn "${PWD}/.config/dunst" "${HOME}/.config/dunst"
	ln -sfn "${PWD}/.config/espanso" "${HOME}/.config/espanso"
	ln -sfn "${PWD}/.config/i3" "${HOME}/.config/i3"
	ln -sfn "${PWD}/.config/i3status-rust" "${HOME}/.config/i3status-rust"
	ln -sfn "${PWD}/.config/git" "${HOME}/.config/git"
	ln -sfn "${PWD}/.config/tmux" "${HOME}/.config/tmux"
	ln -sfn "${PWD}/.vim" "${HOME}/.vim"
	ln -sfn "${PWD}/.config/xresources" "${HOME}/.config/xresources"

install-fonts:
	if test ! -d $(HOME)/.fonts; then mkdir $(HOME)/.fonts; fi
	ln -sfn "${PWD}/.fonts/fontawesome" "${HOME}/.fonts/fontawesome"
	fc-cache -f -v

install-gvm:
	if test ! -d "$(HOME)/.gvm"; then \
		bash "$(PWD)/scripts/common-install-gvm.sh"; \
	fi

install-pyenv:
	if test ! -d "$(HOME)/.pyenv"; then \
		bash "$(PWD)/scripts/linux-install-pyenv.sh"; \
	fi

install-starship:
	sudo mkdir -p /usr/local/bin
	sh "$(PWD)/scripts/common-install-starship.sh" --yes

install-vim:
	vim +PlugInstall +qall

xorg: install-xorg

install-xorg:
	# only copy, link create a security leaks
	sudo cp etc/X11/xorg.conf.d/20-lg-monitor-23mp55.conf /etc/X11/xorg.conf.d

################################################################################
# UPDATES

update: update-hammerspoon-lua update-tmux-nord-theme update-vim-plug \
	update-vim update-install-scripts update-xresources-nord-theme \
	update-fonts

update-install-scripts: update-homebrew-install-script \
	update-pyenv-install-script \
	update-starship-install-script \
	update-gvm-install-script

update-hammerspoon-lua: update-lit-slugify update-lit-string-trim

update-fonts: update-font-fontawesome update-font-noto

update-lit-slugify:
	curl -sSL https://github.com/james2doyle/lit-slugify/archive/master.tar.gz \
		-o lit-slugify.tar.gz
	tar -xzvf "${PWD}/lit-slugify.tar.gz" -C "${PWD}/.hammerspoon/lit-slugify" --strip-components=1
	rm -rf lit-slugify.tar.gz

update-lit-string-trim:
	curl -sSL https://github.com/james2doyle/lit-string-trim/archive/master.tar.gz \
		-o lit-string.tar.gz
	tar -xzvf "${PWD}/lit-string.tar.gz" -C "${PWD}/.hammerspoon/string-trim" --strip-components=1
	rm -rf lit-string.tar.gz

update-tmux-nord-theme:
	curl -sSL https://github.com/nordtheme/tmux/archive/develop.tar.gz \
		-o nord-tmux.tar.gz
	tar -xzvf "${PWD}/nord-tmux.tar.gz" -C "${PWD}/.config/tmux/themes/nord-tmux" --strip-components=1
	rm -rf nord-tmux.tar.gz

update-vim-plug:
	rm -rf "${PWD}/.vim/autoload/plug.vim"
	curl -fLo "${PWD}/.vim/autoload/plug.vim" --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

update-vim:
	vim +PlugUpdate +qall

update-homebrew-install-script:
	#rm -rf "${PWD}/scripts/macos-install-homebrew.sh"
	curl -sSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh \
		-o scripts/$(PREFIX_TEST)macos-install-homebrew.sh

update-pyenv-install-script:
	#rm -rf "${PWD}/scripts/linux-install-pyenv.sh"
	curl -sSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer \
		-o scripts/$(PREFIX_TEST)linux-install-pyenv.sh

update-starship-install-script:
	#rm -rf "${PWD}/scripts/common-install-starship.sh"
	curl -sSL https://starship.rs/install.sh \
		-o scripts/$(PREFIX_TEST)common-install-starship.sh

update-gvm-install-script:
	#rm -rf "${PWD}/scripts/common-install-gvm.sh"
	curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer \
		-o scripts/$(PREFIX_TEST)common-install-gvm.sh

update-xresources-nord-theme:
	curl -sSL https://github.com/nordtheme/xresources/archive/develop.tar.gz \
		-o nord-xresources.tar.gz
	tar -xzvf "${PWD}/nord-xresources.tar.gz" -C "${PWD}/.config/xresources/themes/nord-xresources" \
		--strip-components=1
	rm -rf nord-xresources.tar.gz

update-font-fontawesome:
	curl -sSL https://github.com/FortAwesome/Font-Awesome/archive/master.tar.gz \
		-o fontawesome.tar.gz
	mkdir fontawesome
	tar -xzvf "${PWD}/fontawesome.tar.gz" -C "${PWD}/fontawesome" --strip-components=1
	mv "${PWD}/fontawesome/otfs/"*.otf "${PWD}/.fonts/fontawesome"
	rm -rf fontawesome.tar.gz
	rm -rf fontawesome

update-font-noto:
	curl -sSL https://github.com/googlefonts/noto-emoji/archive/main.tar.gz \
		-o noto-emoji.tar.gz
	mkdir noto-emoji
	tar -xzvf "${PWD}/noto-emoji.tar.gz" -C "${PWD}/noto-emoji" --strip-components=1
	mv "${PWD}/noto-emoji/fonts/"*.ttf "${PWD}/.fonts/noto/"
	rm -rf noto-emoji.tar.gz
	rm -rf noto-emoji

################################################################################
# TEST

test: test-check-apt-packages test-check-homebrew-packages

test-check-apt-packages:
	docker build -t debs --build-arg IMAGE=debian:buster -f $(DOCKER_APT_IMAGE) .
	docker build -t debl --build-arg IMAGE=debian:bullseye -f $(DOCKER_APT_IMAGE) .
	docker build -t ubuf --build-arg IMAGE=ubuntu:focal -f $(DOCKER_APT_IMAGE) .
	docker build -t ubuj --build-arg IMAGE=ubuntu:jammy -f $(DOCKER_APT_IMAGE) .

test-check-homebrew-packages:
	python scripts/check_packages_homebrew.py .Brewfile

test-lint-lua:
	luacheck .

test-lint-shellscript:
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

test-lint-python:
	find . -name "*.py" -not -path "./.vim/*" | xargs pylint
	flake8
	isort .
	bandit -r . -v

test-diff-install-script:
	diff scripts/macos-install-homebrew.sh scripts/$(PREFIX_TEST)macos-install-homebrew.sh
	diff scripts/linux-install-pyenv.sh scripts/$(PREFIX_TEST)linux-install-pyenv.sh
	diff scripts/common-install-starship.sh scripts/$(PREFIX_TEST)common-install-starship.sh
	diff scripts/common-install-gvm.sh scripts/$(PREFIX_TEST)common-install-gvm.sh
