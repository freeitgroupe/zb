<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
    <div class="contentBox clear">
        <h2>Edit Order #<?=$order_user_for_edit['id']?><i class="icons fat">mode_edit</i></h2>
        <div class="fist clear">
            <div class="boxOneThird clear">
                <h3>Main information</h3>
                <p><span class="infoHeading">Order number :</span> <?=$order_user_for_edit['id']?></p>
                <p><span class="infoHeading">Order last update :</span> <?=$order_user_for_edit['updated_at']?></p>
                <p><span class="infoHeading">Manager :</span> <?=$order_user_for_edit['manager_name']?></p>
            </div>
            <div class="boxOneThird clear">
                <h3>Client information</h3>
                <p><span class="infoHeading">Date :</span> <?=$order_user_for_edit['created_at']?></p>
                <p><span class="infoHeading">Client :</span> <?=$order_user_for_edit['name']?></p>
                <p><span class="infoHeading">Email :</span> <?=$order_user_for_edit['email']?></p>
                <p><span class="infoHeading">Total :</span> <span class="total-sum"><?=$order_user_for_edit['sum'] . $currency?></span></p>

            </div>
            <div class="boxOneThird clear">
                <h3>Instructions</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam praesentium, eum nulla sint dicta molestiae nisi delectus dolore nostrum assumenda, minima, neque expedita possimus aut! Omnis nihil explicabo rem asperiores, quod deserunt, distinctio, nisi qui ex atque culpa soluta et.</p>
            </div>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Manage<i class="icons fat">perm_identity</i></h2>
        <div class="fist clear">
            <div class="boxOneThird clear">
                <h3>Manager comments</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga quod dolorem dolorum, labore laboriosam aliquam repudiandae ad modi. Natus eos rerum dolores consequuntur temporibus labore illo nemo vel pariatur quo!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, omnis.</p>
            </div>
            <div class="boxOneThird clear">
                <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
                    <h3>Add comment</h3>
                    <textarea placeholder="Add comment" name="message"></textarea>
                    <input class="top" type="Submit"  name="add_comment" value="Add Comment">
                </form>
            </div>
            <div class="boxOneThird" style="max-height: 300px;overflow-y: scroll;">
                <h3>Update information</h3>
                <div class="log-record">
                    <?php if(is_array($log_for_order)):?>
                        <?php foreach ($log_for_order as $item):?>
                            <p><?=$item['message']?></p>
                        <?php endforeach;?>
                    <?php else:?>
                        <?=$log_for_order?>
                    <?php endif?>
                </div>
            </div>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Order list<i class="icons">dvr</i></h2>
        <div class="fist clear full">
                <div class="boxOne clear">
                    <table>
                        <tbody>
                        <tr>
                            <th>Name</th>
                            <th>Qty</th>
                            <th>Delete</th>
                        </tr>
                        <?php if($order_items_for_user):?>
                            <?php foreach ($order_items_for_user as $item):?>
                                <tr class=" pg-<?=$item['id']?>">
                                    <td>
                                        <a href="/product/<?=$item['alias'] ?>" target="_blank"><?=$item['title']?></a>
                                    </td>
                                    <td>
                                        <div class="input-group input-group-sm">
                                        <input
                                        type="text"
                                        id="val-qty-<?=$item['id']?>"
                                        class="form-control"
                                        value="<?=$item['qty_item']?>"
                                        >
                                        <span class="input-group-btn">
                                        <a
                                              type="button"
                                              class="new-qty btn btn-info btn-flat trigger-order"
                                              data-page="<?=$item['id']?>"
                                              data-order-id="<?=$item['order_id']?>"

                                        >Go
                                        </a>
                                        </span>
                                        </div>
                                    </td>
                                    <td>
                                        <a
                                           href="#"
                                           class="btn btn-delete-pages trigger-order"
                                           data-page="<?=$item['id']?>"
                                        ><i class="icons delete">delete</i>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach;?>
                        <?php endif;?>
                        </tbody>
                    </table>
                </div>

        </div>
    </div>
    <div class="contentBox clear">
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
            <div class="boxOneThird clear">
                <h3>Edit status</h3>
                <select name="order_status">
                    <?php if($order_status):?>
                        <?php foreach ($order_status as $item):?>
                            <option value="<?=$item['param_status']?>" <?php $order_user_for_edit['order_status_id'] == $item['param_status'] ? print 'selected':'';?>><?=$item['title']?></option>
                        <?php endforeach;?>
                        <?php echo 'err_order_status';?>
                    <?php endif;?>
                </select>
                <input class="top" type="Submit" name="update_status" value="Update order">
            </div>
        </form>
    </div>
    <div class="modal" id="modal-edit-order" style="display: none">
       <form id="form_action_page">
            <h4 class="col-md-12 modal-title title-for-popup"></h4>
            <div class="col-sm-4 col-sm-offset-4 btn-block-form text-center" role="group" aria-label="...">

                <input type="submit" class="btn btn-success" align="center" name="page_delete_submit" id="action-btn" value="Confirm">
                <input type="text" hidden id="processed-page" name="" value="">
                <input type="text" hidden id="processed-page-param-1" name="" value="">
                <input type="text" hidden id="processed-page-param-2" name="" value="">

                <p align="center" class="loading-gif">
                    <img src="/images/loading.gif">
                </p>
            </div>
        </form>


        <div class="col-md-12 success-edit" style="display: none">
            <div class="modal-header center" style="text-align: center">
                <img src="/images/cart_deal.png" alt="">
            </div>
        </div>
        <div class="col-md-12 success-err text-center" style="display: none">
            <h4 class="modal-title-err-mess text-center"></h4>
            <div class="modal-header center" style="text-align: center">
                <img src="/images/icn_wrng.png" alt="">
            </div>
        </div>
    </div>
<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php require_once "footer.php"?>