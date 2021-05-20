# Functions

function docstop() {
  CONTAINER=$(docker ps --format "{{.Names}}" | fzf)
  docker stop $CONTAINER
}

function kubl() {
  POD=$(kubectl get pods --output name | fzf)
  kubectl logs $POD
}

function browse-log() {
    local LOG PREVIEW FZF

    LOG=$(git log --format='%C(auto)%h %s' --color=always "$@")
    PREVIEW='f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}'
    FZF=(
        fzf
        --ansi
        --reverse
        --tiebreak=index
        --no-sort
        --bind=ctrl-j:preview-down
        --bind=ctrl-k:preview-up
        --preview "$PREVIEW"
    )

    echo $LOG | $FZF
}

function add-file() {
    local UNSTAGED_FILES FILE PREVIEW

    UNSTAGED_FILES=$(get-unstaged-files)
    PREVIEW='
      FILE=$(echo {} | awk '\''{print $2}'\'')
      if (echo {} | grep "^??") &>/dev/null; then
          git diff --color=always --no-index /dev/null $FILE
      else
          git diff --color=always $FILE
      fi
    '
    FZF=(
        fzf
        --ansi
        --bind=ctrl-j:preview-down
        --bind=ctrl-k:preview-up
        --preview "$PREVIEW"
    )
    FILE=$(echo $UNSTAGED_FILES | $FZF)
    FILE_NAME=$(echo $FILE | awk '{print $2}')

    [[ -n "$FILE_NAME" ]] && git add $FILE_NAME $@
}

function get-unstaged-files() {
    local CHANGED UNMERGED UNTRACKED FILES FILE_NAMES

    CHANGED=$(git config --get-color color.status.changed red)
    UNMERGED=$(git config --get-color color.status.unmerged red)
    UNTRACKED=$(git config --get-color color.status.untracked red)
    FILES=$(git -c color.status=always status --short -uall | grep -F -e "$CHANGED" -e "$UNMERGED" -e "$UNTRACKED")

    echo $FILES
}
