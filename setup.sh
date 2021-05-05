#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bundle and cask
brew tap Homebrew/bundle

# Install tools
brew bundle Brewfile

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | shit

# Apply modified osx defaults
source .osx

# Remove all applicaitons from dock
dockutil --no-restart --remove all
killall Dock

# Create symlinks for dotfiles
ln -s ~/dev/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/dev/dotfiles/visual-studio-code/keybindings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/visual-studio-code/settings.json ~/Library/Application Support/Code/User/
ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/.ideavimrc
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
ln -s ~/dev/dotfiles/utils/.git-utils ~/.git-utils
ln -s ~/dev/dotfiles/utils/.docker-utils ~/.docker-utils
ln -s ~/dev/dotfiles/utils/.kublectl-utils ~/.kublectl-utils

