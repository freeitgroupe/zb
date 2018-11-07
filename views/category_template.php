<?php defined("CATALOG") or die("Access denied")?>

<?php if(isset($category)):?>
    <div class="singleMobile clear">
        <div class="headingWrapper clear">
            <div class="mobileIcon ico1">
                <img src="<?= CAT_IMG . $category['image']?>">
            </div>
            <a href="/category/<?=$category['alias']?>" class="singleName"><?=$category['title']?></a>
        </div>
    <?php if(isset($category['childs'])):?>
        <ul class="childList">
            <?=category_to_string($category['childs'], 'category_childs.php'); ?>
        </ul>
    <?php endif; ?>
    </div>
<?php endif;?>