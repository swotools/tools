#!/bin/bash
PROJECTDIR=$(pwd)
USER=$(whoami)
OSNAME=$(uname)
NOW=$(date +"%m-%d-%Y-%H-%M-%S");
COMPOSERFILE="composer.json";
DIRBIN='bin';
DIRBASH="$DIRBIN/bash";
WWW_USER=`ps axo user,group,comm | egrep '(apache|httpd)' | grep -v ^root | uniq | cut -d\  -f 1`

DIRLOGS='logs';
DIRCACHE='cache';
DIRSTATIC='public/static'
DIRTMP='tmp';
DIRAPP='app';
DIRVENDOR='vendor'
DIRNODEMOD='node_modules'
COMPOSERLOCK='composer.lock'

SWOGBASHINSTALL='swoginstall.sh'
DIRSWOG='vendor/swotools/swog'
SWOG_COPY=( 'package.json' 'gruntfile.js' 'grunt' 'scss' 'js' )

ENVFILE='.env';
SWO_DIRS=("$DIRLOGS" "$DIRTMP" "$DIRCACHE" "$DIRSTATIC")
RESETFILES=("$DIRNODEMOD" "$DIRVENDOR" "$COMPOSERLOCK")
