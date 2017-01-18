#<?php echo $uid; ?> .mightySlider .frame {
height: <?php echo $slider['height']; ?>px;
}
<?php // FULLWIDTH SLIDER ?>
<?php if ($slider['layout'] == 'fullwidth'): ?>
#<?php echo $uid; ?> .mightySlider.fullwidth + .tb_placeholder {
padding-top: <?php echo ($slider['height'] / $slider['responsive_width']) * 100; ?>%;
}
@media only screen and (max-width: 1020px) {
#wrapper.tb_row_full #content.tb_row_full #<?php echo $uid; ?> .mightySlider.fullwidth + .tb_placeholder {
padding-top: <?php echo ($slider['height'] / ($slider['responsive_width'] - 60)) * 100; ?>%;
}
}
@media only screen and (max-width: 1240px) {
.tb_layout_1200 #wrapper.tb_row_full #content.tb_row_full #<?php echo $uid; ?> .mightySlider.fullwidth + .tb_placeholder {
padding-top: <?php echo ($slider['height'] / ($slider['responsive_width'] - 60)) * 100; ?>%;
}
}
<?php endif; ?>

<?php // FULLSCREEN SLIDER ?>
<?php if ($slider['layout'] == 'fullscreen'): ?>
#<?php echo $uid; ?> .mightySlider .ms_scene {
  top: 50%;
  left: 50%;
  bottom: auto;
  right: auto;
  width: <?php echo $slider['responsive_width']; ?>px;
  height: <?php echo $slider['responsive_height']; ?>px;
  margin: -<?php echo $slider['responsive_height'] * 0.5; ?>px 0 0 -<?php echo $slider['responsive_width'] * 0.5; ?>px;
}
#<?php echo $uid; ?> {
  <?php if (isset($slider['min_height'])): ?>
  min-height: <?php echo $slider['min_height']; ?>px;
  <?php endif; ?>
}
<?php endif; ?>

<?php // MANUAL SCALING ?>
<?php foreach ($slider['sizes'] as $size): ?>
@media only screen and (max-width: <?php echo $size['max_width']; ?>px) {
#<?php echo $uid; ?> .mightySlider .frame {
height: <?php echo $size['height']; ?>px;
}
}
<?php endforeach; ?>

<?php // SLIDES STYLES ?>
<?php $slide_num = 1; foreach ($slider['slides'] as $slide): ?>
#<?php echo $uid . '_slide_' . $slide_num; ?> {
background-color: <?php echo $slide['bg_color']; ?>;
}
<?php $layer_num = 1; foreach ($slide['layers'] as $layer): ?>
<?php if ($layer['css_styles']): ?>
#<?php echo $uid . '_slide_' . $slide_num . '_layer_' . $layer_num; ?> {
  <?php if (!$layer['html_width']) echo ' width: auto !important;'; ?>
  <?php echo $layer['css_styles']; ?>
}
#<?php echo $uid . '_slide_' . $slide_num . '_layer_' . $layer_num; ?> * {
  opacity: 1;
}
<?php endif; ?>
<?php $layer_num ++; endforeach; ?>
<?php $slide_num ++; endforeach; ?>

<?php echo $slider['custom_css']; ?>
