
# Loads the settings in interactive mode.
# Non-interactive modes are subshells and/or child shell, something like
# $(cmd) or bash <file.sh>
if [[ -n "$PS1" ]]; then
    # shellcheck source=/dev/null
    source "${HOME}/.bashrc"
fi

