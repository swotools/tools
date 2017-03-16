#!/usr/bin/env python2
# encoding: UTF-8
from dotenv import load_dotenv
import json
import os
import sys

COMPOSER_DATA = None
ADD_2_ENV = ''
APPDIR = './app'
COMPOSERJSON = './composer.json'
PATH_DOTENV = APPDIR + '/.env'
# controllo esistenza composer.json
if not os.path.isfile(COMPOSERJSON):
    print 'File composer mancante'
    sys.exit(1)
# carico le variabili di env
try:
    load_dotenv(PATH_DOTENV)
except ImportError:
    print 'Non ho trovato la libreria dotenv.\nUsa pip install -U python-dotenv'
    sys.exit(1)
# carico il composer
with open('composer.json') as data_file:
    COMPOSER_DATA = json.load(data_file)

NAMESPACE = COMPOSER_DATA['name'].lower().strip()
# VERIFICO VAR DI AMBIENTE
APP_NAMESPACE = os.environ.get("APP_NAMESPACE")

if (APP_NAMESPACE is None) or (APP_NAMESPACE == ""):
    print 'Creo la variabile APP_NAMESPACE'
    ADD_2_ENV += '\nAPP_NAMESPACE="%s"' % NAMESPACE
else:
    print 'IL namespace è ' + APP_NAMESPACE

if ADD_2_ENV != '':
    print 'Aggiorno env file'
    try:
        with open(PATH_DOTENV, "a") as envfile:
            envfile.write(ADD_2_ENV)
            print 'env file modificato con ' + ADD_2_ENV
    except IOError as e:
        print "Unable to open file" #Does not exist OR no read permissions

print 'Fine'
