
# $HOME/.config/shell/zsh/zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

SHARED="$HOME/.config/shell/shared"
ZDOTDIR="$HOME/.config/shell/zsh"

## ----------------- prompt

eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; $TERM $USER@$HOST:${PWD/$HOME/~} \007"
}
precmd_functions+=(set_win_title)

## ----------------- source-files

# Source needed files.
# Zsh sources zshenv by default in $ZDOTDIR

# source shared rc file. chicken/egg!
sharedrc="$SHARED/sharedrc"
if test -f "$sharedrc" ; then
	if test -r "$sharedrc" ; then
		source "$sharedrc"
	else
		echo "Couldn't read from file: $sharedrc"
	fi
else
	echo "File doesn't exhist: $sharedrc"
fi
unset sharedrc

# Zsh env. Zsh does this by default.

# Source setopt zsh options file.
sauce "$ZDOTDIR/setopt.zsh"

## ----------------- zsh-dirs/files
#!TODO CHANGE XDG_CACHE,STATE,DATA dirs to 600(user rw only)
# dirs and files that need to be manually made.

makedir "$XDG_CACHE_HOME/zsh"
makedir "$XDG_STATE_HOME/zsh"
makefile "$XDG_STATE_HOME/zsh/history"

## ----------------- plugins

# Completion.
autoload -Uz compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# set comp/cache paths
#compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION            # zcompdump file location
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache  # zcompcache file location
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'         # Case insensitive tab completion
zstyle ':completion:*' rehash true                                # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"           # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on


# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# Load zsh auto completions. Requires zsh-autocomplete package.
sauce /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Load zsh autosuggestions. Requires zsh-autosuggestions package.
sauce /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use fzf
sauce /usr/share/fzf/key-bindings.zsh
sauce /usr/share/fzf/completion.zsh

# Load zsh syntax hightlighting. Requires zsh-syntax-highlighting package.
# sauce /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh fast syntax hightlighting. Requires zsh-fast-syntax-highlighting package.
sauce /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Use history substring search. Requires zsh-history-substring-search package.
sauce /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

## ----------------- eval

if [[ -f /usr/bin/mcfly ]] ; then
# Load Mcfly
export MCFLY_FUZZY=true
export MCFLY_RESULTS=20
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN
eval "$(mcfly init zsh)"
fi

# Set starship prompt
builtin eval "$(starship init zsh)"

# Set direnv
builtin eval "$(direnv hook zsh)"

## -----------------
unset -f sauce sauced makedir makefile
