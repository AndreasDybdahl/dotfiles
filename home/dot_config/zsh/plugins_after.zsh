# External plugins (initialized after)

# dircolors
if [[ "$(tput colors)" == "256" ]] && [ -x "$(command -v dircolors)" ]; then
  eval "$(dircolors ~/.config/shell/plugins/dircolors-solarized/dircolors.256dark)"
fi