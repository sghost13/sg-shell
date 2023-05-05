# Zshell configs.
## Configs specific to zsh.
  - ZDOTDIR is set in /etc/zshenv to keep our $HOME clean.
### This includes:
  - zshenv file
    - All zsh specific environment variables.
    - Sources shared envrc for all shared environment variables.
  - setopt.zsh
    - All setopt options go here.
    - Options may be overwritten by plugins/prompts.
  - zshrc file
    - sources all shared shell files
    - contains all zsh specific configs.
