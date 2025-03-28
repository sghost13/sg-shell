# shellcheck shell=bash disable=2154
# shell-check doesn't support zsh, fake it with bash

# Default programs
export LANGUAGE="en_US"
export BROWSER="firefox"
export EDITOR="micro"
export VISUAL="code"
export MANPAGER="sh -c 'col -bx | bat --plain --paging=never --decorations=never --color=always --language=man'"

# XDG dirs
if [[ "$(uname)" == "Darwin" ]]; then
  export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/Library/Caches}"
  export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
  export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
  export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
  export XDG_BIN_HOME="${XDG_BIN_HOME:-${HOME}/.local/bin}"
else
  export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
  export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
  export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
  export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
  export XDG_BIN_HOME="${XDG_BIN_HOME:-${HOME}/.local/bin}"
fi

# Starship
if command -v starship >/dev/null; then
  #  export STARSHIP_CONFIG=~/.config/starship/starship.toml
  export STARSHIP_CACHE="${XDG_CACHE_HOME}/starship"
fi

# Git
if command -v git >/dev/null; then
  export GIT_CONFIG_NOSYSTEM="true"
  export GIT_CONFIG_NOGLOBAL="true"
fi

# Micro
if command -v micro >/dev/null; then
  export MICRO_TRUECOLOR=1
fi

# eza
if command -v eza >/dev/null; then
  export EZA_STRICT=1
fi

# Systemd
if command -v systemctl >/dev/null; then
  export SYSTEMD_LESSCHARSET="utf-8"
  export SYSTEMD_PAGERSECURE="1"
  export SYSTEMD_COLORS="256"
  export SYSTEMD_URLIFY="1"
  export SYSTEMD_EDITOR="micro"
  export SYSTEMD_LOG_COLOR="1"
fi

# Kubernetes
if command -v kubectl >/dev/null; then
  export KUBECONFIG="${KUBECONFIG:-${XDG_CONFIG_HOME}/kube/config}"
fi

# .NET Core
if command -v dotnet >/dev/null; then
  # Disable Dotnet CLI telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT="1"
fi

# Rust
if command -v rustc >/dev/null || command -v cargo >/dev/null; then
  export CARGO_HOME="${CARGO_HOME:-${XDG_DATA_HOME}/cargo}"
  export RUSTUP_HOME="${RUSTUP_HOME:-${XDG_DATA_HOME}/rustup}"
fi

# Go
#if command -v go >/dev/null; then
#  export GOPATH=
#  export GOBIN=
#  export GOCACHE=
#fi

# less
if command -v less >/dev/null; then
  export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
fi

# Python
if command -v python3 >/dev/null || command -v python >/dev/null; then
  export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
  export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
  export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
fi

# Node.js
if command -v node >/dev/null; then
  export NODE_OPTIONS="--max-old-space-size=4096" # --openssl-legacy-provider"
  export NODE_REPL_HISTORY="${NODE_REPL_HISTORY:-${XDG_DATA_HOME}/nodejs/repl_history}"
fi

# Volta
if command -v volta >/dev/null; then
  export VOLTA_HOME="${HOME}/.volta"
fi

# npm
if command -v npm >/dev/null; then
  export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-${XDG_CONFIG_HOME}/npm/npmrc}"
  #export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
  #export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
  #export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"
fi

# GPG
if command -v gpg >/dev/null; then
  export GNUPGHOME="${GNUPGHOME:-${XDG_DATA_HOME}/gnupg}"
fi

# Ccache
if command -v ccache >/dev/null; then
  export CCACHE_CONFIGPATH="${XDG_CONFIG_HOME}/ccache.config"
  export CCACHE_DIR="${XDG_CACHE_HOME}/ccache"
fi

# Android
if command -v adb >/dev/null || command -v android >/dev/null || command -v sdkmanager >/dev/null; then
  export ANDROID_SDK_HOME="${XDG_CONFIG_HOME}/android"
  export ANDROID_SDK_ROOT="${XDG_DATA_HOME}/android"
  export ANDROID_AVD_HOME="${XDG_DATA_HOME}/android"
  export ANDROID_EMULATOR_HOME="${XDG_DATA_HOME}/android"
  export ADB_VENDOR_KEY="${XDG_CONFIG_HOME}/android"
  export ANDROID_USER_HOME="${XDG_DATA_HOME}/android"
fi

# wget
if command -v wget >/dev/null; then
  export WGETRC="${WGETRC:-${XDG_CONFIG_HOME}/wget/wgetrc}"
fi

# Docker
if command -v docker >/dev/null; then
  export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
fi

# Java
#if command -v java >/dev/null; then
#  export JAVAOPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}"/java
#fi

# Jupyter
if command -v jupyter >/dev/null; then
  export JUPYTER_CONFIG_DIR="${JUPYTER_CONFIG_DIR:-${XDG_CONFIG_HOME}/jupyter}"
fi

# Vagrant
if command -v vagrant >/dev/null; then
  export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
fi

# ICE Authority
if [[ -n "${DISPLAY}" ]]; then
  export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
fi

# export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
