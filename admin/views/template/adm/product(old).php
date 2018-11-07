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
                Категории для товара
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li class="active">Категории для товара</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-3">
                    <a href="/admin/edit-product/new" class="btn btn-default">
                        <span class="fa fa-plus"></span> Добавить продукт
                    </a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php if(isset($get_product_admin)):?>
                                <table id="table-pages" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Фото</th>
                                        <th>Наименование</th>
                                        <th>Цена на сайте</th>
                                        <th>Количество</th>
                                        <th>Управление</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php for($i=0, $count=count($get_product_admin); $i<$count; $i++):?>
                                        <tr class=" pg-<?=$get_product_admin[$i]['id']?>">
                                            <td><img src="<?=PROD_IMG. $get_product_admin[$i]['image']?>" alt="" width="50" height="50" /></td>
                                            <td>
                                                <?= $get_product_admin[$i]['title']?>
                                            </td>
                                            <td>
                                                <?= $get_product_admin[$i]['price']?>
                                            </td>
                                            <td>
                                                <?= $get_product_admin[$i]['stock']?>
                                            </td>
                                            <td>
                                                <a href="/admin/edit-product/<?=$get_product_admin[$i]['id']?>" class="btn btn-default btn-warning" > <i class="fa fa-pencil"></i></a>
                                                <a href="#" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-delete-pages" data-page="<?=$get_product_admin[$i]['id']?>">Удалить</a>
                                                <button href="" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-success btn-show-pages b-s-p-<?=$get_product_admin[$i]['id']?>" data-page="<?=$get_product_admin[$i]['id']?>" <?php if($get_product_admin[$i]['visible'] == 1):?>disabled<?php endif?>>
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <button href="" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-hide-pages b-h-p-<?=$get_product_admin[$i]['id']?>" data-page="<?=$get_product_admin[$i]['id']?>"  <?php if($get_product_admin[$i]['visible'] == 0):?>disabled<?php endif?>>
                                                    <i class="fa fa-eye-slash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endfor?>
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
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once "footer.php"?>