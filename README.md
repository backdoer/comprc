# Comprc

This project contains all of my dev environment configuration files:
* `.vimrc`
* `tmux.conf`
* `.zshrc`
* `.bashrc`
* `.shell-functions` (functions that are shared between zsh and bash)
* Brewfile
* `.alacritty.yml`
* snippets

It also contains a `.make.sh` file that will install all dependencies, move the existing configuration files into a `/old_comprc` directory, and symlink the configuration files into the home directory.

To run the make file, run:
`./.make.sh`
