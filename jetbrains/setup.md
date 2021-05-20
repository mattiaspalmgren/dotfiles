# Setup from jetbrain product

## Before
Symlinc vim run config:
`ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/`

## Product
Symlinc other config files:

`export PRODUCT=WebStorm2020.1` etc.

`rm ~/Library/Application\ Support/JetBrains/$PRODUCT/codestyles`
`ln -s ~/dev/dotfiles/jetbrains/codestyles ~/Library/Application\ Support/JetBrains/$PRODUCT/`

`rm -r ~/Library/Application\ Support/JetBrains/$PRODUCT/colors`
`ln -s ~/dev/dotfiles/jetbrains/colors ~/Library/Application\ Support/JetBrains/$PRODUCT/`

`rm -r ~/Library/Application\ Support/JetBrains/$PRODUCT/keymaps`
`ln -s ~/dev/dotfiles/jetbrains/keymaps ~/Library/Application\ Support/JetBrains/$PRODUCT/`

`rm -r ~/Library/Application\ Support/JetBrains/$PRODUCT/options`
`ln -s ~/dev/dotfiles/jetbrains/options ~/Library/Application\ Support/JetBrains/$PRODUCT/`

## Add plugins 
Plugins:
- IdeaVim, 
- A move tab left and right using the keyboard plugin...

Preferences -> Plugins -> Add *PLUGIN*

## Customize coloring of editor ui
* Preferences -> Plugins -> GearIcon -> Install Plugin from disk -> `mapa-theme.jar`
* Reset your IDE -> Preferences -> Appearance -> Theme -> Select `mapa-theme`

## To find actions
`:actionlist` gives all available actions.
