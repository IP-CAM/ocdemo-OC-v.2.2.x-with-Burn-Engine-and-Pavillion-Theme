<?php

class TB_ExtensionPluginBootstrap
{
    /**
     * @var TB_Extension
     */
    protected $extension;

    /**
     * @var TB_ThemeManager
     */
    protected $manager;

    /**
     * @var bool
     */
    protected $initialized;

    /**
     * @var bool
     */
    protected $booted;

    /**
     * @var TB_ExtensionPlugin[] Loaded plugin instances
     */
    protected $plugins;

    /**
     * @var array Plugins that have been run
     */
    protected $run;

    /**
     * @var array Plugins that have been started but not yet completed (circular dependency detection)
     */
    protected $started;

    /**
     * @var TB_Context
     */
    protected $context;

    /**
     * @var sfEventDispatcher
     */
    protected $eventDispatcher;

    /**
     * @var TB_DataBag
     */
    protected $tbData;

    public function __construct(TB_ThemeManager $manager, TB_Extension $extension)
    {
        $this->manager         = $manager;
        $this->extension       = $extension;
        $this->context         = $manager->getContext();
        $this->eventDispatcher = $manager->getEventDispatcher();
        $this->themeData       = $manager->getThemeData();

        $this->booted      = false;
        $this->initialized = false;
        $this->plugins     = array();
        $this->run         = array();
        $this->started     = array();
    }

    /**
     * @return array|TB_ExtensionPlugin[]
     * @throws Exception
     */
    public function getPlugins()
    {
        if (!$this->initialized) {
            throw new Exception('ExtensionPluginBootstrap: the plugins have not been initialized');
        }

        return $this->plugins;
    }

    /**
     * @param $plugin_name
     * @return TB_ExtensionPlugin
     * @throws Exception
     */
    public function getPlugin($plugin_name)
    {
        $plugin_name = TB_Utils::camelize($plugin_name);

        if (!in_array($plugin_name, $this->run)) {
            throw new Exception('ExtensionPluginBootstrap: the plugin ' . $plugin_name . ' has not been initialized: ' . get_class($this));
        }

        return $this->plugins[$plugin_name];
    }

    public function bootstrap($plugin_name)
    {
        $plugin_name = TB_Utils::camelize($plugin_name);

        if (in_array($plugin_name, $this->run)) {
            return;
        }

        if (isset($this->started[$plugin_name]) && $this->started[$plugin_name]) {
            throw new Exception('Circular resource dependency detected');
        }

        $this->loadPlugins();
        if (!isset($this->plugins[$plugin_name])) {
            throw new Exception('Extension plugin not found: ' . $plugin_name);
        }

        $this->started[$plugin_name] = true;
        /** @var $plugin TB_ExtensionPlugin */
        $plugin = $this->plugins[$plugin_name];
        $plugin->execute($this->themeData, $this->manager->getOcRequest());
        unset($this->started[$plugin_name]);
        if (!in_array($plugin_name, $this->run)) {
            $this->run[] = $plugin_name;
        }
    }

    public function configureAll()
    {
        if ($this->initialized) {
            throw new Exception('ExtensionPluginBootstrap already initialized: ' . get_class($this));
        }

        $this->loadPlugins();
        foreach ($this->plugins as $plugin) {
            /** @var $plugin TB_ExtensionPlugin */
            $plugin->configure($this->themeData);
        }

        $this->initialized = true;
    }

    public function bootstrapAll()
    {
        if (!$this->initialized) {
            throw new Exception('You must first initialize the plugins before bootstraping them: ' . get_class($this));
        }

        if ($this->booted) {
            throw new Exception('ExtensionPluginBootstrap already booted: ' . get_class($this));
        }

        foreach ($this->plugins as $plugin) {
            /** @var $plugin TB_ExtensionPlugin */
            $this->bootstrap($plugin->getName());
        }

        $this->booted = true;
    }

    protected function loadPlugins()
    {
        if (!empty($this->plugins)) {
            return;
        }

        $plugins_dir = $this->extension->getAreaDir() . '/plugin';
        $files = sfFinder::type('file')->maxdepth(0)->in($plugins_dir);
        $plugins = array();

        foreach ($files as $file) {

            if (!defined('TB_CLASS_CACHE')) {
                require tb_modification($file);
            }

            $fileinfo = pathinfo($file);
            $filename = $fileinfo['filename'];
            $area     = ucfirst($this->context->getArea());

            if ($this->extension->isThemeExtension()) {
                $classname = 'Theme_' . $area . '_' . $filename;
            }    else {
                $classname = $this->extension->getName() . '_' . $area . '_' . $filename;
            }

            if (!class_exists($classname)) {
                throw new Exception('The class cannot be found: ' . $classname);
            }

            if (!is_subclass_of($classname, 'TB_ExtensionPlugin')) {
                throw new Exception('The class ' . $classname . ' is not subclass of TB_ExtensionPlugin');
            }

            $plugin = new $classname($this, $this->extension, $this->manager);
            /** @var $plugin TB_ExtensionPlugin */
            $plugin->setName(substr_replace($filename, '', -6, 6)); // Remove 'Plugin' from the end
            $plugins[$plugin->getInitOrder() . '-' . TB_Utils::genRandomString()] = $plugin;
        }

        if (!empty($plugins)) {
            ksort($plugins);
            foreach ($plugins as $plugin) {
                $this->plugins[$plugin->getName()] = $plugin;
            }
        }
    }
}