export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Git
alias git-pull-all='find . -type d -mindepth 1 -maxdepth 1 -print -exec git -C {} pull \;'

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
alias mission='~/../../Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/bin/jmc'
		
source ~/.iterm2_shell_integration.zsh
