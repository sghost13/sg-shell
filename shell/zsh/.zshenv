
# $HOME/.config/shell/zsh/.zshenv

# Use this file for all zsh env

## ----------------- shared-environment

# Source shared env vars
sharedenv="$HOME/.config/shell/shared/envrc"
if test -f "$sharedenv" ; then
	if test -r "$sharedenv" ; then
		source "$sharedenv"
	fi
fi
unset sharedenv
#source "$HOME/.config/shell/shared/envrc"

## ----------------- zsh-env

# ZSH specific env vars.

# Need to make the directory $XDG_STATE_HOME/zsh manually.

#skip_global_compinit=1
export HISTSIZE=10000
export SAVEHIST=10000

# The foloowing are set in /etc/zsh/zshenv
#export HISTFILE="$XDG_STATE_HOME/zsh/history"
#export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}""

## ----------------- 
