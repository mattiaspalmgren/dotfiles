#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Bundle and cask
brew tap Homebrew/bundle

# Install tools
brew bundle Brewfile

# Apply modified osx defaults
./macos

# Remove all applicaitons from dock
dockutil --no-restart --remove all
killall Dock

# Create symlinks for dotfiles
ln -s ~/dev/dotfiles/shell/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/dev/dotfiles/visual-studio-code/keybindings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/visual-studio-code/settings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/.ideavimrc
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
