#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bundle and cask
brew tap Homebrew/bundle

# Install tools
brew bundle Brewfile

# Apply modified osx defaults
source .osx

# Remove and add applicaitons to dock
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Spotify.app"
killall Dock

