<?php

namespace euclid1990\PhpSphinxSearch\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @package \euclid1990\PhpSphinxSearch
 */
class SphinxSearch extends Facade {

    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
    	return 'sphinx_search';
    }
}