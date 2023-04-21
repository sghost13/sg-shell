#!/usr/bin/env bash

## ----------------- bash history

if [[ ! $(echo "$SHELL" | grep bash) = "" ]] ; then

export HISTSIZE=20000
export HISTFILESIZE=${HISTSIZE}
export HISTFILE=$HOME/.config/shell/bash/bash_history
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTIGNORE="ls:exa:cl:cd:top:ps:exit:date"
export HISTTIMEFORMAT="%F %T  "
export HISTCONTROL=erasedups:ignoredups:ignorespace

fi

## -----------------  -----------------  -----------------  -----------------  -----------------
