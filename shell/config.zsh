# Configs for zsh

function zle-keymap-select zle-line-init {
    local BLOCK_CURSOR="\e[2 q"
    local LINE_CURSOR="\e[6 q"

    case $KEYMAP in
        vicmd)      print -n -- $BLOCK_CURSOR;;
        viins|main) print -n -- $LINE_CURSOR;;
    esac
    zle reset-prompt
    zle -R
}

function zle-line-finish {
    local BLOCK_CURSOR="\e[2 q"
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
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""

git_prompt_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
    branch=$(git rev-parse --short HEAD 2>/dev/null) || return 0
  local dirty=$ZSH_THEME_GIT_PROMPT_CLEAN
  if ! git diff --no-ext-diff --quiet --ignore-submodules=dirty 2>/dev/null || \
     ! git diff --no-ext-diff --cached --quiet --ignore-submodules=dirty 2>/dev/null; then
    dirty=$ZSH_THEME_GIT_PROMPT_DIRTY
  fi
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${dirty}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

setopt PROMPT_SUBST
PROMPT='%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info) $ '

# Title
DISABLE_AUTO_TITLE="true"
autoload -Uz add-zsh-hook

__title_pwd() {
  if [[ -n $__title_override ]]; then
    print -Pn "\e]0;${__title_override}\a"
    return
  fi
  local repository_root title
  repository_root=$(git rev-parse --show-toplevel 2>/dev/null)
  title=${repository_root:+${repository_root##*/}}
  title=${title:-${PWD##*/}}
  print -Pn "\e]0;${title}\a"
}

title() { __title_override="$*"; __title_pwd; }
untitle() { unset __title_override; __title_pwd; }

add-zsh-hook precmd __title_pwd
add-zsh-hook chpwd  __title_pwd

# Options
unsetopt AUTO_CD
ulimit -n 1000
setopt nobeep
