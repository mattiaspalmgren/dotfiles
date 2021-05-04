export ZSH=/Users/mattiaspalmgren/.oh-my-zsh

ZSH_THEME="geoffgarside"

plugins=(git, z)
source $ZSH/oh-my-zsh.sh

# Use vi-mode
bindkey -v

function vi-yank-x-selection () {
  zle vi-yank
  echo $CUTBUFFER | pbcopy
}
zle -N vi-yank-x-selection
bindkey -M vicmd "y" vi-yank-x-selection
bindkey -M visual "y" vi-yank-x-selection

function vi-yank-dd-selection () {
  zle kill-whole-line
  echo $CUTBUFFER | pbcopy
}
zle -N vi-yank-dd-selection
bindkey -M vicmd "dd" vi-yank-dd-selection
bindkey -M visual "dd" vi-yank-dd-selection

function vi-yank-d-selection () {
  zle kill-region
  echo $CUTBUFFER | pbcopy
}
zle -N vi-yank-d-selection
bindkey -M visual "d" vi-yank-d-selection

export KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward

# Reverse cycle
bindkey '^[[Z' reverse-menu-complete

function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac
    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

# Prompt
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
PROMPT='%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '

# Aliases
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias j12="export JAVA_HOME=`/usr/libexec/java_home -v 12`; java -version"
alias j14="export JAVA_HOME=`/usr/libexec/java_home -v 14`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias linked="find node_modules -type l -maxdepth 3 | grep -v .bin"
alias copy="history | tail -1 | cut -c8-999 | pbcopy"
alias ws="webstorm ."
alias pc="charm ."

# Utils
source ~/.git-utils
source ~/.docker-utils
source ~/.kublectl-utils

# Environment variables
source ~/.svt-env

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Path
export PATH=~/Library/Python/3.7/bin:$PATH
export PATH=~/Library/Python/3.8/bin:$PATH
export PATH=~/dev/dotfiles/utils:$PATH
export PATH=~/dev/dotfiles/utils/svt:$PATH
export PATH=~/dev/dotfiles/scripts:$PATH
export PATH=~/dev/dotfiles/scripts/svt:$PATH

# For fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NODE_PATH=$(npm root -g)

# Settings
export LC_ALL=en_US.UTF-8

# Disable auto cd
unsetopt AUTO_CD

source ~/.iterm2_shell_integration.zsh
