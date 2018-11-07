<?php defined("CATALOG") or die("Access denied");
require_once 'header.php';
?>
<div class="emraceFull">
    <div class="embrace clear indexPage">
        <!-- choice if the day -->
        <div class="choiceIndex clear">
            <div class="choiceLoop clear">
                <div class="breadCrumbs clear">
                    <?=$breadcrumbs?>
                </div>
                <?php if(is_array($products)):?>
                    <div id="content-product">
                        <?php for($i=0, $count=count($products); $i<$count; $i++):?>
                            <!-- single product -->
                            <div class="singleProduct clear">

                                    <div class="hrefBox">
                                        <a href="<?='/product/' . $products[$i]['alias']?>">
                                        <div class="thumbnail">
                                            <?php if($products[$i]['upsell_product'] > 0): ?>
                                                <div class="saleNotice">Sale</div>
                                            <?php endif;?>
                                            <?php if($products[$i]['stock_id'] > 0): ?>
                                                <div class="stockNotice" id="stock">Stock</div>
                                            <?php endif; ?>
                                            <img src="<?= PROD_IMG . $products[$i]['image']?>" alt="#">
                                        </div>
                                        </a>
                                        <div class="favBox clear">
                                            <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$products[$i]['id']?>">q</div>
                                        </div>
                                        <div class="pruductName">
                                            <?=$products[$i]['title']?>
                                        </div>
                                        <div class="procuctPrice">
                                            <span class="currency">$</span><?=$products[$i]['price']?>
                                        </div>
                                    </div>

                                <div class="productFooter clear">
                                    <input data-product="<?=$products[$i]['id']?>" data-price="<?=$products[$i]['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                                </div>
                            </div>
                            <!-- single product end -->
                        <?php endfor?>
                    </div>
                    <div class="clear"></div>
                    <div class="refreashBox">
                        <button id="refreash">Refresh<div class="spinner" id="spin">L</div></button>
                    </div>
                <?php endif;?>

                <?php if(!is_array($products)):?>
                    <div id="content-product">
                        <h1 style="text-align:center; height: 100vh;"><?=$products?></h1>
                    </div>
                <?php endif;?>
            </div>
        </div>

        <div class="semanticBox clear"></div>

    </div>
</div>

<!-- main page content end -->
<?php require_once 'footer.php';?>
