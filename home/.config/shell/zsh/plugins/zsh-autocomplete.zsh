#!/usr/bin/env zsh

# Config in this section should come BEFORE sourcing Autocomplete and cannot be
# changed at runtime.
zstyle ':autocomplete:recent-dirs' backend cdr

#zstyle ':autocomplete:*' widget-style complete-word
#zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' widget-style menu-select

# Load zsh autocomplete. Requires zsh-autocomplete package.
if test -f /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ; then
	source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

zstyle ':autocomplete:*' default-context ''
zstyle ':autocomplete:*' min-delay 0.05
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' ignored-input ''
zstyle ':autocomplete:*' list-lines 16
zstyle ':autocomplete:history-search:*' list-lines 16
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16
zstyle ':autocomplete:*' insert-unambiguous no
zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands
