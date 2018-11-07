<?php
//data - содержит дерево категорий
//$arr['filter_category_choose']['parent'] - id родительской категории
//
?>
<?php if($data && isset($arr['filter_category_choose'])):?>
    
        <option
            value="<?=$data['id']?>"
            <?php if($arr['filter_category_choose'] != 0):?>
                <?php for($i=0, $count=count($arr['filter_category_choose']); $i<$count; $i++):?>
                    <?php if($data['id'] == $arr['filter_category_choose'][$i]):?>
                        selected
                    <?php endif; ?>
                <?php endfor;?>
            <?php endif;?>
        >
            <?=$tab . $data['title']?>
            <?php if(isset($data['childs'])):?>
                <?=data_tree_to_string($data['childs'], TMP_ADM . 'tpl/category_tree_for_editfilter.php', $tab .= '- ',$arr);?>
            <?php endif;?>
        </option>

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
