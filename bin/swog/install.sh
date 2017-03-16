#!/bin/sh
set -e
#QUESTO CMD VIENE ESEGUITO LA PRIMA VOLTA! PERCHÈ MANCA IL .LOCK
#post-update-cmd: occurs after the update command has been executed, or after the install command has been executed without a lock file present.
echo "INIT post-update-cmd ..."
source vendor/swolab/swotools/bin/_config.sh

if [ ! -z "$APP_ENV" ];then
  echo "**********************************"
  echo "ENV NAME $APP_ENV"
  echo "**********************************"
  # VERIFICO CHE esista il file swoginstall.sh
  echo "Swog checking ..."
  if [ ! -f $DIRSWOGFILEINSTALL ];then
    echo "Non trovo il file di installazione di SWOG..."
    exit
  else
    # copio il file di installazione
    bash $DIRSWOGFILEINSTALL $PROJECTDIR
    # Verifico se esiste la cartella node_modules, installo, senò si arrangia
    # lo sviluppaore
    if [ ! -d "$DIRNODEMOD" ];then
      echo "Installo NPM ..."
      npm update -g
      npm install
    fi
  fi
# produzione: non faccio nulla perhcè non serve!
else
  echo "!!! PRODUCTION MODE $APP_ENV"
fi
