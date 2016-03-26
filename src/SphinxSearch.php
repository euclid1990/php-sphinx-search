<?php

/**
 * PHP Sphinx search tool.
 * An external solution for database fulltext search.
 *
 * @author euclid1990
 */
namespace euclid1990\PhpSphinxSearch;

use Exception;
use Foolz\SphinxQL\SphinxQL;
use Foolz\SphinxQL\Connection;
use Illuminate\Config\Repository;
use Illuminate\Support\Collection;

class SphinxSearch {

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var SphinxQL
     */
    protected $sphinxQL;

    /**
     * @var Connection
     */
    protected $connection;

    /**
     * @var string
     */
    protected $host;

    /**
     * @var string
     */
    protected $port;

    /**
     * @var int
     */
    protected $limit = null;

    /**
     * Constructor
     *
     * @param Repository $config
     */
    function __construct(Repository $config)
    {
        $this->config = $config;
        $this->configure();
        $this->connection = new Connection();
        $this->connection->setParams(['host' => $this->host, 'port' => $this->port]);
        $this->sphinxQL = new SphinxQL($this->connection);
    }

    /**
     * Get camel case string
     *
     * @param  string  $word
     * @return string
     */
    public function camel($word)
    {
        return lcfirst(str_replace(' ', '', ucwords(strtr($word, '_-', '  '))));
    }

    /**
     * Init configuration
     *
     * @return void
     */
    protected function configure()
    {
        if ($this->config->has('sphinx_search')) {
            foreach($this->config->get('sphinx_search') as $key => $val) {
                $key = $this->camel($key);
                $this->{$key} = $val;
            }
        }
    }

    /**
     * Search keyword/sentence string.
     *
     * @param  string  $keyword
     * @param  array   $matchs
     * @param  string  $table
     * @param  array   $columns
     * @param  int     $offset
     * @param  int     $limit
     * @return Collection
     */
    public function search($keyword, $matchs = [], $table, $columns = ['*'], $offset = null, $limit = null)
    {
        if (empty($matchs)) {
            throw new Exception('Missing argument $matchs type array.');
        }

        if (!is_null($this->limit) && is_null($limit)) {
            $limit = $this->limit;
        }

        try {
            $result = $this->sphinxQL->select($columns)
                        ->from($table)
                            ->match($matchs, $keyword);
            if (!is_null($offset) & !is_null($limit)) {
                $result = $result->limit($offset, $limit);
            } elseif (!is_null($offset)) {
                $result = $result->offset($offset);
            } elseif (!is_null($limit)) {
                $result = $result->limit($limit);
            }
            $result = $result->execute();
        } catch (Exception $e) {
            throw $e;
        }
        return new Collection($result);
    }

    /**
     * Execute raw query
     *
     * @param string $query
     * @return Collection
     */
    public function raw($query)
    {
        if (empty($query)) {
            return new Collection([]);
        }

        $result = $this->sphinxQL->query($query)->execute();
        return new Collection($result);
    }

    /**
     * Create a new sphinx query language instance
     *
     * @return SphinxQL
     */
    public function sphinxQL()
    {
        return $this->sphinxQL;
    }
}