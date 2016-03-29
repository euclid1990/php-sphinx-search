<?php

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

echo "\n============================================================\n";

// Using SphinxApi Client
$keyword = 'project source';
$result = $sphinxSearch->sphinxApi()
            ->setMatchMode(SPH_MATCH_ANY)
                ->setFilter('category', [1, 3])
                    ->query($keyword, $table);
echo "Search results match any for keyword: [$keyword].\n";
print_r($result);