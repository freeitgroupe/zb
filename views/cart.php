<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>
    <!-- main page content -->
    <!-- single page content -->
    <div class="embrace clear singlePage">
        <div class="breadCrumbs clear">
            <?=$breadcrumbs?>
        </div>
        <?php if(isset($order_list_user) && $order_list_user > false): ?>
        <section class="singleBox top clear">
            <div class="cartStartBox">
                <h3>Your order</h3>
                <p><?=CART_TEXT?></p>
                <div class="ProdcutBox">
                    <form action="">
                        <div class="tableListBox clear">
                            <table>
                                <tbody>
                                <tr>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Unit</th>
                                    <th>Unit Price</th>
                                    <th>Total Price</th>
                                    <th>Remove</th>
                                </tr>
                                <?php for($i = 0, $count = count($order_list_user); $i < $count; $i++):?>
                                    <tr>
                                        <td>
                                            <a href="<?='/product/'.$order_list_user[$i]['alias']?>" target="_blank">
                                                <span>
                                                    <img class="img-list" src="<?=PROD_IMG . $order_list_user[$i]['image']?>" alt="">
                                                </span>
                                                <?=$order_list_user[$i]['title']?>
                                            </a>
                                        </td>
                                        <td>
                                            <input type="text" class="cart_quantity_input form-control count" value="<?=$order_list_user[$i]['cart_count']?>" data-product="<?=$order_list_user[$i]['cart_id']?>" data-action="quantity" id="cart_quantity_id_<?=$order_list_user[$i]['cart_id']?>" name="quantity">
                                        </td>
                                        <td>
                                            <span id="totalCount_<?=$order_list_user[$i]['cart_id']?>" data-count="<?=$order_list_user[$i]['cart_count']?>"> <?=$order_list_user[$i]['cart_count']?></span>
                                        </td>
                                        <td>
                                            <span  data-price_product="<?=$order_list_user[$i]['price']?>" id="productPrice_<?=$order_list_user[$i]['cart_id']?>"> <?=number_format($order_list_user[$i]['price'], 2, ',', ' ') . $currency?> </span>
                                        </td>
                                        <td>
                                            <span id="totalSum_<?=$order_list_user[$i]['cart_id']?>" data-totalsum="<?=$order_list_user[$i]['total_value']?>"><?=$order_list_user[$i]['total_value']?>$</span>

                                            <input type="hidden"  data-price_product="<?=$order_list_user[$i]['price']?>" id="productPrice_<?=$order_list_user[$i]['cart_id']?>">
                                        </td>
                                        <td>
                                            <input id="" class="delete-product removeFromCart" value="X" type="button" data-product="<?=$order_list_user[$i]['cart_id']?>" data-action="delete">

                                        </td>
                                    </tr>
                                <?php endfor ?>
                                </tbody>
                            </table>
                        </div>
                        <p style="padding: 20px 0"><?=UPSELL_TEXT?></p>
                        <div class="OrderTotal clear top bottom">
                            <a href="/checkout?personal=detail" class="menuButton top" >Continue to payment</a>
                            <span class="totalCartStart building-price">Total: <?= $total_sum_order?> USD</span>
                        </div>
                    </form>
                </div>

            </div>
        </section>
        <!-- more information -->
        <!-- more information end -->
        <?php else:?>
            <h1 style="text-align:center; height: 100vh;">Cart is empty</h1>
        <?php endif ?>
    </div>
    </div>

<?php require_once "footer.php"?>