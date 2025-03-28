# shellcheck shell=bash disable=2154
# shell-check doesn't support zsh, fake it with bash

# Either dir exists, or create that directory.
# Usage: makedir dirname
function makedir() {
    [[ -d "${1}" ]] || mkdir -p "${1}"
}

# Either file exists, or create that file (and parent directories).
# Usage: makefile filename
function makefile() {
    if [[ ! -f "${1}" ]]; then
        # Create parent directory if it doesn't exist
        dirname=$(dirname "${1}")
        [[ -d "${dirname}" ]] || mkdir -p "${dirname}"
        touch "${1}"
    fi
}

# Test file exists and can be read, then source it. Else echo where it fails.
# Usage: sauce filename
function sauce() {
    if [[ -f "${1}" && -r "${1}" ]]; then
        # shellcheck disable=SC1090
        source "${1}"
    else
        echo "File doesn't exist, or cannot be read: ${1}" >&2
    fi
}

# Source all files in a directory if it exists. Else echo where it fails.
# Usage: sauced dirname
function sauced() {
    if [[ -d "${1}" ]]; then
        local file
        for file in "${1}"/*; do
            # Skip if not a regular file
            [[ -f "${file}" ]] && sauce "${file}"
        done
    else
        echo "Directory doesn't exist: ${1}" >&2
    fi
}

# Source shell stuff
sauce "${HOME}/.config/shell/env.sh"
sauce "${XDG_CONFIG_HOME}/shell/path.sh"
sauce "${XDG_CONFIG_HOME}/shell/alias.sh"
sauced "${XDG_CONFIG_HOME}/shell/functions.d"

# Source extra completions
fpath+=("${XDG_CONFIG_HOME}/shell/completions")

# Zsh Variables
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export ZSH_SESSION_DIR="${XDG_STATE_HOME}/zsh/zsh_sessions"

# Create necessary directories and files
makedir "${XDG_CACHE_HOME}/zsh"
makedir "${XDG_STATE_HOME}/zsh"
makefile "${XDG_STATE_HOME}/zsh/history"
makedir "${XDG_STATE_HOME}/zsh/zsh_sessions"
makedir "${XDG_DATA_HOME}/nodejs"
makefile "${NODE_REPL_HISTORY}"

# Check if SSH agent is already running
if [[ -z "${SSH_AGENT_PID}" ]] || ! kill -0 "${SSH_AGENT_PID}" 2>/dev/null; then
    eval "$(ssh-agent -s >/dev/null)"
fi

# Initialize brew, starship, direnv, and zoxide if they are installed
[[ -x "$(command -v brew)" ]] && builtin eval "$(brew shellenv)"
[[ -x "$(command -v starship)" ]] && builtin eval "$(starship init zsh)"
[[ -x "$(command -v direnv)" ]] && builtin eval "$(direnv hook zsh)"
# [[ -x "$(command -v zoxide)" ]] && builtin eval "$(zoxide init zsh)"

# Set the window title
function set_win_title() {
    echo -ne "\033]0;${TERM} ${USER}@${HOST} : ${PWD}\007"
}
precmd_functions+=(set_win_title)

# Optimize history search and autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC="1"

# Source zsh plugins
sauce "/usr/local/share/zsh-autopair/autopair.zsh"
sauce "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
sauce "/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
sauce "/usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# Always load syntax highlighting last
sauce "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on

## ----------------- shell-options

# History settings
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't enter duplicates into history
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates if a new command is a duplicate
setopt HIST_FIND_NO_DUPS      # Don't display duplicates when searching
setopt HIST_SAVE_NO_DUPS      # Delete older duplicates from history
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks when adding to history
setopt HIST_VERIFY            # Don't execute, expand and reload into the editing buffer instead
setopt APPEND_HISTORY         # Immediately append history instead of overwriting
setopt EXTENDED_HISTORY       # Save commands' timestamps and durations to the history file
setopt INC_APPEND_HISTORY     # Incrementally add to history

# Globbing settings
setopt NULL_GLOB         # Remove pattern rather than error from no match from glob
setopt EXTENDED_GLOB     # Extended globbing, allows using regular expressions with *
setopt NO_CASE_GLOB      # Case insensitive globbing
setopt BAD_PATTERN       # Print error on badly formed glob
setopt NUMERIC_GLOB_SORT # Sort filenames numerically in globs when it makes sense

# Directory settings
setopt AUTOCD     # If only directory path is entered, cd there
setopt AUTO_PUSHD # Make cd push the old directory onto the directory stack

# Disable beeps
setopt NO_BEEP NO_HIST_BEEP       # No beeps here
unsetopt BEEP LIST_BEEP HIST_BEEP # Get outta here, ya stinking beeps

# Aliases and corrections
setopt ALIASES          # Expand aliases
setopt COMPLETE_ALIASES # Alias becomes distinct command for completion purposes
setopt CORRECT          # Auto correct mistakes

#colorscript

unset -f sauce sauced makedir makefile
