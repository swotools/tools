#!/bin/bash
# **********************
# Aggiornamento di SWOG
# **********************
set -e # Exit script on error
# SWOG è installato in vendor/swotools/swog
VENDORDIR='vendor/swotools/swog'
BASEDIR=$1
# i file da aggiornare nella root del progetto.
# Escludo options perchè ogni singolo progetto può modificare parametri
# es. Concat, esclude js di carousel etc..
SWOG_COPY=( "package.json" "gruntfile.js")
SWOG_EXCLUDE=( "grunt/options" )

if [ -z $BASEDIR ]; then
   echo "SWOG base dir is Empty"
   exit
fi
# se esiste il file package, allora procedo
if [ -f "$BASEDIR/package.json" ];then
  echo "SWOG updating ..."
  for fsobject in "${SWOG_COPY[@]}";do
    # echo "$VENDORDIR/$fsobject in $BASEDIR"
    # DEPRECATED
    # if rsync -a "$VENDORDIR/$fsobject" $BASEDIR --exclude ${SWOG_EXCLUDE[@]};then
    if rsync -a "$VENDORDIR/$fsobject" $BASEDIR;then
      echo "$fsobject Updated"
    else
      echo "$fsobject FAILED!"
    fi
  done
else
  echo "SWOG is updated"
fi
