<?php if($data && isset( $arr['category_info'])):?>

    <?php if($data['parent'] == '0' && $arr['category_info']['parent'] == 0 && $data['id']== $arr['category_info']['id'] ): ?>
    <option value="0" selected >Самостоятельная категория</option>
    <?php endif;?>

    <?php if($data['id'] != $arr['category_info']['id']):?>
        <option value="<?=$data['id']?>" <?php if($data['id'] == $arr['category_info']['parent']):?>selected<?php endif?> >
            <?=$tab . $data['title']?>
            <?php if(isset($data['childs'])):?>
                <?=data_tree_to_string($data['childs'], TMP_ADM . 'tpl/category_tree.php', $tab .= '- ',$arr);?>
            <?php endif;?>
        </option>
    <?php endif;?>

<?php endif;?>

<?php if(isset($arr['create_category'])):?>
    <option value="<?=$data['id']?>">
        <?=$tab . $data['title']?>
        <?php if(isset($data['childs'])):?>
            <?= data_tree_to_string($data['childs'], TMP_ADM . 'tpl/category_tree.php', $tab .= '- ',$arr);?>
        <?php endif;?>
    </option>
<?php endif;?>
