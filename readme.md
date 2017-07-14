# SWOTools 1.2

## Novità di edizione
- controllo .env nella root del progetto
- file di config in directory bin
## Installazione e config

Includi SWOTools in un progetto swo: api, web, abs.
```bash
composer require swotools/tools
```
Oppure aggiungi al require
```json
"require": {
  "swotools/tools": "^1.0"
}
```

## Comandi

### composer.json

```json
"scripts": {
  "post-update-cmd": [
    "bash vendor/swotools/tools/bin/composer/post-update-cmd.sh"
  ],
  "post-install-cmd": [
    "bash vendor/swotools/tools/bin/composer/post-install-cmd.sh"
  ],
  "swo:clean": "bash vendor/swotools/tools/bin/cleanpack.sh"
}
```
### Istruzioni
Dettagli funzionamento per singole istruzioni da eseguire in CLI o da aggiungere come composer scripts

#### post-update-cmd
Utilizza questo comando per eseguire istruzioni all'aggiornamento di composer

#### post-install-cmd
Utilizza questo comando per eseguire istruzioni dopo installazione composer

#### swo:clean
Pulisce direcotry.

## ToDO
**ATT!!** Swo clean in base a progetto, se trova swog, cancella anche altri file, altrimenti cancella directory.<br> controlla anche che
Comandi swog update.
Trova modo di eseguire comandi con php console ? serve ?
Usa ARGV per le variabili in script!! tipo --force , --delete etc..
