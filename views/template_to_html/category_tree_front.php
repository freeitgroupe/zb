<?php defined("CATALOG") or die("Access denied");?>
<?php if(isset($data)):?>
    <option value="/category/<?=$data['alias']?>" data-alias="<?=$data['alias']?>" <?=$arr['activeCategory'] == $data['id'] ? 'selected':''; ?>>
        <?=$tab . $data['title']?>
        <?php if(isset($data['childs'])):?>
            <?= data_tree_to_string($data['childs'],  $_SERVER['DOCUMENT_ROOT'] . '/views/template_to_html/category_tree_front.php', $tab .= '- ',$arr);?>
        <?php endif;?>
    </option>
<?php endif;?>
