
# $HOME/.config/shell/zsh/.zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# dirs ----------------------------------------------------------------------

SHELLCONFD="$HOME/.config/shell/conf.d"
ZDOTDIR="$HOME/.config/shell/zsh"

[[ -d "$XDG_DATA_HOME/nodejs" ]] || /usr/bin/mkdir "$XDG_DATA_HOME/nodejs"
[[ -f "$NODE_REPL_HISTORY" ]] || /usr/bin/touch "$NODE_REPL_HISTORY"

# startup-view ----------------------------------------------------------------------

#/usr/bin/clear
$HOME/.local/bin/shell/colorscript --random
# /usr/bin/exa --all --color=auto --color-scale --icons --group-directories-first --classify --grid

# p10k prompt ----------------------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/shell/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load p10k prompt
if test -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# plugins ----------------------------------------------------------------------

# if [[ ! $(echo $SHELL | grep zsh) = "" ]] ; then

# Load zsh syntax highlighting. Requires zsh-syntax-highlighting package.
if test -f $ZDOTDIR/plugins/zsh-autocomplete.zsh ; then
	source $ZDOTDIR/plugins/zsh-autocomplete.zsh
fi

# Load zsh autosuggestions. Requires zsh-autosuggestions package.
if test -f $ZDOTDIR/plugins/zsh-autosuggestions.zsh ; then
	source $ZDOTDIR/plugins/zsh-autosuggestions.zsh
fi

# Load zsh syntax hightlighting. Requires zsh-syntax-highlighting package.
if test -f $ZDOTDIR/plugins/zsh-syntax-highlighting.zsh ; then
	source $ZDOTDIR/plugins/zsh-syntax-highlighting.zsh
fi

# fi

# history ----------------------------------------------------------------------

HISTSIZE=10000
SAVEHIST=10000

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt hist_fcntl_lock

setopt append_history
setopt extended_history
setopt share_history
setopt inc_append_history

# source ----------------------------------------------------------------------

# Load shared shell configs from $HOME/.config/shell/conf.d/*.sh
#if test -d $SHELLCONFD ; then
#	for conf in $SHELLCONFD/* ; do
#		test -r "$conf" && . "$conf"
#	done
#	unset conf
#fi

# aliases
[[ -f $SHELLCONFD/aliases ]] && source $SHELLCONFD/aliases ;

# command-not-found
if [[ -f $SHELLCONFD/command-not-found ]] ; then source $SHELLCONFD/command-not-found ; fi

# path
if [[ -f $SHELLCONFD/path ]] ; then source $SHELLCONFD/path ; fi

# ethrc
if [[ -d $SHELLCONFD/ethrc ]] ; then source $SHELLCONFD/ethrc ; fi

# functions
if [[ -d $SHELLCONFD/functions ]] ; then
	for file in $SHELLCONFD/functions/* ; do
		test -r "$file" &&  source "$file"
	done ;
fi

# nvm ----------------------------------------------------------------------

# Load nvm
if test -f /usr/share/nvm/init-nvm.sh ; then
	. /usr/share/nvm/init-nvm.sh
fi

# options ----------------------------------------------------------------------

setopt extended_glob
setopt no_case_glob

setopt nomatch
setopt notify
setopt prompt_subst
setopt complete_in_word
setopt menu_complete

setopt autocd
setopt auto_pushd
setopt pushd_silent
setopt pushd_to_home
setopt pushd_minus
setopt pushd_ignore_dups

setopt no_flow_control
setopt interactivecomments

setopt NO_BEEP NO_HIST_BEEP
unsetopt beep

setopt SH_WORD_SPLIT

# eval ----------------------------------------------------------------------

# Set starship
#builtin eval "$(starship init zsh)"

# Set direnv
builtin eval "$(direnv hook zsh)"

#  ----------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.config/shell/zsh/.p10k.zsh.
[[ ! -f ~/.config/shell/zsh/.p10k.zsh ]] || source ~/.config/shell/zsh/.p10k.zsh
