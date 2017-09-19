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
ln -s ~/DEV/dotfiles/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s ~/DEV/dotfiles/sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s ~/DEV/dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/DEV/dotfiles/sublime/console.log.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/console.log.sublime-snippet

