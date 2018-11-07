<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>
    <!-- main page content -->
    <!-- single page content -->
    <!-- single page content -->
    <div class="emraceFull">
        <div class="embrace clear singlePage">
            <div class="breadCrumbs clear">
                <?=$breadcrumbs?>
            </div>
            <section class="singleBox stepTwo top clear part-one"><!--                <h3>Checkout</h3>-->

                <div class="">
                    <div class="detail-info">
                        <?php if(isset($_GET['personal']) && isset($total_sum_order) && $total_sum_order >= MIN_SUM_ORDER):?>
                        <div class="cartDiscount">
                            <input type="text" placeholder="Enter discount code">
                            <button class="menuButton top">Apply</button>
                            <span class="totalCartStart">Total: <?= $total_sum_order . $currency?></span>
                        </div>
                        <?php if(isset($_SESSION['message']['error'])):?>
                            <p class="notice" id="err"><?=$_SESSION['message']['error']?></p>
                        <?php endif?>
                        <h3>Checkout</h3>
                        <form  method="post" id="confirm-form">
                            <div class="personlaCartInformation top bottom clear">
                                <h4>Personal information</h4>
                                <input type="text" class="top" value="<?=$_SESSION['cart']['cart_name']?>" name="name" id="name" placeholder="Your name">
                                <input type="hidden" name="confirm_type_1" value="confirm_type_1">
                                <?php if(isset($_SESSION['auth'])) :?>
                                <input type="hidden" name="id" value="<?=$_SESSION['cart']['cart_id']?>">
                                <?php endif ?>
                                <input type="hidden" name="csrf_token" value="<?=$_SESSION['csrf_token']?>">
                                <input type="text" class="top" value="<?=$_SESSION['cart']['cart_email']?>" id="email" name="email"  placeholder="Email">
                                <input type="text" class="top" name="phone" value="<?=$_SESSION['cart']['cart_phone']?>" placeholder="Phone number" id="phone">
                                <button type="button" class="confirm_type_1 menuButton top" name="confirm_type_1" id="confirm_type_1">Next step</button>
                            </div>
                        </form>
                    </div>

                    <div class="detail-delivery" style="display: none">
                        <form id="confirm-form_1" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="csrf_token" value="<?=$_SESSION['csrf_token']?>">
                            <input type="hidden" name="confirm_type_2" value="confirm_type_2">
                            <div class="personlaCartInformation top bottom clear">
                                <h4>Delivery</h4>
                                <textarea class="top" type="text" placeholder="address" name="cart_address" id="cart_address"><?=$_SESSION['cart']['cart_address']?></textarea>
                                <input type="text" class="top" name="zipcode" value="" placeholder="zipcode" id="zipcode">
                                <textarea class="top" type="text" placeholder="Special instructions. Where to go, who is responsible and how to find the right people. Write down the phone numbers of those responsible for the receipt." name="note" id="note"><?=$_SESSION['cart']['cart_note']?></textarea>

                                <?php  if($delivery):?>
                                    <?php foreach ( $delivery as $item):?>
                                        <div class="block-input">
                                            <input type="radio" id="tag-radio-defUser" name="delivery" value="<?=$item['id']?>" class="stl" <?php if(isset($_SESSION['cart']['cart_delivery']) && $_SESSION['cart']['cart_delivery'] == $item['id']):?>checked<?php else: if($item['id'] == 3){echo 'checked';}?><?php endif ?> >
                                            <label for="tag-radio-defUser" class="stl stl-right">
                                                <span><?=$item['title']?></span>
                                            </label>
                                        </div>
                                    <?php endforeach;?>
                                <?php endif?>
                                <button type="button" class="back_to_type_1 menuButton top" >Prev step</button>
                                <button type="button" class="confirm_type_2 menuButton top" name="confirm_type_2" id="confirm_type_2">Next step</button>
                            </div>
                        </form>
                    </div>

                    <div class="detail-pay" style="display: none">
                        <?php /* ?>
                        <form method="post" id="confirm-form_2">
                            <input type="hidden" name="csrf_token" value="<?=$_SESSION['csrf_token']?>">
                            <input type="hidden" name="confirm_type_final" value="confirm_type_final">
                            <div class="personlaCartInformation top bottom clear">

                                <?php   if($pay):?>
                                        <h4>Pay systems</h4>
                                    <?php foreach ( $pay as $item):?>
                                       <div class="block-input">
                                           <input type="radio" id="tag-radio-pay-defUser" name="pay" value="<?=$item['id']?>" class="stl" <?php if(isset($_SESSION['cart_pay']) && $_SESSION['cart_pay'] == $item['id']):?>checked<?php else: if($item['id'] == 1){echo 'checked';}?><?php endif ?> >
                                           <label for="tag-radio-pay-defUser_<?=$item['id']?>" class="stl stl-right">
                                               <span> <?=$item['title']?></span>
                                           </label>
                                       </div>
                                    <?php endforeach;?>
                                <?php endif; ?>
<!--                                <button type="button" class="back_to_type_2 menuButton top">Prev step</button>-->
<!--                                <button type="button" class="confirm_type_final menuButton top" name="confirm_type_final" id="confirm_type_final">Continue</button>-->

                            </div>
                        </form>
                        <?php */ ?>

                        <div class="personlaCartInformation top bottom clear">
                            <h4>Delivery</h4>
                            <div class="cartDlvAddr">
                                <p class="nameInfo">Name : <?=$_SESSION['cart']['cart_name']?></p>
                                <p class="addressInfo">Address : <?=$_SESSION['cart']['cart_address']?></p>
                                <p class="zipcodeInfo">ZipCode: <?=$_SESSION['cart']['cart_zipcode']?></p>
                                <p class="phoneInfo">Phone : <?=$_SESSION['cart']['cart_phone']?></p>
                                <p class="emailInfo">Email : <?=$_SESSION['cart']['cart_email']?></p>
                            </div>
                        </div>

                        <?php if(isset($order_list_user) && $order_list_user > false): ?>
                            <section class="singleBox top clear">
                                <div class="cartStartBox">
                                    <h3>Your order</h3>
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
                                                                <input type="text" class="cart_quantity_input form-control count" value="<?=$order_list_user[$i]['cart_count']?>" data-product="<?=$order_list_user[$i]['cart_id']?>" data-action="quantity" id="cart_quantity_id_<?=$order_list_user[$i]['cart_id']?>" name="quantity" disabled>
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
                                                        </tr>
                                                    <?php endfor ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="OrderTotal clear top bottom">
                                                <a href="/cart" class="menuButton top" >Edit cart</a>
                                                <span class="totalCartStart building-price">Total: <?= $total_sum_order?> USD</span>
                                                <span class="totalRate totalCartStart"></span>
                                            </div>
                                        </form>
                                        <div class="OrderTotal clear top bottom">
                                            <form action="<?php echo PAYPAL_URL; ?>" method="post">
                                                <!-- Identify your business so that you can collect the payments. -->
                                                <input type="hidden" name="business" value="<?php echo PAYPAL_ID; ?>">
                                                <!-- Specify a Buy Now button. -->
                                                <input type="hidden" name="cmd" value="_xclick">
                                                <input type="hidden" name="currency_code" value="USD">
                                                <!-- Specify URLs -->
                                                <input type='hidden' name='cancel_return' value="<?=CANCEL?>">
                                                <input type='hidden' name='return' value="<?=SUCCESS?>">
                                                <input type="hidden" name="upload" value="1">
                                                <!-- Specify details about the item that buyers will purchase. -->
                                            <?php $z=1 ?>
                                            <?php for($i = 0, $count = count($order_list_user); $i < $count; $i++):?>
                                                <input type="hidden" name="item_name_<?=$z?>" value="<?=$order_list_user[$i]['title']?>">
                                                <input type="hidden" name="item_number_<?=$z?>" value="<?=$order_list_user[$i]['id']?>">
                                                <input type="hidden" name="quantity_<?=$z?>" value="<?=$order_list_user[$i]['cart_count']?>" />
                                                <input type="hidden" name="amount_<?=$z?>" value="<?php echo $order_list_user[$i]['price']; ?>">
                                            <?php $z++ ?>
                                            <?php endfor;?>
                                                <!-- Display the payment button. -->
                                                <input type="image" name="submit" border="0"
                                                       src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
                                                <img alt="" border="0" width="1" height="1" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >
                                            </form>
                                            <form method="post" id="confirm-form_2">
                                                <input type="hidden" name="csrf_token" value="<?=$_SESSION['csrf_token']?>">
                                                <input type="hidden" name="confirm_type_final" value="confirm_type_final">
                                                    <button type="button" class="confirm_type_final menuButton top" name="confirm_type_final" id="confirm_type_final">Offline Buy</button>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- more information -->

                            <!-- more information end -->
                        <?php else:?>
                            <h1 style="text-align:center; height: 100vh;">Cart is empty</h1>
                        <?php endif ?>

                    </div>
                    <p class="notice" id="helpBlock2"></p>
                    <div style="text-align:center; height: 100vh; display: none" id="mess-confirm"></div>
                </div>
                 <?php else:?>
                    <h1 style="text-align:center; height: 100vh;">Cart is empty or total order less than minimal order(<?=MIN_SUM_ORDER .' '. $currency?>)</h1>
                <?php endif;?>
            </section>
        </div>
    </div>
    <!-- single page content end -->

<?php require_once "footer.php" ?>