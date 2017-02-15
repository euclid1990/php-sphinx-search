#  PHP Sphinx Search
[![Latest Stable Version](https://poser.pugx.org/euclid1990/php-sphinx-search/version)](https://packagist.org/packages/euclid1990/php-sphinx-search)
[![Total Downloads](https://poser.pugx.org/euclid1990/php-sphinx-search/downloads)](https://packagist.org/packages/euclid1990/php-sphinx-search)
[![License](https://poser.pugx.org/euclid1990/php-sphinx-search/license)](https://packagist.org/packages/euclid1990/php-sphinx-search)

PHP Sphinx search tool (An external solution for database full-text search). Support Composer & Laravel Framework.

## Installation

[PHP](https://php.net) 5.4 is required.

The PHP Sphinx Search Service Provider can be installed via [Composer](http://getcomposer.org) by requiring the
`euclid1990/php-sphinx-search` package in your
project's `composer.json`.

```json
{
    "require": {
        "euclid1990/php-sphinx-search": "~1.0"
    },
    "minimum-stability": "stable"
}
```

or

Require this package with composer:
```
composer require euclid1990/php-sphinx-search
```

Update your packages with ```composer update``` or install with ```composer install```.

## Setup

#### 1. Commmon PHP

Add boostrap autoload file:
```php
require_once __DIR__ . '/../vendor/autoload.php';

use euclid1990\PhpSphinxSearch\SphinxSearch;
```

#### 2. For Laravel

- To use the Sphinx Search Service, you must register the provider when bootstrapping your Laravel application. There are essentially two ways to do this.

Find the `providers` key in `config/app.php` and register the Sphinx Search Service Provider.

```php
    'providers' => [
        // ...
        'euclid1990\PhpSphinxSearch\Providers\SphinxSearchServiceProvider',
    ]
```
for Laravel 5.1+
```php
    'providers' => [
        // ...
        euclid1990\PhpSphinxSearch\Providers\SphinxSearchServiceProvider::class,
    ]
```

Find the `aliases` key in `config/app.php`.

```php
    'aliases' => [
        // ...
        'SphinxSearch' => 'euclid1990\PhpSphinxSearch\Facades\SphinxSearch',
    ]
```
for Laravel 5.1+
```php
    'aliases' => [
        // ...
        'SphinxSearch' => euclid1990\PhpSphinxSearch\Facades\SphinxSearch::class,
    ]
```

- If you need to override the default configuration options (server/port), please use the config publish command
```
php artisan config:publish euclid1990/php-sphinx-search
```
- For Laravel 5.4 config:publish does not work. Use the below command instead.
```
php artisan vendor:publish
```


## Usage

#### 1. Common PHP:

Please refer to [demo/run.php](https://github.com/euclid1990/php-sphinx-search/blob/master/demo/run.php) or you can execute this command line:
```
# php demo/run.php
```

```php
require_once __DIR__ . '/../vendor/autoload.php';

use euclid1990\PhpSphinxSearch\SphinxSearch;

$configArr = require __DIR__.'/../config/sphinx_search.php';
$config = ['sphinx_search' => $configArr];
$sphinxSearch = new SphinxSearch(new Illuminate\Config\Repository($config));

$keyword = 'source code';
$matchs = ['title', 'content'];
$table = 'posts';
$columns = ['id', 'title', 'content'];
$offset = 0;
$limit = 10;
$result = $sphinxSearch->search($keyword, $matchs, $table, $columns, $offset, $limit);
echo "Search results for keyword: [$keyword].\n";
print_r($result->toArray());
```

[Click to view Result](https://raw.githubusercontent.com/euclid1990/php-sphinx-search/master/demo/images/common.png)

#### 2. For Laravel

```php
$keywordEnglish = 'source code';
$keywordVietnamse = 'web nhanh mạnh';
$keywordJapanese = '私は です か';

$matchs = ['title', 'content'];
$table = 'posts';
$columns = ['id', 'user_id', 'title', 'content', 'created_at'];

// Facade class method
$resultEnglish = \SphinxSearch::search($keywordEnglish, $matchs, $table);
echo "Search results for English keyword: [$keywordEnglish].\n";
dump($resultEnglish->toArray());

$resultVietnamse = \SphinxSearch::search($keywordVietnamse, $matchs, $table);
echo "Search results for Vietnamese keyword: [$keywordVietnamse].\n";
dump($resultVietnamse->toArray());

$resultJapanese = \SphinxSearch::search($keywordJapanese, $matchs, $table);
echo "Search results for Japanese keyword: [$keywordJapanese].\n";
dump($resultJapanese->toArray());

// Helper
sphinx_search($keyword, $matchs, $table, $columns);

// Raw Query
$query = "SELECT id FROM posts WHERE MATCH('(@(title,content) source code)') LIMIT 1, 2";
sphinx_raw($query);

// Get sphinxQL
$sphinxQL = sphinx_ql();
$sphinxQL->select()->from($table)->execute();

// Get sphinxApi
$keyword = 'the source';
$tables = 'posts'
$resultApi = sphinx_api()->setMatchMode(SPH_MATCH_ANY)
                ->setFilter('category', [3])
                    ->query($keyword, $table);
```

[Click to view Result](https://raw.githubusercontent.com/euclid1990/php-sphinx-search/master/demo/images/preview.png)

## Reference

#### Document

[Packagist](https://packagist.org/packages/euclid1990/php-sphinx-search)

[Sphinx Search Document](http://sphinxsearch.com/docs/)

[Sphinx Charset Table CJKV](http://sphinxsearch.com/wiki/doku.php?id=charset_tables)

[How To Install and Configure Sphinx on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-sphinx-on-ubuntu-14-04)

#### Database

###### Just for testing purposes
```mysql
mysql -u{username} -p{password} {database} < php-sphinx-search/demo/blog.sql
```

#### Sphinx

###### Download
- [Release Repository](http://sphinxsearch.com/downloads/release/)
- In this tutorial, I've used Ubuntu 12.04 LTS x86_64 DEB.
```
sudo dpkg -i sphinxsearch_2.2.10-release-0ubuntu12-precise_amd64.deb
```
- If have errors:
```
Package libodbc1 is not installed.
Package unixodbc is not installed.
Package libpq5 is not installed.
```
Run below command:
```
sudo apt-get install mysql-client unixodbc libpq5 libltdl7 odbcinst1debian2 libodbc1 odbcinst
```

###### Config
- After install completed, We have directory: `/etc/sphinxsearch`. Please modify `php-sphinx-search/demo/sphinx.conf` before running followings command:
```
sudo cp php-sphinx-search/demo/sphinx.conf /etc/sphinxsearch/sphinx.conf
cd /etc/sphinxsearch
sudo mkdir data
sudo chmod -R 777 data
```
- Must learn about config params:

[Attributes](http://sphinxsearch.com/docs/current.html#attributes)

[Full-text fields](http://sphinxsearch.com/docs/current.html#fields)

- For indexing and re-indexing full-text indexes. By default, Sphinx reads the configuration file at /etc/sphinxsearch/sphinx.conf.
```
sudo indexer --all
```
Or
```
sudo indexer --all --rotate
```
[Indexer](https://raw.githubusercontent.com/euclid1990/php-sphinx-search/master/demo/images/indexer.png)

- Start sphinx service
```
sudo vim /etc/default/sphinxsearch
```
Change `"START=yes"`.
Finally, start the Sphinx daemon:
```
sudo service sphinxsearch start
```
Or
```
sudo searchd
```
[Searchd](https://raw.githubusercontent.com/euclid1990/php-sphinx-search/master/demo/images/searchd.png)

- Check Sphinx is listening port 9306:
```
netstat -anp | grep LIST
```

- Connect with mysql client:
```
mysql -h0 -P9306
```
[Connect via MySQL Client](https://raw.githubusercontent.com/euclid1990/php-sphinx-search/master/demo/images/connect_via_mysql_client.png)
