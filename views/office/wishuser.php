<?php require_once "views/header.php";?>
<!-- single page content -->
    <style>
        .block-wish-list{
            display: block;
            overflow: hidden;
        }
    </style>
<div class="emraceFull">
    <div class="embrace clear singlePage">
        <?php require_once "office_menu.php" ?>
        <div class="officeRight clear">
        <?php
        $wish_id='';
        if($wishlist_user_product):?>
            <?php foreach ($wishlist_user_product as $k=>$value_wishlist_user_product):?>
                <div class="block-wish-list">
                <?php for($i=0, $count= count($value_wishlist_user_product); $i<$count; $i++):?>
                    <?php  if($value_wishlist_user_product[$i]['wish_id'] != $wish_id): $wish_id = $value_wishlist_user_product[$i]['wish_id'];?>
                        <div class="title-block-addproduct" id="t-b-<?=$value_wishlist_user_product[$i]['wish_id']?>">
                            <h1 class="text-block-addproduct">
                                <i class="fa fa-heart-o"></i>
                                <span id="list-<?=$value_wishlist_user_product[$i]['wish_id']?>"><?=$value_wishlist_user_product[$i]['title_wish']?></span>
                                <span class="edit_wish_list span-btn ed-<?=$value_wishlist_user_product[$i]['wish_id']?> trigger-edit-name" id="edit_wish_list" data-toggle="modal" data-wish-id="<?= $value_wishlist_user_product[$i]['wish_id']?>" data-wish-title="<?=$value_wishlist_user_product[$i]['title_wish']?>"><i class="fa fa-pencil-square-o"></i></span>
                                <span class="delete-wishlist span-btn trigger-del-wishlist" data-wish-id="<?=$value_wishlist_user_product[$i]['wish_id']?>" data-toggle="modal" data-target="#modal-wishlist-delete" >
                            <i class="fa fa-close"></i>
                            </span>
                            </h1>
                        </div>
                    <?php endif;?>
                    <div class="singleProduct clear pl-item c-b-<?=$value_wishlist_user_product[$i]['wish_id']?> pr-i-<?=$value_wishlist_user_product[$i]['product_id']?>">
                        <span class="toggle-fl-icon-delete delete-prod-wl trigger-del-product" data-product="<?=$value_wishlist_user_product[$i]['product_id']?>" data-wishlist="<?=$value_wishlist_user_product[$i]['wish_id']?>" data-action="delete-product" data-toggle="modal" data-target="#modal-wishlist-product-delete"><i class="fa fa-close"></i></span>
                        <div class="hrefBox">
                            <a href="<?='/product/'.$value_wishlist_user_product[$i]['alias']?>">
                                <div class="thumbnail">
                                    <!--                                <div class="saleNotice">Sale</div>-->
                                    <img src="<?= PROD_IMG . $value_wishlist_user_product[$i]['image']?>" alt="">
                                </div>
                            </a>
                            <div class="favBox clear">
                                <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$value_wishlist_user_product[$i]['product_id']?>">q</div>
                            </div>
                            <div class="pruductName">
                                <?=$value_wishlist_user_product[$i]['title_product']?>
                            </div>
                            <div class="procuctPrice">
                                <span class="currency">$</span><?=$value_wishlist_user_product[$i]['price']?>
                            </div>
                        </div>
                        <div class="productFooter clear">
                            <input data-product="<?=$value_wishlist_user_product[$i]['product_id']?>" data-price="<?=$value_wishlist_user_product[$i]['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                        </div>
                    </div>
                <?php endfor?>
                </div>
            <?php endforeach?>

        <?php endif;?>

        <?php if($wishListUserZeroProduct):?>
            <?php foreach($wishListUserZeroProduct as $item):?>
                <div class="title-block-addproduct" id="t-b-<?=$item['id']?>">
                    <h1 class="text-block-addproduct">
                        <i class="fa fa-heart-o"></i>
                        <span id="list-<?=$item['id']?>"><?=$item['title']?></span>

                        <span class="edit_wish_list span-btn ed-<?=$item['id']?> trigger-edit-name" id="edit_wish_list" data-toggle="modal" data-wish-id="<?= $item['id']?>" data-wish-title="<?=$item['title']?>">
                         <i class="fa fa-pencil-square-o"></i>
                         </span>
                        <span class="delete-wishlist span-btn trigger-del-wishlist" id="delete-wishlist" data-wish-id="<?=$item['id']?>"  data-toggle="modal" data-target="#modal-wishlist-delete">
                         <i class="fa fa-close"></i>
                         </span>
                    </h1>
                </div>
            <?php endforeach;?>
        <?php endif;?>
    </div>

    <?php //пустые списки?>
    <?php if(empty($wishListUserZeroProduct) && empty($wishlist_user_product)):?>
        <div class="embrace clear singlePage">
            <h1 class="text-block-addproduct"><i class="fa fa-heart-o"></i>
                Empty
            </h1>
        </div>
    <?php endif;?>

    </div>
</div>
    <!-- single page content end -->
<?php require_once "views/footer.php"?>