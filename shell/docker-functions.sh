#!/bin/bash

function dstop() {
  (
    set -e
    CONTAINER=$(docker ps --format "{{.Names}}" | fzf)
    docker stop $CONTAINER | xargs docker rm
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
    docker-compose up --detach --build $CONTAINER
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

function dcrs() {
  (
    set -e
    CONTAINER=$(docker-compose ps --services | fzf)
    docker-compose stop $CONTAINER
    docker-compose up --detach --build $CONTAINER
  )
}
