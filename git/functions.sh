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
