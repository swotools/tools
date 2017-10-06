#!/bin/sh
set -e

echo "INIT log:archive ..."
source vendor/swotools/tools/bin/_config.sh

# CONTROLLO ESISTENZA FILE ENV
echo "Check ENV ..."
if [ ! -f $ENVFILE ];then
  echo "Not found .env file!"
  exit
else
  echo "Loading $ENVFILE file ..."
  source $ENVFILE
fi
# CONTROLLO CARTELLE
echo "Scan log files ..."
for filename in $DIRLOGS/*.log; do
  echo "Working with $filename"
done
