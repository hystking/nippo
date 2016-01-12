#!/bin/bash

set -e

EDITOR=vim

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
DATE=$YEAR-$MONTH-$DAY

MD=mds/$DATE.md
CSS=templates/style.css
HTML=public/index.html
TEMPLATE=templates/nippo.md

if ! test -e $MD; then
  sed -e "s/YEAR/$YEAR/" -e "s/MONTH/$MONTH/" -e "s/DAY/$DAY/" $TEMPLATE > $MD
fi

$EDITOR $MD
COMPILED=`marked $MD`
INLINE_CSS=`cat $CSS`
echo "<!DOCTYPE html><html><head><style>$INLINE_CSS</style><title>Nippo</title></head><body>$COMPILED</body></html>" > $HTML
http-server -o
