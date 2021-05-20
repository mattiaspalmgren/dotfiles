export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

plugins=(git, z)
source $ZSH/oh-my-zsh.sh

export DOTFILES_SHELL_DIR=~/dev/dotfiles/shell

SHELL_FILES=(
    envars.sh
    vendor.sh
    config.sh
    aliases.sh
    functions.sh
)

for FILE in $SHELL_FILES; do
    source $DOTFILES_SHELL_DIR/$FILE
done

source ~/.iterm2_shell_integration.zsh
