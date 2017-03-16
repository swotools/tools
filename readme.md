# SWOTools


## Installing

__Db esistente__
Se esiste un db devi configurare ed eseguire questo
```bash
composer db:preinstall
```
Come best practice dovresti costruire il db dai modelli
!! Cosa importante:<br>
Se crei i model, ricordati di mettere il namespace!!
```php
<?php
namespace App\Model;

use Doctrine\ORM\Mapping as ORM;
```
Per stampare l'intero valore delle colonne dalla classe, ho aggiunto nei model
```php
...
public function getArrayCopy()
{
    return get_object_vars($this);
}
...
```
Credo che da questo ultimo punto inizi il gioco di fractal

__Db nuovo__
Scivi nella dir App\Src\Model i modelli delle tabelle

Una volta scritte le tabelle, lanci il comando
``` bash
composer db:create
```
Poi se hai bisogno di aggiornare lanci il comando
``` bash
composer db:update
```


## Composer



## Installing

composer install

## Note
- app/src/resource perchÃ¨ se metti in dependencies.php questo
``` php
$container['App\Action\PhotoAction'] = function ($c) {
    $photoResource = new \App\Resource\PhotoResource($c->get('em'));
    return new App\Action\PhotoAction($photoResource);
};
```

[Esempio preso qui](https://github.com/matthewfedak/slim-3-doctrine-2/blob/master/app/dependencies.php)



inietti $photoResource e lavora solo con em. La classe astratta che estende
va fatta come BaseController


- app/src/utente
Ã¨ il modello vecchio in pdo.

## ToDO
