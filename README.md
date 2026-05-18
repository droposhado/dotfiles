# dotfiles

Project that aims to make the configuration of *NIX environments easy and replicable.

Always installing minimal software and checking external installers.

## Supported systems

* **macOS** >= 10.15
* **Debian** >= 13

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
* **multiplexer**: [tmux](https://github.com/tmux/tmux)

## Requirements

### macOS

```
$ sudo xcodebuild -license accept
$ sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply <github-user>
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
$ sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply <github-user>
```

## Linters file

This repository store scripts for many languages, the files below show which language and which project it configures. Remembering that they are not necessary for dotfiles, they are only to help with script tests:

- **.bandit**: for Python to use with [bandit](https://github.com/PyCQA/bandit);
- **.flake8**: for Python to use with [flake8](https://flake8.pycqa.org/en/latest/);
- **.isort.cfg**: for Python to use with [isort](https://pycqa.github.io/isort/);
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

- [.dockerfunctions](.dockerfunctions) - [LICENSE](https://github.com/jessfraz/dotfiles/blob/master/LICENSE)
- [.fonts/fontawesome](.fonts/fontawesome) - [LICENSE](https://github.com/FortAwesome/Font-Awesome/blob/master/LICENSE.txt)
- [.fonts/noto](.fonts/noto) - [LICENSE](https://github.com/googlefonts/noto-emoji/blob/main/LICENSE)
- [.vim/autoload/plug.vim](.vim/autoload/plug.vim) - [LICENSE](https://github.com/junegunn/vim-plug/blob/master/LICENSE)
- [.config/alacritty/themes/nord.yml](.config/alacritty/themes/nord.yml) - [LICENSE](https://github.com/nordtheme/alacritty/blob/develop/LICENSE.md)
- [.config/rofi/themes/nord.rasi](.config/rofi/themes/nord.rasi) - [LICENSE](https://github.com/amayer5125/nord-rofi/blob/master/LICENSE)
- [.config/tmux/themes/nord-tmux](.config/tmux/themes/nord-tmux) - [LICENSE](.config/tmux/themes/nord-tmux/LICENSE.md)
- [.config/xresources/themes/nord-xresources](.config/xresources/themes/nord-xresources) - [LICENSE](.config/xresources/themes/nord-xresources/LICENSE.md)
- [.config/zathura/base16-nord.config](.config/zathura/base16-nord.config) - [LICENSE](https://github.com/HaoZeke/base16-zathura/blob/main/LICENSE.md) (script in [build_schemes/recolors/base16-nord.config](https://github.com/HaoZeke/base16-zathura/blob/main/build_schemes/recolors/base16-nord.config))
