<?php
//data - содержит дерево категорий
//$arr['product_info']['parent'] - id родительской категории
//
?>
<?php if($data && isset($arr['product_info'])):?>

    <?php if($data && $arr['product_info']['parent'] == '0'): ?>
        <option value="0" selected >Без категории</option>
    <?php endif; ?>

    <?php if($data && !isset($arr['create_product'])):?>
        <option
            value="<?=$data['id']?>"
            <?php if($data['id'] == $arr['product_info']['parent']):?>
                selected
            <?php endif?>
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
