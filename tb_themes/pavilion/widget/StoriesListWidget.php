<?php

class Theme_StoriesListWidget extends TB_Widget
{
    protected $areas = array('footer', 'intro', 'content', 'column_left', 'column_right');

    public function onFilter(array &$settings)
    {
        $settings = array_replace($settings, $this->initLangVars(array(
            'is_active'   => 1,
            'title'       => 'Stories Listing',
            'title_align' => 'left',
            'filter_tags' => ''
        ), $settings));

        $settings = array_replace($settings, $this->initFlatVars(array(
            'filter_list_type'    => 'latest',
            'filter_randomize'    => 0,
            'filter_limit'        => 4,
            'filter_sticky_first' => 0,
            'show_thumb'          => 1,
            'show_text'           => 1,
            'show_tags'           => 1,
            'show_date'           => 1,
            'show_comments'       => 1,
            'image_size_x'        => 80,
            'image_size_y'        => 80,
            'text_limit'          => 100,
            'slider'              => 0,
            'slider_step'         => 1,
            'slider_speed'        => 500,
            'slider_pagination'   => 0,
            'slider_nav_position' => 'top',
            'slider_autoplay'     => 0
        ), $settings));
    }

    public function onEdit(array &$settings)
    {
        foreach ($this->getOcModel('localisation/language')->getLanguages() as $language) {
            $tags = $this->getOcModel('stories/tag')->getAll(array('language_id' => $language['language_id']));

            $tags_names = array();
            foreach ($tags as $tag) {
                $tags_names[] = $tag['name'];
            }

            $settings['lang'][$language['language_id']]['tags_names'] = '"' . implode('","', $tags_names) . '"';
        }
    }

    public function initFrontend()
    {
        $this->manager->getEventDispatcher()->connect('core:assignAssets', array($this, 'assignAssets'));
    }

    public function assignAssets()
    {
        $main_settings = $this->manager->getOcConfig()->get('stories_settings');

        if ($this->settings['slider']) {
            $this->themeData->registerJavascriptResource('swiper.min.js');
        }

        if ($this->settings['show_comments'] && $main_settings['comments'] == 'disqus') {
            $this->manager->getThemeExtension()->addJsContents('<script type="text/javascript">
            var disqus_shortname = \'' . $main_settings['disqus_shortname'] . '\';
            (function () {
            var s = document.createElement(\'script\'); s.async = true;
            s.type = \'text/javascript\';
            s.src = \'//\' + disqus_shortname + \'.disqus.com/count.js\';
            (document.getElementsByTagName(\'HEAD\')[0] || document.getElementsByTagName(\'BODY\')[0]).appendChild(s);
            }());
            </script>', 'disqus_show_comments');
        }
    }

    public function render(array $view_data = array())
    {
        $stories = $this->getStoryListing();

        if (!$stories) {
            return '';
        }

        $view_data['main_settings'] = $this->manager->getOcConfig()->get('stories_settings');
        $view_data['slider']        = $this->settings['slider'];
        $view_data['slider_step']   = $this->settings['slider_step'];
        $view_data['stories']       = $stories;

        return parent::render($view_data);
    }

    protected function getStoryListing()
    {
        $options = array();
        if ($this->settings['filter_list_type'] == 'popular') {
            $options['sort'] = 's.views DESC';
        }

        if ($this->settings['filter_sticky_first']) {
            $options['filter_sticky_first'] = true;
        }

        $options['start'] = 0;
        $options['limit'] = $this->settings['filter_limit'];

        $stories = $this->getOcModel('stories/index')->getStories($options);

        foreach ($stories as &$story) {
            if (!empty($story['teaser'])) {
                $description = strip_tags(html_entity_decode($story['teaser'], ENT_COMPAT, 'UTF-8'));
                $description = strlen($description) > $this->settings['text_limit'] ? substr($description, 0, $this->settings['text_limit']) . '...' : $description;
            } else {
                $description = strip_tags(html_entity_decode($story['description'], ENT_COMPAT, 'UTF-8'));
                $description = strlen($description) > $this->settings['text_limit'] ? substr($description, 0, $this->settings['text_limit']) . '...' : $description;
            }
            $story['description'] = $description;

            $story['thumb'] = '';
            if ($story['image']) {
                $story['thumb'] = $this->getOcModel('stories/index')->resizeImageAdvanced($story['image'], $this->settings['image_size_x'], $this->settings['image_size_y'], 'crop');
                $story['thumb_width'] = $this->settings['image_size_x'];
                $story['thumb_height'] = $this->settings['image_size_y'];
            }

            $tags = array();
            if (trim($story['tags'])) {
                foreach (explode('!*!', $story['tags']) as $tag) {
                    list($name, $tag_id) = explode('<=>', $tag);
                    $tags[] = array(
                        'name' => $name,
                        'url'   => $this->manager->getOcUrl()->link('stories/tag', 'story_tag_id=' . $tag_id)
                    );
                }
            }

            $default_lang = $this->manager->loadOcTranslation();

            $story['date_added'] = date($default_lang['date_format_short'], strtotime($story['date_added']));
            $story['date_month'] = date('M');
            $story['date_year']  = date('Y');
            $story['date_day']   = date('d');
            $story['tags']       = $tags;
            $story['url']        = $this->manager->getOcUrl()->link('stories/show', 'story_id=' . $story['story_id']);
        }

        if (!$this->settings['filter_sticky_first'] && $this->settings['filter_randomize']) {
            shuffle($stories);
        }

        return $stories;
    }

    protected function getDefaultFonts()
    {
        return array(
            'title' => array(
                'section_name'      => 'Block Title',
                'elements'          => ' h2',
                'type'              => '',
                'family'            => 'inherit',
                'subsets'           => '',
                'variant'           => '',
                'size'              => 18,
                'line-height'       => 20,
                'letter-spacing'    => 0,
                'word-spacing'      => 0,
                'transform'         => 'none',
                'has_size'          => true,
                'has_line_height'   => true,
                'has_spacing'       => true,
                'has_effects'       => true,
                'show_built_styles' => true,
                'multiple_variants' => false,
                'built-in'          => true,
                'can_inherit'       => true,
                'css_weight'        => '',
                'css_style'         => ''
            ),
            'article_title' => array(
                'section_name'      => 'Article Title',
                'elements'          => '.tb_item h3',
                'type'              => '',
                'family'            => 'inherit',
                'subsets'           => '',
                'variant'           => '',
                'size'              => 13,
                'line-height'       => 20,
                'letter-spacing'    => 0,
                'word-spacing'      => 0,
                'transform'         => '',
                'has_size'          => true,
                'has_line_height'   => true,
                'has_spacing'       => false,
                'has_effects'       => false,
                'show_built_styles' => false,
                'multiple_variants' => true,
                'built-in'          => true,
                'can_inherit'       => true,
                'css_weight'        => '',
                'css_style'         => ''
            ),
        );
    }

    public function getDefaultColors()
    {
        $default_colors = array(
            'body' => array(
                '_label' => '',
                'title' => array(
                    'label'       => 'Block Title',
                    'elements'    => 'h2',
                    'property'    => 'color',
                    'color'       => '#333333',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.titles'
                ),
                'links' => array(
                    'label'       => 'Article title',
                    'elements'    => 'h3 a',
                    'property'    => 'color',
                    'color'       => '#333333',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.links'
                ),
                'links_hover' => array(
                    'label'       => 'Article title (hover)',
                    'elements'    => 'h3 a:hover',
                    'property'    => 'color',
                    'color'       => '#b92616',
                    'important'   => 0,
                    'force_print' => 1,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.links_hover'
                ),
                'text' => array(
                    'label'       => 'Summary',
                    'elements'    => '.tb_description',
                    'property'    => 'color',
                    'color'       => '#333333',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.text'
                ),
                'meta_text' => array(
                    'label'       => 'Meta text',
                    'elements'    => '.tb_meta',
                    'property'    => 'color',
                    'color'       => '#333333',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.text'
                ),
                'meta_links' => array(
                    'label'       => 'Meta links',
                    'elements'    => '.tb_meta a',
                    'property'    => 'color',
                    'color'       => '#333333',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.links'
                ),
                'meta_links_hover' => array(
                    'label'       => 'Meta links (hover)',
                    'elements'    => '.tb_meta a:hover',
                    'property'    => 'color',
                    'color'       => '#b92616',
                    'important'   => 0,
                    'force_print' => 1,
                    'can_inherit' => 1,
                    'inherit'     => 1,
                    'inherit_key' => 'row:body.links_hover'
                ),
                'meta_icons' => array(
                    'label'       => 'Meta icons',
                    'elements'    => '.tb_meta .fa',
                    'property'    => 'color',
                    'color'       => '#cccccc',
                    'important'   => 0,
                    'force_print' => 0,
                    'can_inherit' => 0,
                    'inherit'     => 0,
                    'inherit_key' => ''
                )
            )
        );

        if (method_exists($this, 'getAdditionalColors')) {
            $default_colors = array_merge($default_colors, $this->getAdditionalColors());
        }

        return $default_colors;
    }

}