# SG-SHELL
## Configs for my personal shell environment.
*Not taking help on this. If it's useful to you use it!*
### *Summary*
Welcome to my shell configs. Currently I use Zshell for it's awesome syntax highlighting, autocompletion, and autosuggest features. Even so, i'm not ready to ditch bash. Why i wish i could keep bash is a much longer explanation for another time. Also, all my scripting is done in bash.

It works on my system.

This led me to needing an easy, organized way to be able to use each shell without having to have repeats of text or configs in each shell config. The solution is basically a bunch of drop in config folders. This could be expanded to include other shells in the future if i so decide to play around with them. Currently the only other shells that interest me are the rust based shells ion and nushell, and the python based shell xonsh.

 - [Nushell](https://github.com/nushell/nushell)
 - [Ion](https://github.com/redox-os/ion)
 - [Xonsh](https://github.com/xonsh/xonsh)

### *Goals*
 - Organized folder structure.
 - Keep files short and small.
 - Drop in folders to ease organization.
 - Reduce repeated code.
 - Jam it all in a single rc file doesn't work for me.

I hate when config files contain mountains of text to sort through. Everything has a place, and everything in it's place. This is essentially a framework to better organize shell configs. At least i think it is. The structure is a folder for each shell, and a shared folder for the things that all shells can use. Adding other shells in the future might force this to change. From there, each folder has a main rc file that can be sourced, which then sources all subfolders/files. Simple, sweet, and organized.
