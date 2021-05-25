# Configs for zsh

function zle-keymap-select zle-line-init {
    local BLOCK_CURSOR="\E]50;CursorShape=0\C-G"
    local LINE_CURSOR="\E]50;CursorShape=1\C-G"

    case $KEYMAP in
        vicmd)      print -n -- $BLOCK_CURSOR;;
        viins|main) print -n -- $LINE_CURSOR;;
    esac
    zle reset-prompt
    zle -R
}

function zle-line-finish {
    local BLOCK_CURSOR="\E]50;CursorShape=0\C-G"
    print -n -- $BLOCK_CURSOR
}

function vi-yank-x-selection () {
  zle vi-yank
  echo $CUTBUFFER | pbcopy
}

function vi-yank-dd-selection () {
  zle kill-whole-line
  echo $CUTBUFFER | pbcopy
}

function vi-yank-d-selection () {
  zle kill-region
  echo $CUTBUFFER | pbcopy
}

# Line editor customization
zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
zle -N vi-yank-d-selection
zle -N vi-yank-dd-selection
zle -N vi-yank-x-selection

# Key bindings
bindkey -v # Use vi-mode
bindkey -M vicmd "dd" vi-yank-dd-selection
bindkey -M visual "dd" vi-yank-dd-selection
bindkey -M visual "d" vi-yank-d-selection
bindkey -M vicmd "y" vi-yank-x-selection
bindkey -M visual "y" vi-yank-x-selection
bindkey '^R' history-incremental-search-backward
bindkey '^[[Z' reverse-menu-complete # Reverse cycle

# Prompt
ZSH_THEME="geoffgarside"
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
PROMPT='%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '

# Title
DISABLE_AUTO_TITLE="true"
precmd() {
  # Sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Options
unsetopt AUTO_CD
