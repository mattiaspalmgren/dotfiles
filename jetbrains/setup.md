# Setup from jetbrain product

## Before
Symlinc vim run config:
`ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/`

## Product
Symlinc config files via running:
`bash setup.sh` in this directory

## Add plugins 
Plugins:
- IdeaVim, 
- A move tab left and right using the keyboard plugin...
- String Manipulation

Preferences -> Plugins -> Add *PLUGIN*

## Customize coloring of editor ui
* Preferences -> Plugins -> GearIcon -> Install Plugin from disk -> `mapa-theme.jar`
* Reset your IDE -> Preferences -> Appearance -> Theme -> Select `mapa-theme`
* Appereance & Behaviour -> File Colors -> Non-project Files

## Exclude directories and files
* Preferences -> Project -> Project strucute -> Excluded

## Create command line launcher
Tools -> Create command line launcher

## To find actions
`:actionlist` gives all available actions.
