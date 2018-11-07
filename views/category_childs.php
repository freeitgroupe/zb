<?php defined("CATALOG") or die("Access denied")?>

<?php if(isset($category)):?>
    <li>
        <div class="childIcon">
            <img src="<?= CAT_IMG . $category['image']?>">
        </div>
        <a href="/category/<?=$category['alias']?>"><?=$category['title']?></a>
    </li>
    <?php if(isset($category['childs'])):?>
        <?=category_to_string($category['childs'], 'category_childs.php') ?>
    <?php endif;?>
<?php endif; ?>

