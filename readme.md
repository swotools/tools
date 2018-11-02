SWOTools
====================
[![Package version](http://img.shields.io/packagist/v/swotools/swog.svg?style=flat)](https://packagist.org/packages/swotools/swog)
[![Downloads this Month](https://img.shields.io/packagist/dm/swotools/swog.svg)](https://packagist.org/packages/swotools/swog)
[![Twitter Follow](https://img.shields.io/twitter/follow/agenziasmart.svg?style=social&label=Follow)]()

Novità di edizione
-----------
https://agenziasmart.com/swo/tools

- I log non sono più gestiti da applicazioni swo/sw4, ma inviati a code esterne. Non più necessari i componenti
- SWOG non è più dipendente da applicazione, ma gestito singolarmente per reti CDN
- Nessun reset perchè non esiste più cartalla vuori dal version control
- Composer controlla solo ENV
- Mantenuta x ora la pulizia cache per TWIG nella cartella cache

Requirements
------------

 * PHP (7.2+)
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


## ToDO

- [x] No log management
- [x] swog update [aggiorna file package, scss/swog, js/swog . Può essere utile ? ]
- [ ] Istruzioni o camandi con PHPCLI


## Copyright and license

Code and documentation copyright 2011-2017 the [Agenziasmart](https://github.com/agenziasmart) Code released under the [MIT License](https://github.com/swotools/tools/blob/master/LICENSE). Docs released under [Creative Commons](https://github.com/swotools/tools/blob/master/docs/LICENSE).
