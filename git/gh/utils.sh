#!/usr/bin/env bash

PR_CONTENT_FILE=PR.md

function get_pr_title() {
  TITLE=$(head -n 1 $PR_CONTENT_FILE)
  echo "$TITLE"
}

function get_pr_body() {
  DESCRIPTION=$(tail -n +3 $PR_CONTENT_FILE)
  echo "$DESCRIPTION"
}

function create_pr() {
  [[ -e $PR_CONTENT_FILE ]] && HAS_CONTENT_FILE=true || HAS_CONTENT_FILE=false
  if [[ $HAS_CONTENT_FILE == false ]]; then
    gh pr create --draft
    exit 0
  fi

  PR_TITLE=$(get_pr_title)
  PR_BODY=$(get_pr_body)
  PR_BODY+="$PR_FOOTER_TEMPLATE"

  if [[ $PR_TITLE && $PR_BODY ]]; then
    gh pr create --title "$PR_TITLE" --body "$PR_BODY" --draft
    > $PR_CONTENT_FILE
    exit 0
  else
    gh pr create --draft
    exit 0
  fi
}
