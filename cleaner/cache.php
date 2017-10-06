<?php
require 'vendor/autoload.php';
use Doctrine\Common\Cache\FilesystemCache;
use Noodlehaus\Config;

$config = new Config('config/settings.php');
$dirs = array($config->get('cache.dir'));

while ($dir = array_pop($dirs)) {
    $allFile = sprintf('%s/*%s', $dir, $config->get('cache.ext'));
    if ($cache_files = glob($allFile)) {
        foreach ($cache_files as $cache_file) {
            $delete = false;
            if ($fh = fopen($cache_file, 'r')) {
                $expiry = (int)fgets($fh);
                $delete = $expiry
                    ? $expiry < time()
                    // if the cache file has no expiration date, assume deleting every year is right.
                    : filemtime($cache_file) < strtotime('-1 month');
                fclose($fh);
            }
            if ($delete) {
                echo 'DELETING FILE ', $cache_file, PHP_EOL;
                unlink($cache_file);
                clearstatcache(true, $cache_file);
            }
        }
    }
    if ($sub_dirs = glob($dir . '/*', GLOB_ONLYDIR)) {
        $dirs = array_merge($sub_dirs, $dirs);
    }
}
