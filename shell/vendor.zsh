# Vendor software related stuff

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use

# Pyenv
export PATH="$(pyenv root)/libexec/pyenv:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Google cloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export CLOUDSDK_PYTHON="/Users/mattiaspalmgren/.pyenv/versions/3.9.0/bin/python3"

# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/10/bin:$PATH

# Ruby
export PATH=/usr/local/lib/ruby/gems/3.1.0/bin:$PATH
