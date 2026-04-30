autoload -U colors && colors
autoload -Uz compinit && compinit

export DOTFILES_SHELL_DIR=~/dev/dotfiles/shell
export DOTFILES_DOCKER_DIR=~/dev/dotfiles/docker

SHELL_FILES=(
    envars.sh
    config.zsh
    aliases.sh
    alva.sh
)

for FILE in $SHELL_FILES; do
    source $DOTFILES_SHELL_DIR/$FILE
done

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init --cmd z zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
