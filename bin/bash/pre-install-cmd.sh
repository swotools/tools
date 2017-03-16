#!/bin/bash
ENVFILE="./app/.env";
################################################## LOAD ENV FILE

if [ ! -f "$ENVFILE" ]; then
  echo "Missed ENV!";
  exit 1;
else
  echo "Env file is ok on $ENVFILE"
fi
##controlla modulo python pip install -U python-dotenv
python bin/python/setup.py