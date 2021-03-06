<?php if (!isset($tbData)) require dirname(__FILE__) . '/../tb/install_error.tpl'; ?>
<div class="panel-heading">
  <h2 class="panel-title"><?php echo $heading_title; ?></h2>
</div>
<div class="panel-body">
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
      <div class="checkbox">
        <label>
        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
          <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
          <?php echo $filter['name']; ?>
        <?php } else { ?>
          <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
          <?php echo $filter['name']; ?>
        <?php } ?>
        </label>
      </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
<div class="panel-footer text-right">
  <button type="button" id="button-filter" class="btn btn-primary btn-sm"><?php echo $button_filter; ?></button>
</div>

<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  filter = [];
  
	$('input[name^=\'filter\']:checked').each(function(element) {
    filter.push(this.value);
  });
  
  location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
