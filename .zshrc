export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Shortcuts
bindkey "[B" backward-word
bindkey "[W" forward-word

# Git
alias git-pull-all='find . -type d -mindepth 1 -maxdepth 1 -print -exec git -C {} pull \;'

# Java
alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

# PATH
export PATH=~/Library/Python/3.7/bin:$PATH

source ~/.iterm2_shell_integration.zsh
