<?php

if (!function_exists('dd'))
{
    /**
     * Dump the passed variables and end the script.
     *
     * @param  mixed
     * @return void
     */
    function dd($x, $die = true)
    {
        array_map(function($x) { dump($x); }, func_get_args());
        if ($die) {
            die;
        }
    }
}

if (!function_exists('sphinx_search')) {
    /**
     * Perform search indexed data
     *
     * @param  string  $keyword
     * @param  array   $matchs
     * @param  string  $table
     * @param  array   $columns
     * @param  int     $offset
     * @param  int     $limit
     * @return mixed
     */
    function sphinx_search($keyword, $matchs, $table, $columns = ['*'], $offset = null, $limit = null)
    {
        return app('sphinx_search')->search($keyword, $matchs, $table, $columns, $offset, $limit);
    }
}

if (!function_exists('sphinx_raw')) {
    /**
     * Execute raw query
     *
     * @param  string  $query
     * @return mixed
     */
    function sphinx_raw($query)
    {
        return app('sphinx_search')->raw($query);
    }
}

if (!function_exists('sphinx_ql')) {
    /**
     * Get sphinxQL
     *
     * @return mixed
     */
    function sphinx_ql()
    {
        return app('sphinx_search')->sphinxQL();
    }
}