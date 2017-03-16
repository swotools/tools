#!/usr/bin/env bash
DIRAPP="./app";
ENVFILE="$DIRAPP/.env";
DIRDB='./bin/db'
ENVFILE="$DIRAPP/.env";
DBNAME='dbrepo'
echo ">>> Db dump"
################################################## LOAD ENV FILE
source $ENVFILE
echo 'ho caricato il file .env'
echo "DB USER $DB1_USER e DBNAME $DBNAME"
################################################## Prepara files
#esiste la dir?
if [ ! -d $DIRDB ];then
    sudo mkdir $DIRDB
fi
echo "Dir db is $DIRDB"

mysqldump -u $DB1_USER -p$DB1_PASS --no-data --skip-extended-insert $DBNAME > $DIRDB/$DBNAME.sql

#mysqldump -u [mysql user] -p[mysql password] --skip-extended-insert [database] > /path/to/your/repo/[database].sql

#ARGS="--host=127.0.0.1 --user=root --password=inet1920 --opt --skip-dump-date --skip-comments --skip-extended-insert $NODATA"
#mysqldump $ARGS testdb | sed 's$VALUES ($VALUES\n($g' | sed 's$),($),\n($g' > "$DIRDB/mydatabase.sql"
