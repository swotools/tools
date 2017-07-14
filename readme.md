# SWOTools 1.2

## Novità di edizione
- controllo .env nella root del progetto
- file di config in directory bin
## Installazione e config

Includi SWOTools in un progetto swo: api, web, abs.

#### Includi in composer

```json
"repositories": [
    {
        "type": "git",
        "url": "https://github.com/swotools/tools"
    }
],
"require": {
  "swotools/tools": "^1.0"
}
```

#### Aggiungi i comandi script a composer

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

### Comandi

#### swo:clean
Pulisce direcotry.

## PLUGIN

## ToDO
**ATT!!** Swo clean in base a progetto, se trova swog, cancella anche altri file, altrimenti cancella directory.<br> controlla anche che
Comandi swog update.
Trova modo di eseguire comandi con php console ? serve ?
Usa ARGV per le variabili in script!! tipo --force , --delete etc..
