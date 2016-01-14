#!/bin/bash
set -e

SCRIPT_DIR=`dirname $0`

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`

TEMPLATE=$SCRIPT_DIR/templates/nippo.md

sed -e "s/YEAR/$YEAR/" -e "s/MONTH/$MONTH/" -e "s/DAY/$DAY/" $TEMPLATE
