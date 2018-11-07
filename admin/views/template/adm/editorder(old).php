<?php require_once "header.php"?>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <?php if(isset($_SESSION['message']['error'])):?>
            <div class="box-body">
                <div class="alert alert-warning alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p><i class="icon fa fa-check"></i> <?=$_SESSION['message']['error']?></p>
                </div>
            </div>
        <?php endif;?>

        <?php if(isset($_SESSION['message']['success'])):?>
            <div class="box-body">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p><i class="icon fa fa-check"></i> <?=$_SESSION['message']['success']?></p>
                </div>
            </div>
        <?php endif;?>

        <section class="content-header">
            <h1>
                Управление заказами
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li><a href="/admin/orders/">Категории товара</a></li>
                <li class="active">Редактирование</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php if($form_edit): ?>
                                <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data" id="form_edit_pages">
                                    <?php for($i=0, $count=count($form_edit); $i < $count; $i++):?>

                                        <div class="col-md-12 form-group">
                                            <?php if(isset($form_edit[$i]['label'])):?>
                                                <label
                                                    class="control-label"
                                                    for="<?=$form_edit[$i]['name_input']?>"
                                                ><?=$form_edit[$i]['label']?><em>*</em>:
                                                </label>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='input'):?>
                                                <input
                                                    type="text"
                                                    id="<?=$form_edit[$i]['name_input']?>"
                                                    class="form-control profile-input"
                                                    value="<?=$form_edit[$i]['value']?>"
                                                    name="<?=$form_edit[$i]['name_input']?>"
                                                    placeholder="<?=$form_edit[$i]['name_input']?>"
                                                    <?= isset($form_edit[$i]['required']) ? print $form_edit[$i]['required']:'';?>
                                                    <?php isset($form_edit[$i]['disabled']) ? print 'disabled':'';?>
                                                >
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='select'):?>
                                                <select
                                                    name="<?=$form_edit[$i]['name_input']?>"
                                                    id="<?=$form_edit[$i]['name_input']?>"
                                                >
                                                    <?php for($s=0, $count_s=count($form_edit[$i]['arr_param']); $s < $count_s; $s++):?>
                                                        <option
                                                            value="<?=$form_edit[$i]['arr_param'][$s]['id']?>"
                                                            <?php if($form_edit[$i]['value_selected'] == $form_edit[$i]['arr_param'][$s]['id']) echo 'selected'?>
                                                        >
                                                            <?=$form_edit[$i]['arr_param'][$s]['title']?>
                                                        </option>
                                                    <?php endfor; ?>
                                                </select>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type'] == 'textarea'):?>
                                                <textarea 
                                                    name="<?=$form_edit[$i]['name_input']?>" 
                                                    id="editckeditor" cols="30" rows="10">
                                                    <?=$form_edit[$i]['value']?>
                                                </textarea>
                                                
                                                <script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>    <!-- -->
                                                <script>
                                                    CKEDITOR.replace('editckeditor');
                                                </script>
                                            <?php endif;?>

                                            <?php if(isset($form_edit[$i]['helpblock'])):?>
                                                <span
                                                    id="helpBlock_title"
                                                    class="help-block"
                                                    style="display: none"
                                                >

                                                </span>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type'] == 'submit'):?>
                                                <div class="col-sm-4  col-sm-offset-4 btn-block-form" role="group" aria-label="...">
                                                    <input
                                                        type="<?=$form_edit[$i]['type']?>"
                                                        name="<?=$form_edit[$i]['name']?>"
                                                        id="<?=$form_edit[$i]['name']?>"
                                                        class="btn btn-block btn-success"
                                                        value="<?=$form_edit[$i]['value']?>"
                                                    >
                                                </div>
                                            <?php endif;?>
                                        </div>
                                    <?php endfor; ?>

                                </form>
                            <?php endif;?>
                        </div>

                        <?php // конструктор формы ?>
                        <div class="box-body">
                            <button class="" name="" id="createParam">Создать параметр</button>
                        </div>

                        <!-- /.box-body -->

                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->

        <?php if(isset($order_items_for_user)):?>
            <section class="content-header">
                <h1>
                    Содержание заказа
                </h1>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <!-- /.box-header -->
                            <div class="box-body">


                                <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data" id="prod_for_filter">
                                    <table id="table-pages_product" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Артикул товара</th>
                                            <th>Наименование товара</th>
                                            <th>Количество</th>
                                            <th>Цена за единицу</th>
                                            <th>Итого</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php for($i=0, $total_sum='', $count=count($order_items_for_user); $i<$count; $i++):?>
                                            <tr class=" pg-<?=$order_items_for_user[$i]['id']?>">
                                                <td>
                                                    <?= $order_items_for_user[$i]['article_number']?>
                                                </td>
                                                <td>
                                                    <?= $order_items_for_user[$i]['title']?>
                                                </td>
                                                <td>
                                                    <label>
                                                        <div class="input-group input-group-sm">
                                                            <input
                                                                type="text"
                                                                id="val-qty-<?=$order_items_for_user[$i]['id']?>"
                                                                class="form-control"
                                                                value="<?=$order_items_for_user[$i]['qty_item']?>"
                                                            >
                                                        <span class="input-group-btn">
                                                          <a
                                                              type="button"
                                                              class="new-qty btn btn-info btn-flat"
                                                              data-target="#modal-pages-action"
                                                              data-page="<?=$order_items_for_user[$i]['id']?>"
                                                              data-order-id="<?=$order_items_for_user[$i]['order_id']?>"
                                                              data-toggle="modal">Go!</a>
                                                        </span>
                                                        </div>
                                                    </label>
                                                </td>
                                                <td>
                                                    <?=$order_items_for_user[$i]['price']?>
                                                </td>
                                                <td>
                                                    <p class="td-summ-<?=$order_items_for_user[$i]['id']?>"><?=$order_items_for_user[$i]['sum_item']?></p>
                                                </td>
                                                <td>
                                                    <a href="#"
                                                       data-toggle="modal"
                                                       data-target="#modal-pages-action"
                                                       class="btn btn-default btn-danger btn-delete-pages"
                                                       data-page="<?=$order_items_for_user[$i]['id']?>">Удалить</a>
                                                </td>
                                            </tr>
                                            <?php $total_sum += $order_items_for_user[$i]['sum_item']  ?>
                                        <?php endfor?>
                                        <tr>
                                            <td colspan="3" class="text-right">Общая стотимость:</td>
                                            <td colspan="3" class="total-sum"><?=number_format($total_sum, 2,',', ' ') . $currency?></td>
                                        </tr>
                                        </tbody>
                                    </table>

                                    <div class="col-sm-4  col-sm-offset-4 btn-block-form" role="group" aria-label="...">

                                        <input
                                            type="submit"
                                            name="filter_for_cat__success"
                                            id="filter_for_cat__success"
                                            class="btn btn-block btn-success"
                                            value="Подтвердить"
                                        >
                                    </div>
                                </form>

                            </div>
                            <!-- /.box-body -->
                        </div>

                    </div>
                    <!-- /.col -->
                </div>
            </section>
        <?php endif;?>
    </div>
    <!-- /.content-wrapper -->

<?php //Модальное окно для удаления страницы, скрытие на фронтэнде, отображение на фронтэнде ?>
    <div id="modal-pages-action" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Редактирование</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form id="form_action_page">
                            <h4 class="col-md-12 modal-title title-for-popup"></h4>
                            <div class="col-sm-4 col-sm-offset-4 btn-block-form text-center" role="group" aria-label="...">

                                <input type="submit" class="btn btn-success" align="center" name="page_delete_submit" id="action-btn" value="Подтвердить">
                                <input type="text" hidden id="processed-page" name="" value="">
                                <input type="text" hidden id="processed-page-param-1" name="" value="">
                                <input type="text" hidden id="processed-page-param-2" name="" value="">

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

<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once "footer.php"?>