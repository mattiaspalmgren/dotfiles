# Setup from jetbrain product

## Before
ln -s ~/dev/dotfiles/jetbrains/.ideavimrc ~/

## Product
<PRODUCT> = 'WebStorm2020.1'

rm ~/Library/Application\ Support/JetBrains/<PRODUCT>/codestyles
ln -s ~/dev/dotfiles/jetbrains/codestyles ~/Library/Application\ Support/JetBrains/<PRODUCT>/

rm -r ~/Library/Application\ Support/JetBrains/<PRODUCT>/colors
ln -s ~/dev/dotfiles/jetbrains/colors ~/Library/Application\ Support/JetBrains/<PRODUCT>/

rm -r ~/Library/Application\ Support/JetBrains/<PRODUCT>/keymaps
ln -s ~/dev/dotfiles/jetbrains/keymaps ~/Library/Application\ Support/JetBrains/<PRODUCT>/

rm -r ~/Library/Application\ Support/JetBrains/<PRODUCT>/options
ln -s ~/dev/dotfiles/jetbrains/options ~/Library/Application\ Support/JetBrains/<PRODUCT>/