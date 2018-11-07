<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>

<!-- slider -->
<!--<div class="embraceFull">-->
<!--    --><?php ////require_once "slider_container.php"?>
<!--    <div class="slider box"></div>-->
<!--</div>-->
<div class="embraceFull clear indexVideo">
    <div class="embrace indexVideoBox clear">
        <?=htmlspecialchars_decode($SliderContent['description'])?>
    </div>
</div>

<!-- slider end -->

<!-- main page content -->
<!-- categories box -->
<div class="embraceFull">
    <div class="embrace clear categoriesIndex">
        <?php if(isset($primary_category) && $primary_category != false):?>
            <?php for($i=1, $count=count($primary_category); $i<=$count; $i++):?>
                <div class="indexSingleCat">
                    <a href="/category/<?=$primary_category[$i]['alias']?>">
                        <img src="<?=CAT_IMG . $primary_category[$i]['image']?>">
                    </a>
                    <div class="nameBox"><?=$primary_category[$i]['title']?></div>
                </div>
            <?php endfor?>
        <?php endif?>
    </div>
</div>
<!-- categories box end -->
<div class="emraceFull">
    <div class="embrace clear indexPage">
        <!-- choice if the day -->
        <div class="choiceIndex clear">
            <div class="choiceHead clear">
                <h3 class="stipeHeading">Choice of the day</h3>
                <div class="refreashBox">
                    <!-- <button id="refreash">
                        Refresh <div class="spinner" id="spin">L</div>
                    </button> -->
                </div>
            </div>
            <div class="choiceLoop clear">
                <?php if($ProductsHomePage != 'demoProducts'): ?>
                <?php foreach ($ProductsHomePage['res'] as $item):?>
                <!-- single product -->
                <div class="singleProduct clear">
                    <div class="hrefBox">
                        <a href="<?='/product/' . $item['alias']?>">
                            <div class="thumbnail">
                                <?php if($item['upsell_product'] > 0): ?>
                                    <div class="saleNotice">Sale</div>
                                <?php endif;?>
                                <?php if($item['stock_id'] > 0): ?>
                                    <div class="stockNotice" id="stock">Stock</div>
                                <?php endif; ?>
                                <img src="<?= PROD_IMG . $item['image']?>" alt="#">
                            </div>
                        </a>
                        <div class="favBox clear">
                            <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$item['id']?>">q</div>
                        </div>
                        <div class="pruductName">
                            <?=$item['title']?>
                        </div>
                        <div class="procuctPrice">
                            <span class="currency">$</span><?=$item['price']?>
                        </div>
                    </div>
                    <div class="productFooter clear">
                        <input data-product="<?=$item['id']?>" data-price="<?=$item['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                    </div>
                </div>
                <!-- single product end -->
                <?php endforeach;?>
                <?php else: ?>
                <!-- single product -->
                <div class="singleProduct clear">
                    <a href="#">
                        <div class="hrefBox">
                            <div class="thumbnail">
                                <img src="images/thumb3.jpg" alt="#">
                                <div class="saleNotice">Sale</div>
                                <div class="stockNotice" id="stock">Stock</div>
                            </div>
                            <div class="favBox clear">
                                <div class="favIcon">q</div>
                            </div>
                            <div class="pruductName">
                                Coffee stuff for Lovers
                            </div>
                            <div class="procuctPrice">
                                <span class="currency">$</span>1200
                            </div>
                        </div>
                    </a>
                    <div class="productFooter clear">
                        <input type="button" class="addToCart" id="addToCart" value="Add to cart">
                    </div>
                </div>
                <!-- single product end -->
                <?php endif; ?>
            </div>
        </div>
        <!-- choice if the day end-->
        <!-- Benefits -->
        <?=htmlspecialchars_decode($homeContentPage)?>
    </div>
</div>
<!-- main page content end -->

<?php require_once "footer.php"?>