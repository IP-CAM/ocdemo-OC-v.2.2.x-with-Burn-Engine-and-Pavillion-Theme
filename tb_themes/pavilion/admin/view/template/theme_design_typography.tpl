<?php $font = $theme_settings['font']; ?>
<div class="tb_subpanel">
  <div<?php if (count($languages) > 1) echo ' class="tb_tabs tb_fly_tabs tbLanguageTabs"'; ?>>

    <h2><?php echo $text_title_design_typography; ?></h2>

    <?php if (count($languages) > 1): ?>
    <div class="tb_tabs_nav">
      <ul class="clearfix">
        <?php foreach ($languages as $language): ?>
        <li class="s_language">
          <a href="#typography_settings_language_<?php echo $language['language_id']; ?>" title="<?php echo $language['name']; ?>">
            <img class="inline" src="<?php echo $theme_catalog_resource_url; ?>image/flags/<?php echo $language['image']; ?>" /> <?php echo $language['code']; ?>
          </a>
        </li>
        <?php endforeach; ?>
      </ul>
    </div>
    <?php endif; ?>

    <?php foreach ($languages as $language): $lid = $language['language_id']; ?>

    <div id="typography_settings_language_<?php echo $lid; ?>">

      <?php foreach ($font[$lid] as $name => $section): ?>
      <fieldset class="tb_font_row tbFontItem">
        <legend><?php echo $section['section_name']; ?></legend>
        <?php echo $tbData->fetchTemplate('theme_design_typography_item', array('input_property' => "font[$lid][$name]", 'font' => $section, 'font_data' => $font_data)); ?>
      </fieldset>
      <?php endforeach; ?>

      <div class="s_box_1 tbNewItemDiv">
        <h3>New Font Rule</h3>
        <div class="s_row_1 s_mb_20">
          <label>Title:</label>
          <input type="text" value="" />
        </div>
        <div class="tbAddNewItemWrap">
          <a class="tbAddNewItem s_button s_white s_h_30 s_icon_10 s_plus_10" href="javascript:;" lid="<?php echo $lid; ?>">add new</a>
        </div>
      </div>

    </div>

    <?php endforeach; ?>

  </div>

  <div class="s_submit clearfix">
    <a class="s_button s_red s_h_40 tb_cp_form_submit"><?php echo $text_button_save_settings; ?></a>
  </div>
</div>

<script type="text/javascript">
(function ($, tbApp) {

var $container = $("#typography_settings");

beautifyForm($container);
tbApp.initFontItems($container);

$container.on("click", ".tbAddNewItem", function() {
  var title = $(this).parents(".tbNewItemDiv").find(":input").first().val().trim();

  if (title != "") {
    var item = Mustache.render($("#typography_item_template").text(), {
      input_property: "font[" + $(this).attr("lid") + "][" + tbHelper.underscore(title + "_" + tbHelper.generateUniqueId(5).toLowerCase()) + "]",
      section_name: title
    });

    $row = $(item).insertBefore($(this).parents(".tbNewItemDiv").first());
    beautifyForm($row);
    tbApp.initFontItems($row);
    $row.find("select.fontname").trigger("change");
  }

  return false;
});

$container.on("click", "a.tbRemoveItem", function() {
  if (confirm("Are you sure?")) {
    $(this).parents(".tbFontItem").first().remove();
  }

  return false;
});

})(jQuery, tbApp);


</script>

<script type="text/template" id="typography_item_template">
  <fieldset class="tb_font_row tbFontItem">
    <legend>{{section_name}}</legend>
    <?php echo $tbData->fetchTemplate('theme_design_typography_item', array(
    'input_property' => "{{input_property}}",
    'font'           => $font_data['default_font_settings'],
    'font_data'      => $font_data)); ?>
  </fieldset>
</script>