export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

plugins=(
    git
    z
)
source $ZSH/oh-my-zsh.sh

export DOTFILES_SHELL_DIR=~/dev/dotfiles/shell

SHELL_FILES=(
    envars.sh
    config.zsh
    vendor.zsh
    aliases.sh
    functions.sh
    alva.sh
)

for FILE in $SHELL_FILES; do
    source $DOTFILES_SHELL_DIR/$FILE
done
