<div class="tb_tabs tb_subpanel_tabs">

  <div class="tb_tabs_nav">
    <ul class="clearfix">
      <li><a href="#store_settings_common">Common</a></li>
      <li><a href="#store_settings_menu">Menu</a></li>
      <li><a href="#store_settings_category">Subcategories</a></li>
      <li><a href="#store_settings_product_listing">Product listing</a></li>
      <li><a href="#store_settings_product">Product page</a></li>
      <?php $tbData->slotFlag('tb\theme_store.tabs.navigation'); ?>
    </ul>
  </div>

  <div id="store_settings_common" class="tb_subpanel">
    <?php require(tb_modification(dirname(__FILE__) . '/theme_store_common.tpl')); ?>
  </div>

  <div id="store_settings_menu" class="tb_subpanel">
    <?php require(tb_modification(dirname(__FILE__) . '/theme_store_menu.tpl')); ?>
  </div>

  <div id="store_settings_category" class="tb_subpanel">
    <h2>Subcategories global settings</h2>

    <?php echo $tbData->fetchTemplate('theme_store_category', array('subcategories' => $store_category_default['subcategories'], 'input_property' => "store[category]")); ?>
  </div>

  <div id="store_settings_product_listing" class="tb_subpanel">
    <h2>Product listing global settings</h2>
    <?php echo $tbData->fetchTemplate('theme_store_product_listing', array('products' => $store_category_default['products'], 'input_property' => "store[category]", 'list_types' => array('list', 'grid', 'compact'))); ?>
  </div>

  <div id="store_settings_product" class="tb_subpanel">
    <?php require(tb_modification(dirname(__FILE__) . '/theme_store_product.tpl')); ?>
  </div>

  <?php $tbData->slotFlag('tb\theme_store.tabs.content'); ?>

</div>

<div class="s_submit clearfix">
  <a class="s_button s_red s_h_40 tb_cp_form_submit"><?php echo $text_button_save_settings; ?></a>
</div>


<script type="text/javascript">

$(document).ready(function() {

  var eventDispatcher = tbHelper.createEventDispatcher();

  var initMenu = function(obj) {

    if (!obj[1].find("a").is('[href="#store_settings_menu"]')) {
      return;
    }

    obj[0].find(".tbLanguageTabs").tabs();

    var menu = tbApp.initMenu($("#store_settings_menu"));

    $(tbApp).on("tbCp:beforeSave", function(event, eventDispatcher) {
      eventDispatcher.register(function() {
        var myDeferred = $.Deferred();

        menu.prepareForSave();

        return myDeferred.resolve().promise();
      });
    });

    eventDispatcher.removeEventListener("showTab", initMenu);
  };

  var initSubcategories = function(obj) {
    if (!obj[1].find("a").is('[href="#store_settings_category"]')) {
      return;
    }

    tbApp.storeInitSubcategories($("#store_settings_category"), "store[category][subcategories]");

    eventDispatcher.removeEventListener("showTab", initSubcategories);
  };

  var initProductListing = function(obj) {

    if (!obj[1].find("a").is('[href="#store_settings_product_listing"]')) {
      return;
    }

    obj[0].find(".tbProductListingSettings").tabs({
      activate: function(event, ui) {
        if (!ui.newTab.data('initialized')) {
          beautifyForm(ui.newPanel);
          ui.newTab.data('initialized', 1);
        }
      },
      create: function(event, ui) {
        if (!ui.tab.data('initialized')) {
          beautifyForm(ui.panel);
          ui.tab.data('initialized', 1);
        }
      }
    });

    tbApp.storeInitProductListing($("#store_settings_product_listing"), "store[category][products][grid]");

    eventDispatcher.removeEventListener("showTab", initProductListing);
  };

  var initProduct = function(obj) {
    if (!obj[1].find("a").is('[href="#store_settings_product"]')) {
      return;
    }

    obj[0].find(".tbAddProductDesign").bind("click", function() {

      var $parent = $("#store_product_design");
      var $layout = $parent.find('select[name="product_layouts"] option:selected');
      var $design = $parent.find('select[name="product_designs"] option:selected');
      var $ratio  = $parent.find('select[name="product_column_ratio"] option:selected');

      if (!$parent.find('.tbProductDesignList input[name$="[layout][' + $layout.val() + '][design]"][value="' + $design.val() + '"]').length) {
        var row = Mustache.render($("#store_product_design_template").text(), {
          layout_id:         $layout.val(),
          layout_name:       $layout.text(),
          design_id:         $design.val(),
          design_name:       $design.text(),
          column_ratio_id:   $ratio.val(),
          column_ratio_text: $ratio.text()
        });

        $parent.find(".tbProductDesignList").append(row).parent("table").show();
      }

      return false;
    });

    obj[0].find(".tbProductDesignList .tbColumnProportion").each(function() {
      var ratio_id = $(this).closest("tr").find('input[name$="[column_ratio]"]').val();

      $(this).text($("#store_product_design").find('select[name="product_column_ratio"] option[value="' + ratio_id + '"]').text());
    });

    obj[0].find(".tbAddProductOptionStyle").bind("click", function() {

      var $parent  = $("#store_product_option_styles");
      var $option  = $parent.find('select[name="product_options"] option:selected');
      var $style   = $parent.find('select[name="option_styles"] option:selected');
      var $image_w = $parent.find('input[name="option_image_w"]');
      var $image_h = $parent.find('input[name="option_image_h"]');
      var display  = $parent.find('select[name="product_options"] option:selected').attr('data-type') == 'image' ? 'inline' : 'none' ;

      if (!$parent.find('.tbProductOptionStyleList input[name$="[option][' + $option.val() + ']"]').length) {
        var row = Mustache.render($("#store_product_option_style_template").text(), {
          option_id:   $option.val(),
          option_name: $option.text(),
          style_id:    $style.val(),
          style_name:  $style.text(),
          image_w:     $image_w.val(),
          image_h:     $image_h.val(),
          display_img: display
        });

        $parent.find(".tbProductOptionStyleList").append(row).parent("table").show();
      }

      return false;
    });

    obj[0].on("change", ':checkbox[name="product[gallery_zoom]"]', function() {
      $(this).closest("fieldset").find('select[name="product[gallery_zoom_action]"]')
        .closest(".tbSetting").toggleClass("tb_disabled", !$(this).is(":checked"));
    });

    obj[0].on("click", ".tbRemove", function() {
      if (confirm("Are you sure?")) {
        $(this).parents("tr").first().remove();
        obj[0].find('tbody[class$="List"]').each(function() {
          if (!$(this).find(" > *").length) {
            $(this).parent("table").hide();
          }
        });
      }

      return false;
    });

    eventDispatcher.removeEventListener("showTab", initProduct);
  };

  eventDispatcher.addEventListener("showTab", initProduct);
  eventDispatcher.addEventListener("showTab", initProductListing);
  eventDispatcher.addEventListener("showTab", initMenu);
  eventDispatcher.addEventListener("showTab", initSubcategories);

  var initOnce = function($tab, $panel) {

    if ($tab.data("initialized")) {
      return;
    }

    $tab.data("initialized", true);
    if (!$tab.is("[href='#store_settings_product_listing']")) {
      beautifyForm($panel);
    }
  };

  $("#store_settings").find(" > .tb_tabs").tabs({

    activate: function(event, ui) {
      initOnce(ui.newTab.find("a"), ui.newPanel);
      eventDispatcher.dispatchEvent("showTab", [$(ui.newPanel), $(ui.newTab)]);
      tbApp.cookie.set("tbStoreTabs", ui.newTab.index());
    },

    active: tbApp.cookie.get("tbStoreTabs", 0),

    create: function(event, ui) {
      initOnce(ui.tab.find("a"), ui.panel);
      eventDispatcher.dispatchEvent("showTab", [ui.panel, ui.tab]);
    }
  });
  
  $("#store_settings_category .tbAdvancedOptionsToggle").each(function() {
    $(this).bind("click", function() {
      if($(this).hasClass("tb_advanced_closed")) {
        $(this).parents("fieldset").find(".tbAdvancedOptions").hide();
        $(this).removeClass("tb_advanced_closed");
        $(this).addClass("tb_advanced_opened");
        $(this).text("Advanced Options");
      } else {
        $(this).parents("fieldset").find(".tbAdvancedOptions").show();
        $(this).addClass("tb_advanced_closed");
        $(this).removeClass("tb_advanced_opened");
        $(this).text("Basic Options")
      }
    });
  });

});

</script>
