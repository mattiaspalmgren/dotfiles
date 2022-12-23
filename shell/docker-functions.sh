#!/bin/bash

function dstop() {
  (
    set -e
    CONTAINER=$(docker ps --format "{{.Names}}" | fzf)
    docker stop $CONTAINER
  )
}

function dkill() {
  (
    set -e
    CONTAINERS_TO_KILL=$(docker ps --format "{{.Names}}" | grep --invert --extended-regexp "firestore|pubsub")
    echo "Removing containers:"
    echo $CONTAINERS_TO_KILL | xargs docker rm --force
  )
}
function dcstop() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose stop $CONTAINER
  )
}

function dcup() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose up -d --build $CONTAINER
  )
}

function dclogs() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose logs --follow $CONTAINER
  )
}

function dcrun() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose exec -it $CONTAINER bash
  )
}

function dcpull() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose pull $CONTAINER
  )
}

function dcrestart() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose restart $CONTAINER
  )
}
