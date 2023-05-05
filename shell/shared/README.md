# Shared shell configs.
## Configs that can be shared between shells.
  - Main sharedrc is sourced by bashrc/zshrc
### This includes:
- conf.d dropin folder
  - Misc niceties. May split up in the future.
- alias.d dropin folder
  - a place to organize your aliases
- functions.d dropin folder
  - Functions that make interacting with the shell nicer/more user friendly.
  - Things that need to be in a function, but don't deserve there own file in bin.
- envrc file
  - Environment variables that can be shared between shells.
- sharedrc file
  - File that gets sourced by shellrc files.
    - bashrc and zshrc source this
    - Anything that can be in all shellrc files go here.
    - Sources everything else in shared folder.