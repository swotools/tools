#!/bin/sh
set -e
#QUESTO CMD VIENE ESEGUITO LA PRIMA VOLTA! PERCHÈ MANCA IL .LOCK
#post-update-cmd: occurs after the update command has been executed, or after the install command has been executed without a lock file present.
echo "INIT post-update-cmd ..."
source vendor/swotools/tools/bin/swog/_config.sh

# CONTROLLO ESISTENZA FILE ENV
echo "Check ENV ..."
if [ ! -f $ENVFILE ];then
  echo "Not found .env file!"
  exit
fi
echo "Loading $ENVFILE file ..."
source $ENVFILE
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
