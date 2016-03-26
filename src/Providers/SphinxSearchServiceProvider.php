<?php

namespace euclid1990\PhpSphinxSearch\Providers;

use Illuminate\Support\ServiceProvider;
use euclid1990\PhpSphinxSearch\SphinxSearch;

/**
 * @package \euclid1990\PhpSphinxSearch
 */
class SphinxSearchServiceProvider extends ServiceProvider {

    /**
     * Boot the service provider.
     *
     * @return null
     */
    public function boot()
    {
        // Publish configuration files
        $this->publishes([
            __DIR__ . '/../../config/sphinx_search.php' => config_path('sphinx_search.php')
        ], 'config');
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        // Merge configs
        $this->mergeConfigFrom(
            __DIR__.'/../../config/sphinx_search.php', 'sphinx_search'
        );

        // Bind google_suggest
        $this->app->bind('sphinx_search', function($app)
        {
            return new SphinxSearch(
                $app['Illuminate\Config\Repository']
            );
        });
    }
}
