# SWOTools 1.2.1

## Novità di edizione
- controllo .env nella root del progetto
- installazione di swog non obbligatoria
- file di config in directory bin
- nuovo comando reset per file temporanei e di installazione app

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

## Comandi

### APP
#### reset
Elimina file temporanei e di installazione
Parametro di config - `SWO_DIRS`
Parametro di config - `RESETFILES`

### SWOG
#### clean
Pulisce direcotry.
Parametro di config - `SWO_DIRS`

### COMPOSER
#### post-update-cmd
Check cartelle di applicazione
Parametro di config - `SWO_DIRS`

## ToDO

- [x] app reset
- [x] swog clean
- [x] composer post-update-cmd
- [x] swog update [aggiorna file package, scss/swog, js/swog . Può essere utile ? ]
- [ ] Istruzioni o camandi con PHPCLI
- [ ] Configurazioni backup, manutenzione con python (request)
