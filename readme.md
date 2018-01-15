SWOTools
====================
[![Package version](http://img.shields.io/packagist/v/swotools/swog.svg?style=flat)](https://packagist.org/packages/swotools/swog)
[![Downloads this Month](https://img.shields.io/packagist/dm/swotools/swog.svg)](https://packagist.org/packages/swotools/swog)
[![Twitter Follow](https://img.shields.io/twitter/follow/agenziasmart.svg?style=social&label=Follow)]()

Novità di edizione
-----------
https://

Requirements
------------

 * PHP (7.0+)
   * `ext/intl`

Installazione e config
-----------

Includi SWOTools in un progetto swo: api, web, abs.

#### Installazione

```json
composer require swotools/tools
```

#### Configurazione
Il file di configurazione ( ```/bin/_config.sh``` ) :

## Comandi

### APP
#### reset
Elimina file temporanei e di installazione
Parametro di config - `SWO_DIRS`
Parametro di config - `RESETFILES`

### SWOG
#### install
Installazione swog
**Composer script:**
```json
"swog:install": "bash vendor/swotools/tools/bin/swog/install.sh"
```
#### clean
Pulisce direcotry.
Parametro di config - `SWO_DIRS`
**Composer script:**
```json
"swog:clean": "bash vendor/swotools/tools/bin/swog/cleanpack.sh"
```

### COMPOSER
#### post-update-cmd
Check cartelle di applicazione
Parametro di config - `SWO_DIRS`
__Comando:__
```bash
composer install
```

### CLEANER

#### cache
Inizializza classe `Doctrine\Cache` per eliminare file scaduti o memorizzati da piàù di 1 mese (personalizzabile)
**Composer script:**
```json
"cleaner:cache": "php vendor/swotools/tools/cleaner/cache.php"
```

### LOG

Applicare rotatelogs!
Puoi metterlo in vhost:
```bash
CustomLog "|usr/bin/rotatelogs /var/log/apache2/smart/smartnet.access.log 1MB" combined
```
Oppure nelle conf di rotatelogs ( ```/etc/logrotate.d/apache``` ):

```bash
/var/log/apache2/*.log {
	daily
	missingok
	rotate 14
	compress
  ...
  postrotate
                if /etc/init.d/apache2 status > /dev/null ; then \
                    /etc/init.d/apache2 reload > /dev/null; \
                fi;
	endscript

```

#### Archive
Potrebbe essere aggiunto come script in postrotate del file di conf, oppure in cron. Permette di archiviare su s3 i file di log. Si sta  discutendo se lasciarlo in tools oppure portarlo in fabric come agente server
**Composer script:**
```json
"log:archive": "bash vendor/swotools/tools/log/test.sh"
```


## ToDO

- [x] app reset
- [x] swog clean
- [x] swog update [aggiorna file package, scss/swog, js/swog . Può essere utile ? ]
- [ ] Istruzioni o camandi con PHPCLI
- [ ] Configurazioni backup - s3 - (su tutto il server?)
- [ ] Verifica best practice con rotatelogs (virtualhost o logrotate.d)
- [ ] Installer di SWOTranslate ?


## Copyright and license

Code and documentation copyright 2011-2017 the [Agenziasmart](https://github.com/agenziasmart) Code released under the [MIT License](https://github.com/swotools/tools/blob/master/LICENSE). Docs released under [Creative Commons](https://github.com/swotools/tools/blob/master/docs/LICENSE).
