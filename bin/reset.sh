#!/bin/sh
set -e
source vendor/swolab/swotools/bin/_config.sh
# 17-7-17 - reset: cancella tutti i file temporanei

# FILE di ambiente SWO
for i in "${SWO_DIRS[@]}"
do
  echo "Elimino $i ..."
  if [ -d $i ] || [ -f $i ];then
      rm -rf $i
  fi
done

# FILE extra come quelli di composer
for i in "${RESETFILES[@]}"
do
  echo "Elimino $i ..."
  if [ -d $i ] || [ -f $i ];then
      rm -rf $i
  fi
done
