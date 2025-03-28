# shellcheck shell=bash disable=2154
# shell-check doesn't support zsh, fake it with bash

# Global alias. Catches help flags and colors output with bat
# bat started throwing weird error with this, while still working. temporary lazy fix redirect errors to null
alias -g -- -h='-h 2>&1 | bat --paging=never --language=help --style=plain 2>/dev/null'
alias -g -- --help='--help 2>&1 | bat --paging=never --language=help --style=plain 2>/dev/null'

alias term='open -n -a iTerm'

# Replace cat with bat. On debian its called batcat
if command -v batcat >/dev/null; then
  alias cat="batcat --color=always --decorations=never --paging=never"
  alias bat="batcat --color=always --decorations=never --paging=never"
elif command -v bat >/dev/null; then
  alias cat="bat --color=always --decorations=never --paging=never"
  alias bat="bat --color=always --decorations=never --paging=never"
fi

# exa
# Base, all files, all dirs.
alias ls='eza "${EZA_OPTS[@]}" --grid'
# Long format.
alias ll='eza "${EZA_OPTS[@]}" --git --long'
# Tree listing.
alias lt='eza "${EZA_OPTS[@]}" --tree'

# cd
alias cl='command clear && eza "${EZA_OPTS[@]}" --grid'
alias ..='builtin cd .. && clear && eza "${EZA_OPTS[@]}" --grid'

# git
alias gs='git status'
alias ga='git add'

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

#fonts
alias update-fc="sudo fc-cache -fv"

alias userlist="cut -d: -f1 /etc/passwd | sort"

alias print-path='echo $PATH | tr ":" "\n"'
# shellcheck disable=SC2154
alias print-fpath='for fp in $fpath; do echo $fp; done; unset fp;'
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

# shellcheck disable=SC2139
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"

alias fonts='fc-cache -f -v'

# shell ----------------------------------------------------------------------

alias zsh="exec zsh"

# ip ----------------------------------------------------------------------

alias ip="ip -c"

# cargo ----------------------------------------------------------------------

alias cargo="cargo --color=auto"

# lynx ----------------------------------------------------------------------

alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'

# journalctl ----------------------------------------------------------------------

alias jctl='journalctl -p 3 -xb'

# systemd ----------------------------------------------------------------------

alias analyze='sudo systemd-analyze'
alias security='sudo systemd-analyze security'
# systemd-cgls - similar to ps i think #
alias sd-cgls='systemd-cgls'

# ps ----------------------------------------------------------------------

alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"
# This ps and systemd-cgls - useful to list all processes and
# the systemd units they belong to.
# ps - add pid,user,cgroup,args to the end #
alias psps='ps xawf -eo '

# NetworkManager ----------------------------------------------------------------------

alias netman="NetworkManager"
alias nmcli="nmcli --color=auto --pretty"
alias jctrl-netman-wifi="journalctl -xe NM_DEVICE=wlp3s0"

# rofi ----------------------------------------------------------------------

alias rofi="rofi -show run"
alias rofiw="rofi -show window"
alias rofiss="rofi -show ssh"

# ssh ----------------------------------------------------------------------

# ssh
alias sshdt="sshd -t"

# ssh-keygen
alias sk-sg='ssh-keygen -t ed25519 -C'

# ssh-audit
#alias ssh-audit="ssh-audit --ssh2 --ipv4"

# gpg ----------------------------------------------------------------------

# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# reflector ----------------------------------------------------------------------

alias reflector='sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --latest 40 --ipv4 --sort rate --country US,CA --completion-percent 100 --score 40 --fastest 20 --delay 2 --age 1 --verbose --connection-timeout 5 --download-timeout 5 --cache-timeout 300 --url https://archlinux.org/mirrors/status/json/'

#alias reflector='sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --latest 40 --ipv4 --sort rate --country US,CA --completion-percent 100 --score 40 --fastest 20 --delay 2 --age 1 --verbose --connection-timeout 5 --download-timeout 5 --cache-timeout 300 --url https://archlinux.org/mirrors/status/json/'
#alias reflect='sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --latest 40 --ipv4 --sort rate --country US,CA --completion-percent 100 --score 40 --fastest 20 --delay 2 --age 1 --verbose --connection-timeout 5 --download-timeout 5 --cache-timeout 300 --url https://archlinux.org/mirrors/status/json/'

#update-initramfs -u -k all

# compression ----------------------------------------------------------------------

# # Bzip2
# alias bzip='bzip2 --best --verbose -9' #decomp
# alias bunzip2='bunzip2 --verbose -9'   #decomp
# alias bzcat='bzcat --verbose -9'       #decomp to stdout

# # lrzip
# alias lrzip='lrzip --hash --bzip2 --threads=6 --maxram=10000 -vv'
# alias lrzipcomp='lrzip --hash --bzip2 --threads=6 --maxram=10000 -vv'
# alias lrzipdecomp='lrzip --hash --threads=6 --maxram=10000 --decompress --check -vv'

# #alias lrzipencrypt=""
# #alias lrzipdecrypt=""

# #alias lrzipencryptcomp=""
# #alias lrzipdecryptcomp=""

# # lzop
# alias lzop='lzop -8 --color --verbose'
# alias lzopcomp='lzop -8 --color --verbose'
# alias lzopdecomp='lzop -8 --color --verbose --decompress'

# # lz4
# alias lz4='lz4 -7 --favor-decSpeed --verbose'
# alias lz4comp='lz4 --compress -7 --favor-devSpeed --verbose --rm'
# alias lz4decomp='lz4 --decompress --verbose --rm'

# # lzip
# alias lzip='lzip -9 --verbose'
# alias lz4comp='lzip -9 --verbose'
# alias lz4decomp='lzip -9 --decompress --verbose'

# # Zstd
# alias zstd='zstd --threads=8 --content-size -M10240 --verbose -9 --exclude-compressed'
# alias zstdcomp='zstd --compress --rsyncable --content-size -M10240 --verbose -9 --rm --exclude-compressed'
# alias zstddecomp='zstd --decompress -M10240 --verbose -9 --rm'

# # PIXZ (parallel indexed xz)
# alias pixz='pixz'

# # XZ
# alias xz='xz -9 --threads=0 --verbose --verbose'
# alias xzcomp='xz --compress --threads=0 --memlimit-compress=75% --verbose --verbose'
# alias xzdecomp='xz --decompress --threads=0 --memlimit-decompress=75% --verbose --verbose'

# # pigz
# alias gzip='pigz -9 --verbose --verbose'
# alias pigcomp='pigz --best --independent --processes 8 --list --oneblock --test --verbose --verbose'
# alias pigdecomp='pigz --decompress --processes 8 --verbose --verbose'

#  ----------------------------------------------------------------------
