
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    exec startx
fi

# Load the shell dotfiles
for file in ~/.{aliases,gvm/scripts/gvm,exports,exports.local,functions}; do
    if [[ -r "$file" && -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "${file}"
    fi
done;
unset file;

# without override, change to apppend
shopt -s histappend

if [[ -d "${PYENV_ROOT}" ]]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

eval "$(starship init bash)"
