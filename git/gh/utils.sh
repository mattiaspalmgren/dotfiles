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
    gh pr create --draft "$@"
    exit 0
  fi

  PR_TITLE=$(get_pr_title)
  PR_BODY=$(get_pr_body)
  PR_BODY+="$PR_FOOTER_TEMPLATE"

  if [[ $PR_TITLE && $PR_BODY ]]; then
    gh pr create --title "$PR_TITLE" --body "$PR_BODY" --draft "$@"
    > $PR_CONTENT_FILE
  else
    gh pr create --draft "$@"
  fi

    gh pr view --web
    exit 0
}

function pr_url() {
  PR_INFO=$(gh search prs --author ${GITHUB_NAME} --json id,repository,url,title | jq -r '@json')
  PR_ITEMS=$(echo "$PR_INFO" | jq -r '.[] | (.repository.name + " - " + .title)')
  SELECTED=$(echo "$PR_ITEMS" | fzf)
  REPOSITORY=$(echo "$SELECTED" | awk -F ' - ' '{print $1}')
  TITLE=$(echo "$SELECTED" | awk -F ' - ' '{print $2}')
  URL=$(echo "$PR_INFO" | jq -r --arg repository "$REPOSITORY" --arg title "$TITLE" 'map(select(.repository.name==$repository and .title==$title)) | .[].url')
  echo $URL
}

function open_pr() {
  URL=$(pr_url)
  if [[ $URL ]]; then
    open -a "Google Chrome" $URL
  fi
}

function copy_pr_content() {
  URL=$(pr_url)
  CONTENT=$(gh pr view $URL --json title,body --jq '.title, .body')
  LINE_COUNT=$(echo "$CONTENT" | wc -l)
  WITHOUT_FOOTER=$(echo "$CONTENT" | head -n $((LINE_COUNT - 3)))
  echo "$WITHOUT_FOOTER" | pbcopy
  echo "PR content copied."
}

function get_pr_url() {
  URL=$(pr_url)
  echo "$URL" | pbcopy
}
