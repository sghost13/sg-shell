# shellcheck shell=bash disable=2154
# shell-check doesn't support zsh, fake it with bash

# Function: addpath
# Description: Adds a directory to the PATH environment variable if it exists
#              and is not already present. Ensures no double entries in path.
#              Likely highly over engineered, especially loaded into shell.
# Arguments:
#   --error  - Show an error if the directory doesn't exist (optional, first position)
#   $1       - Directory to add to PATH
#   $2       - Position to add directory (prepend/append), defaults to prepend
# Returns:
#   0 if successful, 1 if error
# Examples:
#   addpath /usr/local/bin
#   addpath --error ~/tools/missing append
addpath() {
  local dir position show_errors=false

  # Check if first argument is the error flag
  if [[ "$1" == "--error" ]]; then
    show_errors=true
    shift # Remove the flag from arguments
  fi

  dir="${1}"
  position="${2:-prepend}"

  # Check if the directory argument is provided, return and print error if it is not
  if [[ -z "${dir}" ]]; then
    printf "\e[31mError: \e[1m%s\e[22m: Missing argument or empty variable\e[0m\n" "$0" >&2
    return 1
  fi

  # Check if directory exists
  if [[ ! -d "${dir}" ]]; then
    # Only show error if --error flag is used
    if [[ "${show_errors}" == true ]]; then
      printf "\e[31mError: \e[1m%s\e[22m: Directory does not exist: \e[1m%s\e[0m\n" "$0" "${dir}" >&2
      return 1
    fi
    # Silently return if directory doesn't exist and no --error flag
    return 0
  fi

  # Normalize directory path (remove trailing slash)
  dir="${dir%/}"

  # Verify dir exists and is not already in PATH.
  if [[ -d "${dir}" && ":${PATH}:" != *":${dir}:"* ]]; then
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
