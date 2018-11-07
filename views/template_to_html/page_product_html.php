<?php defined("CATALOG") or die("Access denied");?>
<?php if(isset($content)):?>
            <!-- single product -->
            <div class="singleProduct clear load-content">
                <div class="hrefBox">
                    <a href="<?='/product/' . $content['alias']?>">
                        <div class="thumbnail">
                            <?php if($content['upsell_product'] > 0): ?>
                                <div class="saleNotice">Sale</div>
                            <?php endif;?>
                            <?php if($content['stock_id'] > 0): ?>
                                <div class="stockNotice" id="stock">Stock</div>
                            <?php endif; ?>

                            <img src="<?= PROD_IMG . $content['image']?>" alt="#">
                        </div>
                    </a>
                    <div class="favBox clear">
                        <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$content['id']?>">q</div>
                    </div>
                    <div class="pruductName">
                        <?=$content['title']?>
                    </div>
                    <div class="procuctPrice">
                        <span class="currency">$</span><?=$content['price']?>
                    </div>
                </div>
                <div class="productFooter clear">
                    <input data-product="<?=$content['id']?>" data-price="<?=$content['price']?>" type="button" class="button-add addToCart " value="Add to cart">
                </div>
            </div>
            <!-- single product end -->
<?php endif; ?>
