#!/bin/sh
set -e

echo "INIT swog install ..."
source vendor/swolab/swotools/bin/_config.sh

# CONTROLLO ESISTENZA FILE ENV
echo "Check ENV ..."
if [ ! -f $ENVFILE ];then
  echo "Not found .env file!"
  exit
else
  echo "Loading $ENVFILE file ..."
  source $ENVFILE
fi

SWOG_COPY=( "package.json" "gruntfile.js" "grunt" "scss" "js" )

if [ ! -z "$APP_ENV" ];then
  echo "**********************************"
  echo "ENV NAME $APP_ENV"
  echo "**********************************"
  # VERIFICO CHE esista il file swoginstall.sh
  # copio il file di installazione
  # SE E SOLO SE, NON TROVO i file di SWOG COPY nella root del progetto
  if [ ! -f "package.json" ];then
    echo "SWOG installing ..."
    for fsobject in "${SWOG_COPY[@]}";do
      if rsync -a "$DIRSWOG/$fsobject";then
        echo "$fsobject OK"
      else
        echo "$fsobject FAILED!"
      fi
    done
    # Verifico se esiste la cartella node_modules, installo, senò si arrangia
    # lo sviluppaore
    if [ ! -d "$DIRNODEMOD" ];then
      echo "Installo NPM ..."
      npm update -g
      npm install
    fi

  else
    echo "SWOG is installed"
  fi
# produzione: non faccio nulla perhcè non serve!
else
  echo "!!! PRODUCTION MODE $APP_ENV"
fi
