#!/bin/bash
############################
# .make.sh
# This script will install all dependencies, 
# move the existing configuration files into a /old_comprc directory, 
# and symlink the configuration files into the home directory.
############################

########## Variables

dir=~/comprc                                # dotfiles directory
olddir=~/comprc_old                         # old dotfiles backup directory
files="bashrc zshrc vimrc vim tmux.conf alacritty.yml"    # list of files/folders to symlink in homedir

##########

echo "Installing OS Dependencies"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install zsh
  sudo apt-get install silversearcher-ag
  # package to compare floating point numbers
  sudo apt-get install bc
  sudo apt-get install tmux
  sudo apt-get install fortune
  sudo apt-get install cowsay
  sudo apt-get install vim
  sudo apt-get install ranger
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh
  brew install ag
  # package to compare floating point numbers
  brew install bc
  brew install tmux
  brew install fortune
  brew install cowsay
  brew install ranger
  brew install macvim && brew link macvim
fi
echo "Finished Installing OS Dependencies"

# oh my zsh
echo "Installing Oh My Zsh"
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Finished Installing Oh My Zsh"

# oh my zsh plugins
## syntax highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "Finished creating $olddir for backup of any existing dotfiles in ~"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "Finished changing to the $dir directory"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done
echo "Finished moving any existing dotfiles from ~ to $olddir"

# Install Plug for managing Vim plugins
echo "Installing Plug"
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Finished installing Plug"

# Change permissions on autload file
echo "Changing vim autoload permissions"
sudo chmod -R 755 ~/.vim/autoload
echo "Finished changing vim autoload permissions"

# Install the rest of the plugins
echo "Installing All Vim Plugins"
sudo vim +PlugInstall +qall
echo "Finished Installing All Vim Plugins"

 #Change permissions on autload file...already do this up above
#sudo chmod -R 755 ~/.vim/autoload

# Make fzf history public
echo "Changing fzf history permissions"
sudo chmod -R 755 ~/.local/share/fzf-history
echo "Finished changing fzf history permissions"

# switch to zsh shell
echo "Making zsh default shell"
sudo chsh -s /bin/zsh
echo "Finished making zsh default shell"

# Source bashrc in bash profile
#sudo echo "source ~/.bashrc" >> ~/.bash_profile

# Source zshrc in zprofile
#sudo echo "source ~/.zshrc" >> ~/.zprofile

# Clear the screen
clear

tmux
