#!/bin/bash
BASEDIR=''
NOW=$(date +"%m-%d-%Y-%H-%M-%S");
DIRLOGS="./logs";
DIRCACHE="./cache";
DIRAPP="./app";
ENVFILE="$DIRAPP/.env";
################################################## LOAD ENV FILE
source $ENVFILE
################################################## LOGS DIR
echo ">>> Checking logs dir"
if [ ! -d $DIRLOGS ];then
    sudo mkdir $DIRLOGS
fi
if [ ! -w $DIRLOGS ];then
  sudo chmod 777 "$DIRLOGS/"
else
  echo "La cartella $DIRLOGS è ok"
fi
echo "Complete!"
################################################## CACHE DIR
echo ">>> Checking cache dir"
if [ ! -d $DIRCACHE ];then
    sudo mkdir $DIRCACHE
fi
if [ ! -w $DIRCACHE ];then
  sudo chmod 777 "$DIRCACHE/"
else
  echo "La cartella $DIRCACHE è ok"
fi
echo "Complete!"
################################################## CHECK REDIS LIB
php -r "if (new Redis() == true){ echo \"Redis() OK \r\n\"; }else{\"!!! Redis() KO \r\n\";}"
