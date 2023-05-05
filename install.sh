#!/usr/bin/env bash

# -------------------- functions

# Either dir exhists, or we make it.
dir-exhists() {
	[[ -d "$1" ]] || /usr/bin/mkdir "$1"
}

# Copy with all options we want.
copy() {
	/usr/bin/cp --recursive --update --verbose 
}

red() { local RED="$(tput setaf 1)" ; echo -e "${RED}$1${NORMAL}"; } ;
green() { local GREEN="$(tput setaf 2)" ; echo -e "${GREEN}$1${NORMAL}"; } ;
yellow() { local YELLOW="$(tput setaf 3)" ; echo -e "${YELLOW}$1${NORMAL}"; } ;


# -------------------- make-needed-dirs

dir-exhists "$HOME/.config"

# -------------------- copy-files

shelldir="./shell"
destdir="$HOME/.config/shell"

if [[ -d $destdir ]] ; then





/usr/bin/cp --recursive --update --verbose ./shell "$HOME/.config/shell"

fi
unset shelldir destdir


