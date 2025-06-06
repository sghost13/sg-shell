ZSH is my current interactive shell.  
See [home/.config/shell/.zshrc](https://github.com/sghost13/sg-shell/blob/main/home/.config/shell/.zshrc) for the main entrypoint.  
ZDOTDIR is set to `$HOME/.config/shell` in `etc/zshenv`.

For BASH, a single file `.bashrc` is maintained for use on servers.  
You can find it at [home/.config/shell/.bashrc](https://github.com/sghost13/sg-shell/blob/main/home/.config/shell/bashrc).

Download and replace $HOME/.bashrc
```bash
curl -sSL -o "$HOME/.bashrc" "https://raw.githubusercontent.com/sghost13/sg-shell/main/home/.config/shell/bashrc"
```

Shellcheck is set up for bash scripting, and I follow Google’s style guides here:  
[Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html).
