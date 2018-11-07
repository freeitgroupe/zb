<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
    <!-- Content Wrapper. Contains page content -->
        <div class="contentBox clear">
            <h2>Search filter<i class="icons">search</i></h2>
            <form action="<?=$_SERVER['REQUEST_URI']?>" method="get">
                <div class="fist clear">
                    <div class="boxOneThird clear">
                        <input class="bottom" type="datetime-local" placeholder="Date from" name="created_at[]">
                        <input class="bottom" type="datetime-local" placeholder="Date to" name="created_at[]">
                        <input type="text" placeholder="Manager Name" name="manager_name">
                    </div>
                    <div class="boxOneThird clear">
                        <input class="bottom" type="number" min="0" placeholder="Amount from" name="sum[]">
                        <input class="bottom" type="number" max="100000" placeholder="Amount to" name="sum[]">
                        <select name="order_status" name="status">
                            <?php foreach ($order_status as $item):?>
                                <option value="<?=$item['param_status']?>"><?=$item['title']?></option>
                            <?php endforeach?>
                        </select>
                    </div>
                    <div class="boxOneThird clear">
                        <input class="bottom" type="text" placeholder="Client Name" name="name">
                        <input type="text" placeholder="Phone nums" name="phone">
                    </div>
                </div>
                <input type="submit" value="Search" class="fat" name="searchButton">
                <a href="/admin/orders-options">Reset</a>
            </form>
        </div>
        <div class="contentBox clear">
            <h2>Order list<i class="icons">assignment</i></h2>
            <div class="tableBox clear">
                <table>
                    <tbody>
                    <tr>
                        <th>Rate</th>
                        <th>Text</th>
                        <th>+</th>
                        <th>-</th>
                        <th>Answer</th>
                        <th>Edit status</th>
                        <th>Delete</th>
                        <th>Detail</th>
                    </tr>
                    <?php if(isset($get_comments_admin)):?>
                        <?php foreach ($get_comments_admin as $item):?>
                            <tr>
                                <td><?=$item['id']?></td>
                                <td><?=$item['comment_text']?></td>
                                <td><?=$item['comment_good']?></td>
                                <td><?=$item['comment_bad']?></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><a href="/admin/edit-comment/<?=$item['id']?>" title="edit"><i class="icons">settings</i></a></td>
                            </tr>
                        <?php endforeach;?>
                    <?php endif;?>
                    </tbody>
                </table>
            </div>
            <div class="pageNavigation clear">
                <div class="fist clear">
                    <div class="boxOneThird">
                        <h3>Page navigation</h3>
                        <?=$pagination?>
                    </div>
                </div>
            </div>
        </div>

<?php //Модальное окно для удаления страницы, скрытие на фронтэнде, отображение на фронтэнде ?>
    <div id="modal-pages-action" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Редактирование категории</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form id="form_action_page">
                            <h4 class="col-md-12 modal-title title-for-popup"></h4>
                            <div class="col-sm-4 col-sm-offset-4 btn-block-form text-center" role="group" aria-label="...">

                                <input type="submit" class="btn btn-success" align="center" name="page_delete_submit" id="action-btn" value="Подтвердить">
                                <input type="text" hidden id="processed-page" name="pages-delete" value="">

                                <p align="center" class="loading-gif">
                                    <img src="/img/loading.gif">
                                </p>
                            </div>
                        </form>
                        <div class="col-md-12 success-edit" style="display: none">
                            <div class="modal-header center" style="text-align: center">
                                <img src="/img/cart_deal.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->
<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['filter'])){unset($_SESSION['filter']);}?>
<?php require_once "footer.php"?>