#!/bin/bash

function get-hash() {
  COMMIT=$(git log --pretty=oneline | head -n 50 | fzf)
  HASH=$(echo $COMMIT | awk '{ print $1 }')
  echo $HASH
}

function fixup() {
  HASH=$(get-hash)
  git commit --fixup $HASH
  GIT_SEQUENCE_EDITOR=true git rebase --interactive --autosquash $HASH^
}

function size() {
    if git rev-parse --verify master >/dev/null 2>&1; then
        BRANCH=master
    elif git rev-parse --verify main >/dev/null 2>&1; then
        BRANCH=main
    else
        echo "Neither 'master' nor 'main' branch exists."
        return 1
    fi

    SIZE=$(git diff $BRANCH..HEAD --stat | tail -1)
    echo ${SIZE}
}
