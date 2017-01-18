<?php echo $header; ?>


<?php // Breadcrumbs -------------------------------------------------- ?>

<?php $tbData->slotStartSystem('sagepay.breadcrumbs'); ?>
<ul class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  <?php } ?>
</ul>
<?php $tbData->slotStop(); ?>

<?php // Page title --------------------------------------------------- ?>

<?php $tbData->slotStartSystem('sagepay.page_title'); ?>
<h1><?php echo $heading_title; ?></h1>
<?php $tbData->slotStop(); ?>

<?php // Page content ------------------------------------------------- ?>

<?php $tbData->slotStartSystem('sagepay.page_content'); ?>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_type; ?></td>
        <td class="text-left"><?php echo $column_digits; ?></td>
        <td class="text-right"><?php echo $column_expiry; ?></td>
      </tr>
    </thead>
    <tbody>
<?php if ($cards) { ?>
  <?php foreach ($cards as $card) { ?>
          <tr>
            <td class="text-left"><?php echo $card['type']; ?></td>
            <td class="text-left"><?php echo $card['digits']; ?></td>
            <td class="text-right"><?php echo $card['expiry']; ?></td>
      <td class="text-right"><a href="<?php echo $delete . $card['card_id']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>

          </tr>
  <?php } ?>
<?php } else { ?>
        <tr>
          <td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
        </tr>
<?php } ?>
    </tbody>
  </table>
</div>
<div class="pagination">
  <?php echo str_replace('pagination', 'links', $pagination); ?>
  <?php if (!empty($results)): ?>
    <div class="results"><?php echo $results; ?></div>
  <?php endif; ?>
</div>
<div class="buttons clearfix">
  <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
  <div class="pull-right"><input type="button" value="<?php echo $button_new_card; ?>" id="button-add-card" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" /></div>
</div>

<script type="text/javascript"><!--
$('#button-add-card').bind('click', function () {
  $.ajax({
    url: 'index.php?route=credit_card/sagepay_server_cards/addCard',
    dataType: 'json',
    cache: false,
    beforeSend: function () {
      $('#button-confirm').button('loading');
    },
    complete: function () {
      $('#button-confirm').button('reset');
    },
    success: function (json) {
      // if success
      if (json['redirect']) {
        html = '<form action="' + json['redirect'] + '" method="post" id="redirect">';
        html += '  <input type="hidden" name="Status" value="' + json['Status'] + '" />';
        html += '  <input type="hidden" name="StatusDetail" value="' + json['StatusDetail'] + '" />';

        html += '</form>';

        $('.breadcrumb').after(html);

        $('#redirect').submit();
      }

      // if error
      if (json['error']) {
        $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }
    }
  });
});
//--></script>
<?php $tbData->slotStop(); ?>


<?php echo $footer; ?>