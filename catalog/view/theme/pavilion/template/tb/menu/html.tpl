<li id="menu_html_<?php echo $menu_item['data']['id']; ?>" class="tb_menu_html <?php if(!empty($menu_item['data']['settings']['class'])) echo $menu_item['data']['settings']['class']; ?><?php if ($menu_item['data']['settings']['dropdown_width_metric'] == '%') echo ' tb_full_menu'; ?> tb_multiple">
  <?php if (!empty($menu_item['data']['settings']['url'])): ?>
  <a href="<?php echo $menu_item['data']['settings']['url']; ?>"<?php if (!empty($menu_item['data']['settings']['url_title'])): ?> title="<?php echo $menu_item['data']['settings']['url_title']; ?>"<?php endif; ?> target="<?php echo $menu_item['data']['settings']['target']; ?>">
    <?php echo $menu_item['data']['settings']['label']; ?>
    <?php if (!empty($menu_item['data']['settings']['accent_text'])): ?>
    <span class="tb_accent_label" style="color: <?php echo $menu_item['data']['settings']['accent_color']; ?>; background-color: <?php echo $menu_item['data']['settings']['accent_bg']; ?>;"><?php echo $menu_item['data']['settings']['accent_text']; ?></span>
    <?php endif; ?>
  </a>
  <?php else: ?>
  <a href="javascript:;">
    <?php echo $menu_item['data']['settings']['label']; ?>
    <?php if (!empty($menu_item['data']['settings']['accent_text'])): ?>
    <span class="tb_accent_label" style="color: <?php echo $menu_item['data']['settings']['accent_color']; ?>; background-color: <?php echo $menu_item['data']['settings']['accent_bg']; ?>;"><?php echo $menu_item['data']['settings']['accent_text']; ?></span>
    <?php endif; ?>
  </a>
  <?php endif; ?>
  <div class="tb_submenu" style="width: <?php echo $menu_item['data']['settings']['dropdown_width']; ?><?php echo $menu_item['data']['settings']['dropdown_width_metric']; ?>">
    <?php echo $menu_item['data']['settings']['html_text']; ?>
  </div>
  <span class="tb_toggle"></span>
</li>