#!/bin/bash

# From: https://gist.github.com/gcollic/f6f093ec3805979669d0bf744e22c72a

inner() {
    local cmd="$@"
    local REGEX="(^|log.showSignature=false )(add|rm|mv) "
    if [[ $cmd =~ $REGEX ]]; then
        echo 'Stopping jetbrains from adding to staging area...' >&2
        return 1
    fi
    git "$@"
}

inner "$@"
