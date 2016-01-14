#!/bin/bash
set -e
SCRIPT_DIR=`dirname $0`

EDITOR=vim

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
DATE=$YEAR-$MONTH-$DAY

MD=$SCRIPT_DIR/mds/$DATE.md
CSS=$SCRIPT_DIR/templates/style.css
HTML=$SCRIPT_DIR/public/index.html
TEMPLATE=$SCRIPT_DIR/templates/nippo.md

if ! test -e $MD; then
  sed -e "s/YEAR/$YEAR/" -e "s/MONTH/$MONTH/" -e "s/DAY/$DAY/" $TEMPLATE > $MD
fi

$EDITOR $MD

read -p "Show Compiled HTML? [yes]: " yn
test "$yn" = "yes"

COMPILED=`marked $MD`
INLINE_CSS=`cat $CSS`
echo "<!DOCTYPE html><html><head><style>$INLINE_CSS</style><title>Nippo</title></head><body>$COMPILED</body></html>" > $HTML

http-server -o
