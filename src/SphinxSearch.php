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
use euclid1990\PhpSphinxSearch\SphinxApi;

class SphinxSearch {

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var SphinxApi
     */
    protected $sphinxApi;

    /**
     * @var string
     */
    protected $apiHost = null;

    /**
     * @var string
     */
    protected $apiPort = null;

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
    protected $qlHost = null;

    /**
     * @var string
     */
    protected $qlPort = null;

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
        $this->openSphinxApi();
        $this->openSphinxQL();
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
     * Open a connection to sphinxApi
     *
     * @return void
     */
    protected function openSphinxApi()
    {
        if (!is_null($this->apiHost) && !is_null($this->apiPort)) {
            $this->sphinxApi = new SphinxApi();
            $this->sphinxApi->setServer($this->apiHost, $this->apiPort);
        }
    }

    /**
     * Open a connection to sphinxQL
     *
     * @return void
     */
    protected function openSphinxQL()
    {
        if (!is_null($this->qlHost) && !is_null($this->qlPort)) {
            $this->connection = new Connection();
            $this->connection->setParams(['host' => $this->qlHost, 'port' => $this->qlPort]);
            $this->sphinxQL = new SphinxQL($this->connection);
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

    /**
     * Create a new sphinx client api instance
     *
     * @return SphinxApi
     */
    public function sphinxApi()
    {
        return $this->sphinxApi;
    }
}