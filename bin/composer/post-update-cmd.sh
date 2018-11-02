#!/bin/sh
set -e
#QUESTO CMD VIENE ESEGUITO LA PRIMA VOLTA! PERCHÈ MANCA IL .LOCK
#post-update-cmd: occurs after the update command has been executed, or after the install command has been executed without a lock file present.
echo "INIT post-update-cmd ..."

USER=$(whoami)
ENVFILE=".env";
WWW_USER=`ps axo user,group,comm | egrep '(apache|httpd)' | grep -v ^root | uniq | cut -d\  -f 1`


# CONTROLLO ESISTENZA FILE ENV
echo "Check ENV ..."
if [ ! -f $ENVFILE ];then
  echo "Not found .env file!"
  exit
else
  echo "Loading $ENVFILE file ..."
  source $ENVFILE
fi
# CONTROLLO CARTELLA CACHE
echo "Check cache folders ..."
  if [ ! -d 'cache' ];then
      mkdir 'cache'
  fi

chown $USER:$WWW_USER cache
