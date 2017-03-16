# SWOTools

## Installazione e config

Includi SWOTOols in un progetto swo: api, web, abs

#### Includi in composer

```json
"repositories": [
    {
        "type": "git",
        "url": "https://bitbucket.org/swolab/swotools"
    }
],
"require": {
  "swolab/swotools": "^1.0"
}
```

#### Aggiungi i comandi script a composer
```json
"scripts": {
  "post-update-cmd": [
    "bash vendor/swolab/swotools/bin/composer/post-update-cmd.sh"
  ],
  "post-install-cmd": [
    "bash vendor/swolab/swotools/bin/composer/post-install-cmd.sh"
  ],
  "swo:clean": "bash vendor/swolab/swotools/bin/cleanpack.sh"
}
```

### Comandi
#### swo:clean
Pulisce direcotry.

## PLUGIN

### SWOG
#### Includi in composer
```json
"repositories": [
  {
      "type": "git",
      "url": "https://bitbucket.org/swolab/swog"
  }
],
"require": {
  "swolab/swog": "^1.0"
}
```

#### Aggiungi i comandi script a composer
```json
"scripts": {
  "swog:install": "bash vendor/swolab/swotools/bin/swog/install.sh"
},
```


## ToDO
ATT!! Swo clean in base a progetto, se trova swog, cacnella anche altri file, altrimenti cancella directory.<br> controlla anche che
Comandi swog update.
Trova modo di eseguire comandi con php console ? serve ?
Usa ARGV per le variabili in script!! tipo --force , --delete etc..
