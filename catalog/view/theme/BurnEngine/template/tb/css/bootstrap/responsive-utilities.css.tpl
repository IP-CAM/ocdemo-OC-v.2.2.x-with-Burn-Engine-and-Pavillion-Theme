@-ms-viewport {
  width: device-width;
}
.visible-xs,
.visible-sm,
.visible-md,
.visible-lg {
  display: none !important;
}
.visible-xs-block,
.visible-xs-inline,
.visible-xs-inline-block,
.visible-sm-block,
.visible-sm-inline,
.visible-sm-inline-block,
.visible-md-block,
.visible-md-inline,
.visible-md-inline-block,
.visible-lg-block,
.visible-lg-inline,
.visible-lg-inline-block {
  display: none !important;
}
<?php foreach ($breakpoints as $breakpoint): ?>
<?php if (empty($prev_breakpoint)): ?>
@media (max-width: <?php echo (${'screen_' . $breakpoint} - 1) . 'px'; ?>) {
  .visible-<?php echo $breakpoint; ?> {
    display: block !important;
  }
  table.visible-<?php echo $breakpoint; ?> {
    display: table;
  }
  tr.visible-<?php echo $breakpoint; ?> {
    display: table-row !important;
  }
  th.visible-<?php echo $breakpoint; ?>,
  td.visible-<?php echo $breakpoint; ?> {
    display: table-cell !important;
  }
  .visible-<?php echo $breakpoint; ?>-block {
    display: block !important;
  }
  .visible-<?php echo $breakpoint; ?>-inline {
    display: inline !important;
  }
  .visible-<?php echo $breakpoint; ?>-inline-block {
    display: inline-block !important;
  }
  .hidden-<?php echo $breakpoint; ?> {
    display: none !important;
  }
}
<?php else: ?>
@media (min-width: <?php echo (${'screen_' . $prev_breakpoint}) . 'px'; ?>) and (max-width: <?php echo (${'screen_' . $breakpoint} - 1) . 'px'; ?>) {
  .visible-<?php echo $breakpoint; ?> {
    display: block !important;
  }
  table.visible-<?php echo $breakpoint; ?> {
    display: table;
  }
  tr.visible-<?php echo $breakpoint; ?> {
    display: table-row !important;
  }
  th.visible-<?php echo $breakpoint; ?>,
  td.visible-<?php echo $breakpoint; ?> {
    display: table-cell !important;
  }
  .visible-<?php echo $breakpoint; ?>-block {
    display: block !important;
  }
  .visible-<?php echo $breakpoint; ?>-inline {
    display: inline !important;
  }
  .visible-<?php echo $breakpoint; ?>-inline-block {
    display: inline-block !important;
  }
  .hidden-<?php echo $breakpoint; ?> {
    display: none !important;
  }
}
<?php endif; ?>
<?php $prev_breakpoint = $breakpoint; ?>
<?php endforeach; ?>
@media (min-width: <?php echo (${'screen_' . $prev_breakpoint}) . 'px'; ?>) {
  .visible-xl {
    display: block !important;
  }
  table.visible-xl {
    display: table;
  }
  tr.visible-xl {
    display: table-row !important;
  }
  th.visible-xl,
  td.visible-xl {
    display: table-cell !important;
  }
  .visible-xl-block {
    display: block !important;
  }
  .visible-xl-inline {
    display: inline !important;
  }
  .visible-xl-inline-block {
     display: inline-block !important;
   }
  .hidden-xl {
    display: none !important;
  }
}