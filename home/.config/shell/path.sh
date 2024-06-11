#!/usr/bin/env bash

# Function: addpath
# Description: Prepends or appends a directory to the PATH if it exists and is not already in $PATH. Defaults to prepend.
# Usage: addpath <directory> [prepend/append]
addpath() {
  local dir position
  dir="${1}"
  # Default to prepend (first) if no position is specified
  position="${2:-prepend}"

  # Verify dir exists and is not already in PATH.
  if [[ -d "${dir}" ]] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
    if [[ "${position}" == "append" ]]; then
      PATH="${PATH}:${dir}"
    else
      PATH="${dir}:${PATH}"
    fi
  fi
}

# Add HOME BIN to PATH if it exists
addpath "${XDG_BIN_HOME}"

# Add VOLTA to PATH if it exists
addpath "${VOLTA_HOME}/bin"

unset -f addpath
