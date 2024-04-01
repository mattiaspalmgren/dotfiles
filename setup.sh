#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ;
sudo chown -R mattiaspalmgren /usr/local/share/zsh /usr/local/share/zsh/site-functions
chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions

# Install tools
brew bundle install
brew bundle --file=~/dev/dotfiles/Brewfile-alva

# Apply modified osx defaults
bash macos

# Remove all applications from dock
dockutil --no-restart --remove all
killall Dock

# Create symlinks for dotfiles
ln -s ~/dev/dotfiles/shell/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/git/.gitconfig-alva ~/.gitconfig-alva
ln -s ~/dev/dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/dev/dotfiles/visual-studio-code/keybindings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/visual-studio-code/settings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/.ideavimrc
ln -s ~/dev/dotfiles/git/gh/config.yml ~/.config/gh
ln -s ~/dev/dotfiles/git/lazygit/config.yml ~/Library/Application\ Support/lazygit
ln -s ~/dev/dotfiles/docker/lazydocker/config.yml ~/Library/Application\ Support/lazydocker

# Create dirs
mkdir ~/.nvm
