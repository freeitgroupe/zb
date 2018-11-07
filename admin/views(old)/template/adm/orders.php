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
                Список заказов
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li class="active">Заказы</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-3">
                    <a href="/admin/orders/new" class="btn btn-default">
                        <span class="fa fa-plus"></span> Создать заказ
                    </a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php if(isset($get_orders_admin) && $get_orders_admin > false):?>
                                <table id="table-pages" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>№ Заказа</th>
                                        <th>Клиент</th>
                                        <th>Статус</th>
                                        <th>Итого</th>
                                        <th>Дата добавления</th>
                                        <th>Дата изменения</th>
                                        <th>Действие</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach($get_orders_admin as $item):?>
                                        <tr class="pg-<?=$item['id']?>">
                                            <td>
                                                <p><?=$item['id']?></p>
                                            </td>
                                            <td>
                                                <p><?=$item['name']?></p>
                                            </td>
                                            <td>
                                                <p>
                                                    <?php
                                                    for($z=0, $count=count($order_status); $z<$count; $z++)
                                                    {
                                                        if($item['status'] == $order_status[$z]['id'])
                                                        {
                                                            echo "{$order_status[$z]['title']}";
                                                            break;
                                                        }
                                                    }

                                                    ?>
                                                </p>
                                            </td>
                                            <td>
                                                <p><?=$item['sum']?></p>
                                            </td>
                                            <td>
                                                <p><?=$item['created_at']?></p>
                                            </td>
                                            <td>
                                                <p><?=$item['updated_at']?></p>
                                            </td>
                                            <td>
                                                <a href="/admin/orders-detail/<?=$item['id']?>" class="btn btn-default btn-success">Просмотр</a>
                                                <a href="/admin/edit-order/<?=$item['id']?>" class="btn btn-default btn-warning">Редактировать</a>
                                                
                                            </td>
                                        </tr>
                                    <?php endforeach?>
                                    </tbody>
                                </table>

                                <div class="col-md-12 text-center">
                                    <?php if($count_pages > 1 ): ?>
                                        <?=$pagination?>
                                    <?php endif; ?>
                                </div>

                            <?php endif;?>
                        </div>
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
<?php require_once "footer.php"?>