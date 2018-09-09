export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

ZSH_THEME="geoffgarside"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Shortcuts
bindkey "[B" backward-word
bindkey "[W" forward-word

# Git
alias git-pull-all='find . -type d -mindepth 1 -maxdepth 1 -print -exec git -C {} pull \;'

# Prompt
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
PROMPT='%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '

# Java
alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

# PATH
export PATH=~/Library/Python/3.7/bin:$PATH

source ~/.iterm2_shell_integration.zsh
