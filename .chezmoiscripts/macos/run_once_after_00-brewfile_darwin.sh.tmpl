#!/usr/bin/env bash

chsh -s /bin/bash

brew doctor
brew update
brew bundle --verbose --file=/dev/stdin <<EOF

{{ range .chezmoidata.packages.brew.taps }}
tap {{ . }} \
{{ end }}

cask_args appdir: "{{ .chezmoidata.packages.brew.appdir }}", require_sha: {{ .chezmoidata.packages.brew.require_sha }}

{{ range .chezmoidata.packages.brew.packages }}
brew {{ . }} \
{{ end }}

{{ range .chezmoidata.packages.brew.casks }}
cask {{ . }} \
{{ end }}
EOF

brew cleanup
