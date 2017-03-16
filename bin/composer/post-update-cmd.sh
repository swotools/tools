#!/bin/sh
set -e
#QUESTO CMD VIENE ESEGUITO LA PRIMA VOLTA! PERCHÈ MANCA IL .LOCK
#post-update-cmd: occurs after the update command has been executed, or after the install command has been executed without a lock file present.
echo "INIT post-update-cmd ..."
source vendor/dadema/swotools/bin/_config.sh

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
echo "Check folders ..."
for i in "${SWO_DIRS[@]}"
do
  echo "Elaboro $i ..."
  if [ ! -d $i ];then
      mkdir $i
  fi
done
# # Imposto proprietari
# if [[ $OSNAME == *"Linux"* ]]; then
#   chown -R _www:staff cache/ logs/ tmp/
# else
#   echo "$OSNAME"
# fi
# chown -R $WWW_USER
sudo chown $WWW_USER ${SWO_DIRS[@]}

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
