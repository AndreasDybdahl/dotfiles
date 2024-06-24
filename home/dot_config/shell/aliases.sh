# shellcheck shell=bash

# Use colors in coreutils utilities output
if ls --color=auto >/dev/null 2>/dev/null; then
  alias ls='ls --color=auto'
fi
alias grep='grep --color'

# Create a directory and cd into it
mcd() {
  mkdir "${1}" && cd "${1}"
}

# Go up [n] directories
up() {
  local cdir="$(pwd)"
  if [[ "${1}" == "" ]]; then
    cdir="$(dirname "${cdir}")"
  elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
    echo "Error: argument must be a number"
  elif ! [[ "${1}" -gt "0" ]]; then
    echo "Error: argument must be positive"
  else
    for ((i = 0; i < ${1}; i++)); do
      local ncdir="$(dirname "${cdir}")"
      if [[ "${cdir}" == "${ncdir}" ]]; then
        break
      else
        cdir="${ncdir}"
      fi
    done
  fi
  cd "${cdir}"
}

# bat (if it exists)
if [ -x "$(command -v bat)" ]; then
  alias cat='bat --style=plain --paging=never'
  alias catmore='bat --style=plain --paging=always'
fi