# Activation of vendor software

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use

# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
