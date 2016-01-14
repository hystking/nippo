#!/bin/bash
set -e

SCRIPT_DIR=`dirname $0`
DATE=`$SCRIPT_DIR/date.sh`

EDITOR=vim
MD=$SCRIPT_DIR/log/$DATE.md

if ! test -e $MD; then
   ./$SCRIPT_DIR/new.sh > $MD
fi

$EDITOR $MD
