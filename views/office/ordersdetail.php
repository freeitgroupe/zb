<?php require_once "views/header.php";?>
    <!-- single page content -->
    <div class="emraceFull">
        <div class="embrace clear singlePage">
            <h3 class="stipeHeading">Personal Office</h3>
            <div class="officeBox clear">
                <div class="greetingsBox">
                    <div class="userName"><?= $_SESSION['auth_name']?> </div>
                    <!--                <div class="userId">#0987</div>-->
                </div>
                <?php require_once "office_menu.php" ?>

                <div class="detail-order officeRight clear">
                    <a href="/orders">back</a>
                    <div class="block-sort-order">
                        <div class="filter-order">
                            <p>Price :</p>
                            <select name="filter-date" id="filter-sum">
                                <option value="0">Specify the sort direction</option>
                                <option value="1" <?php if($_SESSION['filter']=='sum_item'){if($_SESSION['direction']==1) echo "selected";}?>>Ascending</option>
                                <option value="2"<?php if($_SESSION['filter']=='sum_item'){if($_SESSION['direction']==2) echo "selected";}?>>Descendingly</option>
                            </select>
                        </div>

                        <div class="filter-order">
                            <p>Title :</p>
                            <select name="filter-price" id="filter-title">
                                <option value="0">Specify the sort direction</option>
                                <option value="1" <?php if($_SESSION['filter']=='title_product'){if($_SESSION['direction']==1) echo "selected";}?>>Ascending</option>
                                <option value="2"<?php if($_SESSION['filter']=='title_product'){if($_SESSION['direction']==2) echo "selected";}?>>Descendingly</option>
                            </select>
                        </div>
                    </div>

                    <?php if($all_orders_user_items):?>
                        <div class="total-summ">
                            <span>Total amount for order: <?=$total_order . ' '.$currency?></span>
                        </div>
                    <?php foreach ($all_orders_user_items as $item):?>
                    <div class="singleProduct clear">
                        <div class="hrefBox">
                            <a href="/product/<?=$item['alias']?>">
                                <div class="thumbnail">
<!--                                    <div class="saleNotice">Sale</div>-->
                                    <img src="<?= PROD_IMG . $item['image']?>" alt="product-test_20">
                                </div>
                            </a>
                            <div class="favBox clear">
                                <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$item['product_id']?>">q</div>
                            </div>
                            <div class="pruductName">
                                <?=$item['title_product']?>
                            </div>
                            <div class="procuctPrice">
                                <span class="currency">
                                    <?=$currency?>
                                </span>
                                <?=$item['price']?>
                            </div>
                            <div class="pruductName">
                                count:<?=$item['qty_item']?>
                            </div>
                            <div class="pruductName">
                                summ:<?=$item['sum_item']?>
                            </div>
                            <div class="rating-prod">
                                <input name="rating"  id="rating_star" type="hidden"/>
                                <div class="overall-rating">
                                    (Rating <span id="avgrat"><?=$item['rating_param']['average_rating']?></span> Based on <span id="totalrat"><?=$item['rating_param']['rating_number']?></span>  rating)
                                </div>
                            </div>
                        </div>

                        <div class="productFooter clear">

                        </div>
                    </div>
                    <?php endforeach; ?>
                    <?php else:?>
                        empty
                    <?php endif;?>
                </div>
            </div>
        </div>
    </div>
    <!-- single page content end -->
<?php require_once "views/footer.php"?>