<?php echo $header; ?>


<?php // Breadcrumbs -------------------------------------------------- ?>

<?php $tbData->slotStart('account/password.breadcrumbs'); ?>
<ul class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  <?php } ?>
</ul>
<?php $tbData->slotStop(); ?>

<?php // Page title --------------------------------------------------- ?>

<?php $tbData->slotStart('account/password.page_title'); ?>
<h1><?php echo $heading_title; ?></h1>
<?php $tbData->slotStop(); ?>

<?php // Page content ------------------------------------------------- ?>

<?php $tbData->slotStart('account/password.page_content'); ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
  <fieldset>
    <legend><?php echo $text_password; ?></legend>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
      <div class="col-sm-10">
        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
        <?php if ($error_password) { ?>
        <div class="text-danger"><?php echo $error_password; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
      <div class="col-sm-10">
        <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
        <?php if ($error_confirm) { ?>
        <div class="text-danger"><?php echo $error_confirm; ?></div>
        <?php } ?>
      </div>
    </div>
  </fieldset>

  <div class="buttons clearfix">
    <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>
<?php $tbData->slotStop(); ?>


<?php echo $footer; ?>