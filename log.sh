#!/bin/bash

action=$1

# -------- loging helper begin --------#
# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"

log() {
  echo "$BLUE > $1 $NORMAL"
}

error() {
  echo ""
  echo "$RED >>> ERROR - $1$NORMAL"
}
# -------- loging helper end --------#

case $action in
    "true" )
        log "hello world"
        ;;
    * )
        error "hello world"
        ;;
esac
