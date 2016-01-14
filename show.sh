#!/bin/bash
set -e

SCRIPT_DIR=`dirname $0`
DATE=`$SCRIPT_DIR/date.sh`

MD=$SCRIPT_DIR/log/$DATE.md
CSS=$SCRIPT_DIR/templates/style.css
HTML=$SCRIPT_DIR/public/index.html

COMPILED=`marked $MD`
INLINE_CSS=`cat $CSS`

echo "<!DOCTYPE html><html><head><style>$INLINE_CSS</style><title>Nippo</title></head><body>$COMPILED</body></html>" > $HTML

http-server -o
