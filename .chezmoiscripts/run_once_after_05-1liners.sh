#!/usr/bin/env bash

{{ range .chezmoidata.packages.1liners }}
  {{ if .folder }}[ -d "{{ .chezmoi.homeDir }}/{{ .folder }}" ] || {{ end }}{{ .cmd }}
{{ end }}
