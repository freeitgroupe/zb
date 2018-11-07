<?php if(isset($data)):?>

    <?php if($data['alias'] == 'collapse'):?>
        <li class="treeview" id="menu_<?=$tab++?>">
            <a href="#">
                <i class="fa <?= $data['icon']?>"></i>
                <span><?=$data['title']?></span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <?php if(isset($data['childs'])):?>
                <ul class="treeview-menu" style="display: none;" id="menu_<?=$tab++?>">
                    <?= data_tree_to_string($data['childs'], TMP_ADM . 'tpl/menu_admin_tree.php', $tab++); ?>
                </ul>
            <?php endif; ?>
        </li>
    <?php endif; ?>
    
    <?php if($data['alias'] != 'collapse'):?>
        <li class="<?=active_url($data['alias'])?>">
            <a href="/admin/<?=$data['alias']?>" class="link-list-item">
                <i class="<?=$data['icon']?>"></i>
                <span><?=$data['title']?></span>
            </a>
        </li>
    <?php endif; ?>

    <?php if(isset($data['child'])):?>
      <?=data_tree_to_string($data['child'], TMP_ADM . 'tpl/menu_admin_tree.php'); ?>
    <?php  endif; ?>

<?php else: ?>
    <li>Проверьте правильность вывода меню</li>
<?php endif;?>


