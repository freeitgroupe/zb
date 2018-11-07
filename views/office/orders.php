<?php require_once "views/header.php";?>
    <!-- single page content -->
    <div class="emraceFull">
        <div class="embrace clear singlePage">
            <h3 class="stipeHeading">Personal Office</h3>
            <div class="officeBox clear">
                <div class="greetingsBox">
                    <div class="userName"><?php $_SESSION['auth_name']?></div>
                    <!--<div class="userId">#0987</div>-->
                </div>
                <?php require_once "office_menu.php" ?>
                <div class="officeRight clear">
                    <div class="block-sort-order">
                        <div class="filter-order">
                            <p>Date :</p>
                            <select name="filter-date" id="filter-date">
                                <option value="0">Specify the sort direction</option>
                                <option value="1" <?php if($_SESSION['filter_orders']=='created_at'){if($_SESSION['direction_orders']==1) echo "selected";}?>>Ascending</option>
                                <option value="2"<?php if($_SESSION['filter_orders']=='created_at'){if($_SESSION['direction_orders']==2) echo "selected";}?>>Descendingly</option>
                            </select>
                        </div>

                        <div class="filter-order">
                            <p>Price :</p>
                            <select name="filter-price" id="filter-price">
                                <option value="0">Specify the sort direction</option>
                                <option value="1" <?php if($_SESSION['filter_orders']=='sum'){if($_SESSION['direction_orders']==1) echo "selected";}?>>Ascending</option>
                                <option value="2"<?php if($_SESSION['filter_orders']=='sum'){if($_SESSION['direction_orders']==2) echo "selected";}?>>Descendingly</option>
                            </select>
                        </div>
                    </div>
                    <div class="tableListBox clear">
                        <table>
                            <tbody>
                            <tr>
                                <th>ID</th>
                                <th id="filter-date"  data-sort-date="asc">Date</th>
                                <th>Status</th>
                                <th id="filter-price" data-sort-price="asc">Total Price <?=$currency?></th>
                                <th>View</th>
                            </tr>
                            <?php if(!empty($all_orders_user)):?>
                                <?php foreach ($all_orders_user as $item):?>
                                    <tr>
                                        <td>
                                            <span id="" data-count="1">#<?=$item['id']?></span>
                                        </td>
                                        <td>
                                            <span><?=$item['created_at']?></span>
                                        </td>
                                        <td>
                                            <span><?=$item['param_status_title']?></span>
                                        </td>
                                        <td>
                                            <span><?=$item['sum']?></span>
                                        </td>
                                        <td style="cursor: pointer" id="view-order" data-order="<?=$item['id']?>">
                                            <a href="detail-orders/<?=$item['id']?>">Detail order</a></td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else:?>
                                <tr><td>empty</td></tr>
                            <?php endif;?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="detail-order officeRight clear" style="display: none">
                    <div class="singleProduct clear">
                        <div class="hrefBox">
                            <a href="/product/product-test_20">
                                <div class="thumbnail">
                                    <div class="saleNotice">Sale</div>
                                    <img src="/uploads_images/product/baseimg/thumb1.jpg" alt="product-test_20">
                                </div>
                            </a>
                            <div class="favBox clear">
                                <div class="favIcon bookmark shoppingPopupWindow" data-product="20">q</div>
                            </div>
                            <div class="pruductName">
                                product-test_20
                            </div>
                            <div class="procuctPrice">
                                <span class="currency">$</span>249.99</div>
                        </div>

                        <div class="productFooter clear">
                            <input data-product="20" data-price="249.99" type="button" class="addToCart button-add" value="Add to cart">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- single page content end -->
<?php require_once "views/footer.php"?>