<?php require_once "header.php"?>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <?php if(isset($_SESSION['message']['success'])):?>
            <div class="box-body">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p><i class="icon fa fa-check"></i> <?=$_SESSION['message']['success']?></p>
                </div>
            </div>
        <?php endif;?>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Информация о заказе
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li class="active">Информация о заказе</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">

                <div class="col-xs-4">
                    <div class="box">
                        <div class="box-header">
                            <h2 class="box-title"><i class="fa fa-shopping-cart"></i> Заказ</h2>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tbody>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Магазин">
                                            <i class="fa fa-shopping-cart"></i>
                                        </button>
                                    </td>
                                    <td><?=SITE_NAME?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Дата заказа">
                                            <i class="fa fa-calendar"></i>
                                        </button>
                                    </td>
                                    <td><?=$get_one_orders_admin['created_at']?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Способ оплаты">
                                            <i class="fa fa-credit-card"></i>
                                        </button>
                                    </td>
                                    <td><?= title_delivery($get_one_orders_admin['type_pay']) ?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Способ доставки">
                                            <i class="fa fa-truck"></i>
                                        </button>
                                    </td>
                                    <td><?= title_pay($get_one_orders_admin['type_pay']) ?></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>

                <div class="col-xs-4">
                    <div class="box">
                        <div class="box-header">
                            <h2 class="box-title"><i class="fa fa-shopping-cart"></i> Клиент</h2>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tbody>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Имя клиента">
                                            <i class="fa fa-user"></i>
                                        </button>
                                    </td>
                                    <td><?=$get_one_orders_admin['name']?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Группа пользователя">
                                            <i class="fa fa-group"></i>
                                        </button>
                                    </td>
                                    <td><?=title_type_user($get_one_orders_admin['user_id'])?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Email пользователя">
                                            <i class="fa fa-envelope-o"></i>
                                        </button>
                                    </td>
                                    <td><?=$get_one_orders_admin['email']?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button
                                            data-toggle="tooltip"
                                            title=""
                                            class="btn btn-info"
                                            data-original-title="Телефон пользователя">
                                            <i class="fa fa-phone"></i>
                                        </button>
                                    </td>
                                    <td><?= $get_one_orders_admin['phone']?></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>

                <div class="col-xs-4">
                    <div class="box">
                        <div class="box">
                            <div class="box-header">
                                <h2 class="box-title"><i class="fa fa-shopping-cart"></i>
                                    Дополнительная информация
                                </h2>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-condensed">
                                    <tbody>
                                    <tr>
                                        <td>
                                            Бонусные баллы
                                        </td>
                                        <td>0</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>

                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h2 class="box-title">
                                <i class="fa fa fa-info-circle"></i>
                                Детали заказа № <?=$get_one_orders_admin['id']?>
                            </h2>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td style="width: 50%;" class="text-left">
                                            Адрес доставки
                                        </td>
                                        <td style="width: 50%;" class="text-left">
                                            Комментарий к заказу:
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left">
                                        <?=$get_one_orders_admin['name']?><br>
                                        Адрес:<br>
                                        <?=$get_one_orders_admin['address']?><br>
                                    </td>
                                    <td style="width: 50%;" class="text-left">
                                        <?=$get_one_orders_admin['note'] > false ? print $get_one_orders_admin['note'] : 'Пусто' ?><br>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>

                    <div class="box">
                        <div class="box-header">
                            <h2 class="box-title">
                                <i class="fa fa fa-info-circle"></i>
                                Информация о товаре
                            </h2>
                        </div>
                        <!-- /.box-header -->
                        <?php if(isset($get_one_orders_product_info)):?>
                        <div class="box-body no-padding">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <td class="text-left">Товар</td>
                                    <td class="text-left">Артикул товара</td>
                                    <td class="text-right">Количество</td>
                                    <td class="text-right">Цена за единицу</td>
                                    <td class="text-right">Итого</td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php for($i=0, $count = count($get_one_orders_product_info); $i < $count; $i++):?>
                                <tr>
                                    <td class="text-left">
                                        <a href="/product/<?=$get_one_orders_product_info[$i]['product_id']?>" target="_blank">
                                      <?=$get_one_orders_product_info[$i]['title']?>
                                        </a>
                                        <br>
                                    </td>
                                    <td class="text-left"><?=$get_one_orders_product_info[$i]['article_number']?></td>
                                    <td class="text-right"><?=$get_one_orders_product_info[$i]['qty_item']?></td>
                                    <td class="text-right"><?=$get_one_orders_product_info[$i]['price']?></td>
                                    <td class="text-right"><?=$get_one_orders_product_info[$i]['sum_item']?></td>
                                </tr>
                                <?php endfor; ?>

                                <tr>
                                    <td colspan="4" class="text-right">Итого: </td>
                                    <td class="text-right"><?=$get_one_orders_admin['sum']?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                            <?php else: ?>
                            Товар не найден
                        <?php endif;?>
                        <!-- /.box-body -->
                    </div>




                </div>
                <!-- /.col -->
                
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
<?php //Модальное окно для удаления страницы, скрытие на фронтэнде, отображение на фронтэнде ?>
    <div id="modal-pages-action" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Редактирование данных</h4>
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
                        <div class="col-md-12 success-err text-center" style="display: none">
                            <h4 class="modal-title-err-mess text-center"></h4>
                            <div class="modal-header center" style="text-align: center">
                                <img src="/img/icn_wrng.png" alt="">
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
<?php require_once "footer.php"?>