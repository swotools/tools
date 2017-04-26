#!/bin/sh
set -e
source vendor/swotools/tools/bin/_config.sh
# Controllo SWOG
# se lo chiami da composer swo:clean, si autoelimina cancellando vendor
SWOG_COPY=( "package.json" "gruntfile.js" "grunt" "scss" "js" )
for i in "${SWOG_COPY[@]}"
do
  echo "Elimino $i ..."
  if [ -d $i ] || [ -f $i ];then
      rm -rf $i
  fi
done

for i in "${DIRCLEARCACHE[@]}"
do
  echo "Elimino $i ..."
  if [ -d $i ] || [ -f $i ];then
      rm -rf $i
  fi
done

for i in "${SWO_DIRS[@]}"
do
  echo "Elimino $i ..."
  if [ -d $i ] || [ -f $i ];then
      rm -rf $i
  fi
done

## SOLO X POCKET REPO !!
# rm -rf dist
# rm -rf node_modules
# rm -rf swog
# rm -rf tasks
# rm -rf scss
# rm -rf js
# rm gruntfile.js
# rm package.json
# rm composer.lock
# rm -rf vendor
# rm -rf logs
# rm -rf tmp
# rm -rf cache
