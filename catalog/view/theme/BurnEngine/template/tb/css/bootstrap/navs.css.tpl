.nav,
.dropdown.tb_hovered > .nav.dropdown-menu
{
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -ms-flex-wrap: wrap;
  -webkit-flex-wrap: wrap;
  flex-wrap: wrap;
}
.dropdown > .nav.dropdown-menu {
  display: none;
}
.nav > li,
.nav > li > a
{
  -webkit-transition: color 0.4s, background-color 0.4s, border 0.4s;
          transition: color 0.4s, background-color 0.4s, border 0.4s;
}
.nav > li {
  position: relative;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -ms-flex: 0 0 auto;
  -webkit-flex: 0 0 auto;
  flex: 0 0 auto;
  vertical-align: top;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  outline: none !important;
}
.nav > li:before {
  display: inline-block;
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: 0 !important;
  <?php else: ?>
  margin-right: 0 !important;
  <?php endif; ?>
  text-align: center;
  vertical-align: top;
}
.nav > li:last-child {
  margin-left: 0;
  margin-right: 0;
}
.nav > li > a {
  position: relative;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
}
.nav > li > a > img {
  -ms-flex-item-align: center;
  -webkit-align-self: center;
  align-self: center;
}

.nav .tb_megamenu > .dropdown-menu .row-wrap > .row > [class*="col-"]:first-child {
  border-radius: 3px 0 0 3px;
}
.nav .tb_megamenu > .dropdown-menu .row-wrap > .row > [class*="col-"]:last-child {
  border-radius: 0 3px 3px 0;
}
.nav .tb_megamenu > .dropdown-menu .tb_separate_columns > .row {
  margin: 0 !important;
}
.nav .tb_megamenu > .nav .row-wrap {
  max-height: none !important;
}
.nav .tb_megamenu .tb_listing > li > ul {
  margin-bottom: 0;
}
.nav .tb_accent_label {
  position: absolute;
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: -13px;
  <?php else: ?>
  margin-right: -13px;
  <?php endif; ?>
  height: 12px;
  padding: 0 3px;
  line-height: 13px;
  white-space: nowrap;
  font-size: 8px;
  font-weight: bold;
  font-family: Arial;
}
.nav .tb_accent_label {
  top: 0;
  margin-top: -12px;
}
.nav > li.dropdown > a > .tb_accent_label {
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: -20px;
  <?php else: ?>
  margin-right: -20px;
  <?php endif; ?>
}
.nav .dropdown-menu .tb_accent_label {
  top: 50%;
  margin-top: -12px;
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: 4px;
  <?php else: ?>
  margin-right: 4px;
  <?php endif; ?>
}

/*** Horizontal navigation ***/

.nav-horizontal > li:before {
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: 0 !important;
  border-right: 0 none !important;
  <?php else: ?>
  margin-right: 0 !important;
  border-left: 0 none !important;
  <?php endif; ?>
}
.nav-horizontal > li:first-child:before {
  content: '' !important;
}
.nav-horizontal > .dropdown:after {
  <?php if ($lang_dir == 'ltr'): ?>
  right: auto !important;
  <?php else: ?>
  left: auto !important;
  <?php endif; ?>
}
.nav-justified > .dropdown:after {
  left: 50% !important;
  right: auto !important;
  margin-left: -5px !important;
  margin-right: 0 !important;
}
.nav-horizontal > .divider {
  border-right-width: 1px;
  border-right-style: solid;
}
.tb_pl_0 > nav > .nav-horizontal > li:first-child,
.tb_pl_0 > nav > .nav-horizontal > li:first-child > a
{
  border-top-left-radius: inherit;
  border-bottom-left-radius: inherit;
}

/*** Stacked (vertical) navigation ***/

.nav-stacked > li {
  width: 100%;
  display: block;
  margin-left: 0;
  margin-right: 0;
}
.nav-stacked > li.divider {
  border-bottom-width: 1px;
  border-bottom-style: solid;
}
.tb_pt_0 > nav > .nav-stacked > li:first-child,
.tb_pt_0 > nav > .nav-stacked > li:first-child > a
{
  border-top-left-radius: inherit;
  border-top-right-radius: inherit;
}
.tb_pb_0 > nav > .nav-stacked > li:last-child,
.tb_pb_0 > nav > .nav-stacked > li:last-child > a
{
  border-bottom-left-radius: inherit;
  border-bottom-right-radius: inherit;
}

/*** Justified navigation ***/

.nav.nav-justified > li:not(.divider) {
      -ms-flex: 1 0 auto;
  -webkit-flex: 1 0 auto;
          flex: 1 0 auto;
}
.nav.nav-justified > li > a {
      -ms-flex: 1 0 auto;
  -webkit-flex: 1 0 auto;
          flex: 1 0 auto;
  text-align: center;
            -ms-flex-pack: center;
  -webkit-justify-content: center;
          justify-content: center;
}
.nav.nav-justified:before,
.nav.nav-justified:after
{
  content: none !important;
}
@media only screen and (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  .nav.nav-justified.nav-responsive > li > a {
              -ms-flex-pack: start;
    -webkit-justify-content: flex-start;
            justify-content: flex-start;
  }
}

/*** Tabs ***/

.nav-tabs {
  -ms-flex: 1 0 100%;
  -webkit-flex: 1 0 100%;
  flex: 1 0 100%;
}
.nav-tabs:before {
  display: flex;
}
.nav-tabs > li {
  position: relative;
  z-index: 30;
  vertical-align: top;
}
.nav-tabs > li:hover,
.nav-tabs > li.tb_hovered
{
  z-index: 31;
  margin: 0;
  padding: 0;
}
.nav-tabs > li.active,
.nav-tabs > li.ui-state-active
{
  z-index: 32;
}
.nav-tabs > li > a {
  display: block;
  float: left;
  width: 100%;
  outline: none;
}
.nav-tabs > li > a:not([class*="tb_pl"]) {
  padding-left: 20px;
  padding-right: 20px;
}
.nav-tabs:not(.tb_style_2) > li > a {
  color: inherit !important;
}
.nav-tabs > li > a span.tb_icon {
  width: 1em;
  text-align: center;
}
.nav-tabs > li > a span.tb_icon:last-child,
.nav-tabs > li > a span.tb_icon:last-child:before
{
  margin-left: 0;
  margin-right: 0;
}
.nav-tabs > li.dropdown:not(.active):after,
.nav-tabs > li.dropdown:not(.active) > .dropdown-menu
{
  top: calc(100% + 1px);
}
.tab-content {
  clear: both;
  -ms-flex: 1 0 100%;
  -webkit-flex: 1 0 100%;
  flex: 1 0 100%;
  /* float: left;
  width: 100%; */
  min-width: 0;
}
.tab-content.tb_loading {
  position: relative;
}
.tab-content > span.tb_title {
  display: none;
}
.tab-content > div {
  display: none;
  overflow: visible !important;
}
.tab-content > .tab-pane {
  display: none;
}
.tab-content > .active {
  display: block;
}
.tab-content > div:first-child:not(.tab-pane),
.tab-content > span.tb_title:first-child + div
{
  display: block;
}
.tab-content [class*="tb_widget"]:last-child:not([class*="tb_mb_-"]) {
  margin-bottom: 0;
}

/*** Vertical Tabs ***/

.nav-tabs.vtabs {
  clear: both;
  -ms-flex: 0 0 0px;
  -webkit-flex: 0 0 0px;
          flex: 0 0 0px;
}
.nav-tabs.vtabs,
.nav-tabs.vtabs ~ .tab-content
{
  display: block;
  float: none;
  direction: <?php echo $lang_dir; ?>;
}
.nav-tabs.vtabs ~ .tab-content {
  width: 100%;
  -ms-flex: 1 1 0px;
  -webkit-flex: 1 1 0px;
          flex: 1 1 0px;
}
.nav-tabs.vtabs {
  text-align: inherit !important;
  vertical-align: top;
  border-bottom: 0;
}
.nav-tabs.vtabs > li,
.nav-tabs.vtabs > li > a
{
  display: block !important;
  height: auto !important;
}
.nav-tabs.vtabs > li {
  display: block;
  float: none !important;
}
.nav-tabs.vtabs > li > a {
  float: none;
  white-space: normal;
}

/*** Tabs align ***/

.nav-tabs-align-start {
  -ms-flex-pack: start;
  -webkit-justify-content: flex-start;
          justify-content: flex-start;
}
.nav-tabs-align-center {
  -ms-flex-pack: center;
  -webkit-justify-content: center;
          justify-content: center;
}

/*** Style 1 ***/

.nav-tabs.tb_style_1:after,
.nav-tabs:not([class*="tb_style_"]):after
{
  content: '';
  clear: both;
  display: table;
}
.nav-tabs.tb_style_1 ~ .tab-content,
.nav-tabs.tb_style_1 > li,
.nav-tabs:not([class*="tb_style_"]) ~ .tab-content,
.nav-tabs:not([class*="tb_style_"]) > li
{
  border-width: 1px;
  border-style: solid;
  border-color: transparent;
}
.nav-tabs.tb_style_1 > li,
.nav-tabs:not([class*="tb_style_"]) > li
{
  display: block;
  <?php if ($lang_dir == 'ltr'): ?>
  float: left;
  <?php else: ?>
  float: right;
  <?php endif; ?>
}
.nav-tabs.tb_style_1 > li > a,
.nav-tabs:not([class*="tb_style_"]) > li > a
{
  padding-top: <?php echo $base * 0.5 - 1; ?>px;
  padding-bottom: <?php echo $base * 0.5 - 1; ?>px;
  -webkit-transition: color 0.2s ease-in-out;
  transition: color 0.2s ease-in-out;
}

/*** Style 1 horizontal ***/

.nav-tabs.htabs.tb_style_1,
.nav-tabs:not([class*="tb_style_"])
{
  border-top-left-radius: inherit;
  border-top-right-radius: inherit;
}
.nav-tabs.htabs:not(.tb_style_3),
.nav-tabs:not([class*="tb_style_"])
{
  border-bottom-width: 1px;
  border-bottom-style: solid;
}
/*
.nav-tabs.htabs.tb_style_1:not(.ui-widget-header) {
  border-bottom-color: transparent;
}
*/
.nav-tabs.htabs.tb_style_1 > li,
.nav-tabs:not([class*="tb_style_"]) > li
{
  <?php if ($lang_dir == 'ltr'): ?>
  margin-right: -1px;
  <?php else: ?>
  margin-left: -1px;
  <?php endif; ?>
  border-bottom: 0 none;
}
.nav-tabs.htabs.tb_style_1 > li:first-child,
.nav-tabs:not([class*="tb_style_"]) > li:first-child
{
  border-top-left-radius: inherit;
}
.nav-tabs.htabs.tb_style_1 > li:last-child,
.nav-tabs:not([class*="tb_style_"]) > li:last-child
{
  <?php if ($lang_dir == 'ltr'): ?>
  margin-right: 0;
  <?php else: ?>
  margin-left: 0;
  <?php endif; ?>
}
.nav-tabs.htabs.nav-justified.tb_style_1 > li:last-child,
.nav-tabs.nav-justified:not([class*="tb_style_"]) > li:last-child
{
  border-top-right-radius: inherit;
}
.nav-tabs.htabs.tb_style_1 > li.active,
.nav-tabs:not([class*="tb_style_"]) > li.active,
.nav-tabs.htabs.tb_style_1 > li.ui-tabs-active
{
  margin-bottom: -1px;
  padding-bottom: 1px;
}
.nav-tabs.htabs.tb_style_1 ~ .tab-content,
.nav-tabs:not([class*="tb_style_"]) ~ .tab-content
{
  border-top: 0 none;
  border-bottom-left-radius: inherit;
  border-bottom-right-radius: inherit;
}

/*** Style 1 vertical ***/

.tabs-right > .nav-tabs.vtabs.tb_style_1 {
  border-left-width: 1px;
  border-left-style: solid;
  border-top-right-radius: inherit;
  border-bottom-right-radius: inherit;
}
.tabs-left > .nav-tabs.vtabs.tb_style_1 {
  border-right-width: 1px;
  border-right-style: solid;
  border-top-left-radius: inherit;
  border-bottom-left-radius: inherit;
}
/*
.tabs-right > .nav-tabs.vtabs.tb_style_1:not(.ui-widget-header),
.tabs-left  > .nav-tabs.vtabs.tb_style_1:not(.ui-widget-header)
{
  border-left-color: transparent;
  border-right-color: transparent;
}
*/
.tabs-right > .nav-tabs.vtabs.tb_style_1 ~ .tab-content {
  border-right: 0 none;
  border-top-left-radius: inherit;
  border-bottom-left-radius: inherit;
}
.tabs-left  > .nav-tabs.vtabs.tb_style_1 ~ .tab-content {
  border-left: 0 none;
  border-top-right-radius: inherit;
  border-bottom-right-radius: inherit;
}
.nav-tabs.vtabs.tb_style_1 > li {
  float: none;
  margin-top: -1px;
}
.nav-tabs.vtabs.tb_style_1 > li:first-child {
  margin-top: 0;
}
.nav-tabs.vtabs.tb_style_1 > li > a {
  padding-top: <?php echo $base * 0.5; ?>px;
}
.nav-tabs.vtabs.tb_style_1 > li:first-child > a {
  padding-top: <?php echo $base * 0.5 - 1; ?>px;
}
.tabs-left  > .nav-tabs.vtabs.tb_style_1 > li {
  border-right: none !important;
}
.tabs-right > .nav-tabs.vtabs.tb_style_1 > li {
  border-left: none !important;
}
.tabs-left  > .nav-tabs.vtabs.tb_style_1 > li:first-child {
  border-top-left-radius: inherit;
}
.tabs-right > .nav-tabs.vtabs.tb_style_1 > li:first-child {
  border-top-right-radius: inherit;
}
.tabs-left  > .nav-tabs.vtabs.tb_style_1 > li.active,
.tabs-left  > .nav-tabs.vtabs.tb_style_1 > li.ui-tabs-active
{
  margin-right: -1px;
  padding-right: 1px;
}
.tabs-right > .nav-tabs.vtabs.tb_style_1 > li.active,
.tabs-right > .nav-tabs.vtabs.tb_style_1 > li.ui-tabs-active
{
  margin-left: -1px;
  padding-left: 1px;
}

/*** Style 2 ***/

.nav-tabs.tb_style_2,
.nav-tabs.tb_style_2 > li,
.nav-tabs.tb_style_2 > li > a
{
  background-color: transparent !important;
  border-color: transparent !important;
}
.nav-tabs.tb_style_2 {
  border-color: transparent !important;
}
.nav-tabs.tb_style_2 > li,
.nav-tabs.tb_style_2 > li > a
{
  display: inline-block;
  float: none;
  vertical-align: top;
}
.nav-tabs.tb_style_2 > li {
  white-space: nowrap;
}
.nav-tabs.tb_style_2 > li:first-child > a {
  <?php if ($lang_dir == 'ltr'): ?>
  padding-left: 0 !important;
  <?php else: ?>
  padding-right: 0 !important;
  <?php endif; ?>
}
.nav-tabs.tb_style_2 > li:last-child > a {
  <?php if ($lang_dir == 'ltr'): ?>
  padding-right: 0 !important;
  <?php else: ?>
  padding-left: 0 !important;
  <?php endif; ?>
}
#wrapper .nav-tabs.tb_style_2 > li,
#wrapper .nav-tabs.tb_style_2 > li:hover,
#wrapper .nav-tabs.tb_style_2 > li.active,
#wrapper .nav-tabs.tb_style_2 > li.ui-state-hover,
#wrapper .nav-tabs.tb_style_2 > li.ui-state-active
{
  color: inherit !important;
}
.nav-tabs.tb_style_2 > li:first-child ~ li:before {
  content: '\00a0/';
  vertical-align: top;
  font-weight: normal;
  font-size: 80%;
  color: inherit;
  opacity: 0.3;
}
.nav-tabs.tb_style_2 ~ .tab-content,
.nav-tabs.tb_style_2 ~ .tab-content > div > .panel-body
{
  padding: 0 !important;
}

.nav-tabs.vtabs.tb_style_2 > li:not(:last-child) {
  margin-bottom: <?php echo $base / 2; ?>px;
}
.nav-tabs.vtabs.tb_style_2 > li > a {
  padding-left: 0 !important;
  padding-right: 0 !important;
}
.nav-tabs.vtabs.tb_style_2 > li:before {
  content: '';
  display: none;
}

/*** Style 3 ***/

.nav-tabs.tb_style_3 {
  border: none !important;
  background: transparent !important;
}
.nav-tabs.tb_style_3 > li {
  border-radius: 2px;
  -webkit-transition: color 0.4s, background-color 0.4s;
  transition: color 0.4s, background-color 0.4s;
}
.nav-tabs.tb_style_3 > li > a {
  padding-top: <?php echo $base * 0.25; ?>px;
  padding-bottom: <?php echo $base * 0.25; ?>px;
}
.panel-heading + .tb_tabs .nav-tabs:not(.vtabs) {
  position: absolute;
  top: 0;
  margin-top: -<?php echo $base * 0.25; ?>px;
}
.panel-heading.text-left + .tb_tabs .nav-tabs:not(.vtabs) {
  right: 0;
}
.panel-heading.text-right + .tb_tabs .nav-tabs:not(.vtabs) {
  left: 0;
}

/*** Style 4 (minimal) ***/

.tb_tabs_minimal .nav.nav-tabs.htabs.tb_style_1 > li {
  border-top-left-radius: inherit;
  border-top-right-radius: inherit;
}
.tb_tabs_minimal .tabs-right > .nav.nav-tabs.vtabs.tb_style_1 > li {
  border-top-right-radius: inherit;
  border-bottom-right-radius: inherit;
}
.tb_tabs_minimal .tabs-left > .nav.nav-tabs.vtabs.tb_style_1 > li {
  border-top-left-radius: inherit;
  border-bottom-left-radius: inherit;
}

/*** Theme wrapper ***/

.tb_tabs,
.tb_tabs:before,
.tb_tabs:after
{
  display: -ms-flexbox !important;
  display: -webkit-flex !important;
  display: flex !important;
  -ms-flex-wrap: wrap;
  -webkit-flex-wrap: wrap;
  flex-wrap: wrap;
  border-radius: inherit;
}
.tb_tabs.tabs-left {
  direction: ltr;
}
.tb_tabs.tabs-right {
  direction: rtl;
}

/*** Margin defaults ***/

.nav:not([class*="tb_mb_"]),
.dropdown.tb_hovered > .nav.dropdown-menu
{
  margin-bottom: 0;
}
.nav-tabs:not([class*="tb_mb_"]) {
  margin-bottom: <?php echo $base; ?>px;
}

/*** Animation ***/

.tbAnimated .tab-pane.in:not(.tb_loading) {
  -webkit-transition-delay: 0.3s;
          transition-delay: 0.3s;
}

/*  -----------------------------------------------------------------------------------------
    M O B I L E   max-width: 767px
-----------------------------------------------------------------------------------------  */

@media only screen and (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {

  /*  Menu  -----------------------------------------------------------------------------  */

  .nav-responsive,
  .nav-responsive > li
  {
    display: block;
    width: 100%;
    min-width: 100%;
  }
  .nav-responsive,
  .nav-responsive > li,
  .nav-responsive > li > a,
  .nav-responsive > li > ul > .tb_link,
  .nav-responsive .dropdown,
  .nav-responsive .dropdown > a,
  .nav-responsive .dropdown-menu > li,
  .nav-responsive .dropdown-menu > li > a
  {
    margin: 0 !important;
    padding: 0 !important;
  }
  .nav-responsive > li:not(:last-child),
  .nav-responsive .dropdown:not(:last-child),
  .nav-responsive .dropdown-menu:not(.tb_list_1) > li:not(:last-child)
  {
    margin-bottom: 10px !important;
  }
  .nav-responsive > li > a,
  .nav-responsive .dropdown > a,
  .nav-responsive .dropdown-menu > li > a
  {
    padding-top: 5px !important;
    padding-bottom: 5px !important;
  }
  .nav-responsive li:before,
  .nav-responsive .dropdown:after,
  .nav-responsive .dropdown > a:after,
  .nav-responsive > li:first-child:before
  {
    content: none !important;
    display: none !important;
  }
  .nav-responsive .dropdown > .tb_toggle {
    display: block;
  }
  .nav-responsive .dropdown-menu,
  .nav-responsive .dropdown > .hidden + ul
  {
    position: static;
    display: none !important;
    width: 100% !important;
    margin: 10px 0 0 0 !important;
    padding: 0;
    background: transparent none;
    border: none;
    -webkit-box-shadow: none;
            box-shadow: none;
    -webkit-transition: none !important;
            transition: none !important;
    opacity: 1 !important;
  }
  .dropdown.tb_active > .dropdown-menu,
  .dropdown.tb_active > .hidden + ul
  {
    display: block !important;
  }
  .nav-responsive .dropdown-menu > .row-wrap {
    margin: <?php echo $base * 0.5; ?>px 0 0 0;
  }
  .nav-responsive .dropdown > .tb_toggle {
    position: absolute;
    z-index: 1;
    top: 0;
    <?php if ($lang_dir == 'ltr'): ?>
    right: 0;
    <?php else: ?>
    left: 0;
    <?php endif; ?>
    display: block !important;
    width: 30px;
    height: 30px;
    margin: 0 !important;
    line-height: 30px !important;
    text-align: center;
    font-size: 18px;
    font-family: Arial, sans-serif !important;
    font-weight: normal !important;
    cursor: pointer;
  }
  .nav-responsive .dropdown > .tb_toggle:before {
    content: '+';
  }
  .nav-responsive .dropdown > .tb_toggle.tb_active:before {
    content: '-';
  }
  .nav-responsive .tb_separate_columns > [class*="col-"] {
    padding: 0;
  }
  .nav-responsive .tb_separate_columns > [class*="col-"] ~ [class*="col-"] {
    margin-top: 20px;
    padding-top: 20px;
  }
  .nav-responsive .tb_separate_columns > [class*="col-"] > [class*="tb_ml_-"] {
    margin-left: 0;
  }
  .nav-responsive .tb_separate_columns > [class*="col-"] > [class*="tb_mr_-"] {
    margin-right: 0;
  }
  .nav-responsive .tb_link > .hidden {
    display: block !important;
    visibility: visible !important;
  }


  /*  Tabs Inline Style  ----------------------------------------------------------------  */

  .htabs.tb_style_2 {
    display: block;
  }
  .htabs.tb_style_2 > li,
  .htabs.tb_style_2 > a
  {
    display: block;
  }
  .htabs.tb_style_2 > li > a {
    padding-left: 0;
    padding-right: 0;
  }
  .htabs.tb_style_2 > li:not(:first-child):before {
    content: '____' !important;
    display: block;
    margin-bottom: 10px;
    text-align: initial;
    line-height: 10px;
    letter-spacing: -0.25em;
    opacity: 0.3;
  }

}