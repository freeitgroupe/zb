<?php
//data - содержит дерево категорий
//$arr['product_info']['category_id'] - id родительской категории
//
?>
<?php if($data):?>
    <?php if($data && !isset($arr['create_product'])):?>
        <option
            value="<?=$data['id']?>"
            <?php if($arr['active_category'] == $data['id']):?>
            selected
            <?php endif;?>
        >
            <?=$tab . $data['title']?>
            <?php if(isset($data['childs'])):?>
                <?=data_tree_to_string($data['childs'], TMP_ADM . 'tpl/category_tree_for_product.php', $tab .= '- ',$arr);?>
            <?php endif;?>
        </option>
    <?php endif;?>
<?php endif;?>

<?php if(isset($arr['create_product'])):?>
    <option
    value="<?=$data['id']?>"
     <?php if($data['id'] == $arr['session_parent']):?>
         selected = 'selected'
     <?php endif; ?>
    >
        <?=$tab . $data['title']?>
        <?php if(isset($data['childs'])):?>
            <?= data_tree_to_string($data['childs'], TMP_ADM . 'tpl/category_tree_for_product.php', $tab .= '- ',$arr);?>
        <?php endif;?>
    </option>
<?php endif;?>
