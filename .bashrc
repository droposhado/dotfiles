
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    exec startx
fi

# Load the shell dotfiles
for file in ~/.{aliases,gvm/scripts/gvm,exports,exports.local,functions,dockerfunctions}; do
    if [[ -r "$file" && -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "${file}"
    fi
done;
unset file;

# # 'have' keyword for bash completion
# # https://stackoverflow.com/a/12874971
# #
# # all variables set in .exports
# _have()
# {
#     # Completions for system administrator commands are installed as well in
#     # case completion is attempted via `sudo command ...'.
#     type $1 &>/dev/null
# }

# # Load the shell completions
# for file in $(ls /usr/share/bash-completion/completions/*)
# do
#    source "${file}"
# done
# unset file;

# without override, change to apppend
shopt -s histappend

if [[ -d "${PYENV_ROOT}" ]]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

eval "$(starship init bash)"

if [[ -f "${HOME}/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

if [[ -f "${HOME}/.deno/env" ]]; then
    . "$HOME/.deno/env"
fi
