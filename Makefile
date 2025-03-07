
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

dot: install-dotbins install-dotfiles install-dotfolders

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

setup-Linux: setup-$(DISTRO) install-pyenv install-starship install-gvm install-bun install-rustup
	xdg-mime default org.pwmt.zathura.desktop application/pdf

setup-Debian:
	sudo -E bash "$(PWD)/scripts/debian-config-locales.sh"
	sudo -E bash "$(PWD)/scripts/debian-config-sourceslist.sh"
	sudo bash "$(PWD)/scripts/debian-install-packages.sh"
	sudo bash "$(PWD)/scripts/debian-install-docker.sh"

	sudo systemctl enable systemd-resolved

	# Needs packages installed
	#systemctl --user enable vdirsyncer.timer
	#systemctl --user start vdirsyncer.timer
	#systemctl --user enable offlineimap-oneshot.timer
	#systemctl --user start offlineimap-oneshot.timer
	#systemctl --user enable syncthing.service
	#systemctl --user start syncthing.service
	systemctl --user daemon-reload

	sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

################################################################################
# INSTALL

install-bun:
	if test ! -d "$(HOME)/.bun"; then \
		bash "$(PWD)/scripts/common-install-bun.sh"; \
	fi

install-dotbins:
	# instalation on /usr/local/bin prevines changes on commands
	sudo cp $(PWD)/bin/horizonte.py /usr/local/bin/horizonte
	sudo cp $(PWD)/bin/lock /usr/local/bin/lock
	sudo cp $(PWD)/bin/logout /usr/local/bin/logout
	sudo cp $(PWD)/bin/ndate.py /usr/local/bin/ndate
	sudo cp $(PWD)/bin/ngit /usr/local/bin/ngit
	sudo cp $(PWD)/bin/nw /usr/local/bin/nw
	sudo cp $(PWD)/bin/play-pause.sh /usr/local/bin/play-pause
	sudo cp $(PWD)/bin/rename.py /usr/local/bin/rename
	sudo cp $(PWD)/bin/week /usr/local/bin/week

install-dotfiles:
	if test ! -d $(HOME)/.config; then mkdir $(HOME)/.config; fi
	ln -sfn "${PWD}/.aliases" "${HOME}/.aliases"
	ln -sfn "${PWD}/.bash_profile" "${HOME}/.bash_profile"
	ln -sfn "${PWD}/.bash_prompt" "${HOME}/.bash_prompt"
	ln -sfn "${PWD}/.bashrc" "${HOME}/.bashrc"
	ln -sfn "${PWD}/.dockerfunctions" "${HOME}/.dockerfunctions"
	ln -sfn "${PWD}/.exports" "${HOME}/.exports"
	ln -sfn "${PWD}/.functions" "${HOME}/.functions"
	ln -sfn "${PWD}/.gitconfig" "${HOME}/.gitconfig"
	ln -sfn "${PWD}/.inputrc" "${HOME}/.inputrc"
	ln -sfn "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
	ln -sfn "${PWD}/.vimrc" "${HOME}/.vimrc"
	ln -sfn "${PWD}/.xinitrc" "${HOME}/.xinitrc"
	ln -sfn "${PWD}/.Xresources" "${HOME}/.Xresources"
	ln -sfn "${PWD}/.config/starship.toml" "${HOME}/.config/starship.toml"

install-dotfolders:
	if test ! -d $(HOME)/.config; then mkdir $(HOME)/.config; fi
	if test ! -d $(HOME)/.config/alacritty; then rm -rf $(HOME)/.config/alacritty; fi
	if test ! -d $(HOME)/.config/dunst; then rm -rf $(HOME)/.config/dunst; fi
	if test ! -d $(HOME)/.config/git; then rm -rf $(HOME)/.config/git; fi
	if test ! -d $(HOME)/.config/i3; then rm -rf $(HOME)/.config/i3; fi
	if test ! -d $(HOME)/.config/i3status-rust; then rm -rf $(HOME)/.config/i3status-rust; fi
	if test ! -d $(HOME)/.config/mpv; then rm -rf $(HOME)/.config/mpv; fi
	if test ! -d $(HOME)/.config/mutt; then rm -rf $(HOME)/.config/mutt; fi
	if test ! -d $(HOME)/.config/offlineimap; then rm -rf $(HOME)/.config/offlineimap; fi
	if test ! -d $(HOME)/.config/tmux; then rm -rf $(HOME)/.config/tmux; fi
	if test ! -d $(HOME)/.config/tui-jornal; then rm -rf $(HOME)/.config/tui-jornal; fi
	if test ! -d $(HOME)/.config/xresources; then rm -rf $(HOME)/.config/xresources; fi
	if test ! -d $(HOME)/.config/vdirsyncer; then rm -rf $(HOME)/.config/vdirsyncer; fi
	if test ! -d $(HOME)/.imapfilter; then rm -rf $(HOME)/.imapfilter; fi
	if test ! -d $(HOME)/.vim; then rm -rf $(HOME)/.vim; fi
	ln -sfn "${PWD}/.config/alacritty" "${HOME}/.config/alacritty"
	ln -sfn "${PWD}/.config/dunst" "${HOME}/.config/dunst"
	ln -sfn "${PWD}/.config/git" "${HOME}/.config/git"
	ln -sfn "${PWD}/.config/i3" "${HOME}/.config/i3"
	ln -sfn "${PWD}/.config/i3status-rust" "${HOME}/.config/i3status-rust"
	ln -sfn "${PWD}/.config/mpv" "${HOME}/.config/mpv"
	ln -sfn "${PWD}/.config/mutt" "${HOME}/.config/mutt"
	ln -sfn "${PWD}/.config/offlineimap" "${HOME}/.config/offlineimap"
	ln -sfn "${PWD}/.config/tmux" "${HOME}/.config/tmux"
	ln -sfn "${PWD}/.config/tui-journal" "${HOME}/.config/tui-journal"
	ln -sfn "${PWD}/.config/xresources" "${HOME}/.config/xresources"
	ln -sfn "${PWD}/.config/vdirsyncer" "${HOME}/.config/vdirsyncer"
	ln -sfn "${PWD}/.imapfilter" "${HOME}/.imapfilter"
	ln -sfn "${PWD}/.vim" "${HOME}/.vim"
	cp "${PWD}/.config/mutt/muttrc.local.example" "${HOME}/.config/mutt/muttrc.local"

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

install-rustup:
	if test ! -d "$(HOME)/.rustup"; then \
		bash "$(PWD)/scripts/common-install-rustup.sh"; \
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
	update-gvm-install-script \
	update-bun-install-script \
	update-rustup-install-script

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

update-bun-install-script:
	#rm -rf "${PWD}/scripts/common-install-bun.sh"
	curl -sSL https://bun.sh/install \
		-o scripts/$(PREFIX_TEST)common-install-bun.sh

update-homebrew-install-script:
	#rm -rf "${PWD}/scripts/macos-install-homebrew.sh"
	curl -sSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh \
		-o scripts/$(PREFIX_TEST)macos-install-homebrew.sh

update-pyenv-install-script:
	#rm -rf "${PWD}/scripts/linux-install-pyenv.sh"
	curl -sSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer \
		-o scripts/$(PREFIX_TEST)linux-install-pyenv.sh

update-rustup-install-script:
	#rm -rf "${PWD}/scripts/common-install-rustup.sh"
	curl -sSL https://sh.rustup.rs \
		-o scripts/$(PREFIX_TEST)common-install-rustup.sh

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
	diff scripts/common-install-bun.sh scripts/$(PREFIX_TEST)common-install-bun.sh
	diff scripts/common-install-rustup.sh scripts/$(PREFIX_TEST)common-install-rustup.sh
	diff scripts/common-install-starship.sh scripts/$(PREFIX_TEST)common-install-starship.sh
	diff scripts/common-install-gvm.sh scripts/$(PREFIX_TEST)common-install-gvm.sh
