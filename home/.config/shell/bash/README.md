# Bash configs.
## Configs specific to BASH.
  - $HOME only contains .bash_profile and sources $HOME/.config/shell/bash/bashrc to keep $HOME clean.
### This includes:
  - bashenv file
    - All bash specific environment variables.
    - Sources shared envrc for all shared environment variables.
  - shopt file
    - All shopt options go here.
  - bashrc file
    - sources all shared shell config files
    - contains all zsh specific configs.