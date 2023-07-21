# dotfiles

Project that aims to make the configuration of *NIX environments easy and replicable.

Always installing minimal software and checking external installers.

## Supported systems

* **macOS** >= 10.15
* **Debian** >= 11
* **Arch**
* **Fedora** > 36

## Packages (Linux)

* **wm**: i3
* **desktop manager**: null
* **terminal**: [alacritty](https://github.com/alacritty/alacritty) / rxvt-unicode
* **bar**: [i3status-rust](https://github.com/greshake/i3status-rust/) / [bin/horizonte.py](bin/horizonte.py)
* **editor**: vim
* **font**: [fira code](https://github.com/tonsky/FiraCode) / [fontawesome](https://github.com/FortAwesome/Font-Awesome) / [noto emoji color](https://github.com/googlefonts/noto-emoji)
* **shell**: bash
* **shell prompt**: [starship](https://starship.rs)
* **notification**: dunst
* **screenlocker**: i3lock
* **text-expander**: [espanso](https://espanso.org/)
* **multiplexer**: [tmux](https://github.com/tmux/tmux)

## Requirements

### macOS

```
$ sudo xcodebuild -license accept
$ git clone https://github.com/droposhado/dotfiles.git "$HOME/.dotfiles"
$ cd "$HOME/.dotfiles" || exit 1
$ make install
$ make install-vim
```

### Debian (minimal)

```
# apt-get update
# apt-get install --no-install-recommends ca-certificates curl \
                  lsb-release sudo build-essential git gnupg
# usermod -aG sudo <your-user>
```

Logout and login again (for sudo effect), now:

```
$ git clone https://github.com/droposhado/dotfiles.git "$HOME/.dotfiles"
$ cd "$HOME/.dotfiles" || exit 1
$ make install
$ make install-vim
```

### Arch

Download ISO from site, use live install with command:

```
# archinstall --config https://droposhado.org/archinstall
```

Configure disk and users with wizard, finsh install, reboot with:

**Remove install media**

```
# shutdown -r now
```

Clone project from Github and install

```
$ git clone https://github.com/droposhado/dotfiles.git "$HOME/.dotfiles"
$ cd "$HOME/.dotfiles" || exit 1
$ make install
$ make install-vim
```

### Fedora (netinst)

The `wheel` group is to use `sudo` command.

```
# dnf install --setopt=install_weak_deps=False ca-certificates curl \
              redhat-lsb sudo automake gcc gcc-c++ make git gnupg
# adduser -G wheel <new-user>
# passwd <new-user>
$ git clone https://github.com/droposhado/dotfiles.git "$HOME/.dotfiles"
$ cd "$HOME/.dotfiles" || exit 1
$ make install
$ make install-vim
```

## Scripts folder

Inside the scripts folder there are shell script files for configuring or updating the configurations/packages packages in this project.

 - **arch-\***: prefix represents files for Arch
 - **check-\***: contains check scripts for validating homebrew and apt packages;
 - **common-\***: common scripts between Linux and macOS;
 - **common-install-\***: official installation scripts for Linux and macOS;
 - **debian-\***: prefix represents files for Debian, not necessarily compatible with Debian like distributions;
 - **fedora-\***: prefix represents files for Fedora, not necessarily compatible with RHEL/CentOS like distributions;
 - **linux-\***: prefix represents files for Linux;
 - **linux-install-\***: official installation scripts for Linux;
 - **macos-\***: prefix represents files for macOS;
 - **macos-install-\***: official installation scripts for macOS;
 - **macos-config-\***: configure macOS or applications.

## Linters file

This repository store scripts for many languages, the files below show which language and which project it configures. Remembering that they are not necessary for dotfiles, they are only to help with script tests:

- **.bandit**: for Python to use with [bandit](https://github.com/PyCQA/bandit);
- **.flake8**: for Python to use with [flake8](https://flake8.pycqa.org/en/latest/);
- **.isort.cfg**: for Python to use with [isort](https://pycqa.github.io/isort/);
- **.luacheckrc**: for Lua to use with [luacheck](https://github.com/mpeterv/luacheck);
- **.pylintrc**: for Python to use with [pylint](https://github.com/PyCQA/pylint).

## Inspired by

- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [jessfraz/dotfiles](https://github.com/jessfraz/dotfiles)
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

## References

- [Signing Git Commits and Tags with GPG](https://jigarius.com/blog/signing-git-commits)
- [Sign git commits on GitHub with GPG in macOS](https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/)
- [fontawesome with i3status](https://gist.github.com/hbpasti/39f2dd2d4dbd8fe04cbf)
- [i3 - The Improved Tiling Window Manager](https://sachinkumarsingh092.github.io/blog/i3-wm)
- [bash - What do the brackets in if-statements do? [duplicate]](https://unix.stackexchange.com/a/482007)
- [How can I check if a program exists from a Bash script?](https://stackoverflow.com/a/677212)
- [Git Hooks (Part I) - The Basics](https://www.omerkatz.com/blog/2013/2/15/git-hooks-part-1-the-basics)
- [git-init - TEMPLATE DIRECTORY](https://git-scm.com/docs/git-init#_template_directory)
- [tep/git-templates](https://github.com/tep/git-templates)
- [git/git/templates](https://github.com/git/git/tree/master/templates)
- [Which kind of dependencies (suggested, recommended…) does DNF install?](https://docs.fedoraproject.org/en-US/packaging-guidelines/WeakDependencies/)

## License

For this project see [LICENSE](LICENSE).

For external resources like fonts, scripts and other, see their respective licenses:

- [.fonts/fontawesome](.fonts/fontawesome) - [LICENSE](https://github.com/FortAwesome/Font-Awesome/blob/master/LICENSE.txt)
- [.fonts/noto](.fonts/noto) - [LICENSE](https://github.com/googlefonts/noto-emoji/blob/main/LICENSE)
- [scripts/common-install-starship.sh](scripts/common-install-starship.sh) - [LICENSE](https://github.com/starship/starship/blob/master/LICENSE) (script in [install/install.sh](https://github.com/starship/starship/blob/master/install/install.sh))
- [scripts/macos-install-homebrew.sh](scripts/macos-install-homebrew.sh) - [LICENSE](https://github.com/Homebrew/install/blob/master/LICENSE.txt)
- [scripts/linux-install-pyenv.sh](scripts/linux-install-pyenv.sh) - [LICENSE](https://github.com/pyenv/pyenv-installer/blob/master/LICENSE)
- [.hammerspoon/lit-slugify](.hammerspoon/lit-slugify) - [LICENSE](.hammerspoon/lit-slugify/LICENSE)
- [.hammerspoon/string-trim](.hammerspoon/string-trim) - [LICENSE](.hammerspoon/string-trim/LICENSE)
- [.vim/autoload/plug.vim](.vim/autoload/plug.vim) - [LICENSE](https://github.com/junegunn/vim-plug/blob/master/LICENSE)
- [.config/alacritty/themes/nord.yml](.config/alacritty/themes/nord.yml) - [LICENSE](https://github.com/nordtheme/alacritty/blob/develop/LICENSE.md)
- [.config/tmux/themes/nord-tmux](.config/tmux/themes/nord-tmux) - [LICENSE](.config/tmux/themes/nord-tmux/LICENSE.md)
- [.config/xresources/themes/nord-xresources](.config/xresources/themes/nord-xresources) - [LICENSE](.config/xresources/themes/nord-xresources/LICENSE.md)
