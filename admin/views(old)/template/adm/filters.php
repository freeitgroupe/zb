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
                Фильтры для товара
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li class="active">Фильтры для товара</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-3">
                    <a href="/admin/edit-filter/new" class="btn btn-default">
                        <span class="fa fa-plus"></span> Добавить фильтр
                    </a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php if(isset($get_filters_admin)):?>
                                <table id="table-pages" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>                                   
                                        <th>Наименование</th>
                                        <th>Значение фильтра</th>
                                        <th>Управление</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php for($i=0, $count=count($get_filters_admin); $i<$count; $i++):?>
                                        <tr class=" pg-<?=$get_filters_admin[$i]['id']?>">
                                            <td id="list-filter<?=$get_filters_admin[$i]['id']?>">
                                               <?= $get_filters_admin[$i]['name']?>
                                            </td>
                                            <td>
                                                <?= $get_filters_admin[$i]['value_filter']?>
                                            </td>
                                            <td>
                                                <a href="/admin/edit-filter/<?=$get_filters_admin[$i]['id']?>" class="btn btn-default btn-warning" > <i class="fa fa-pencil"></i></a>
                                                <a href="#" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-delete-pages" data-page="<?=$get_filters_admin[$i]['id']?>">Удалить</a>
                                                <a href="#" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-rename-pages ed-<?=$get_filters_admin[$i]['id']?>" data-page="<?=$get_filters_admin[$i]['id']?>" data-title="<?= $get_filters_admin[$i]['name']?>">Переименовать</a>
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

                            <div class="rename-form col-md-12 form-group " style="display: none">
                                <label class="control-label" for="author_name">
                                    Наименование фильтра<sub>*</sub>:
                                </label>

                                <input type="text" id="filter_name" class="form-control profile-input" value="" name="filter_name" placeholder="" required>
                                <span id="helpBlock2" class="help-block" style="display: none"></span>
                            </div>


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

<?php //Модальное окно для редактирования листа желаний ?>
    <div id="modal-filter-edit" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title-filter">Редактирование данных</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form action="" method="post" id="form_edit_filter">
                            <div class="col-md-12 form-group">
                                <label class="control-label" for="author_name">Наименование фильтра<sub>*</sub>:</label>
                                <input type="text" id="filter_name" class="form-control profile-input" value="" name="filter_name" placeholder="" required>
                                <span id="helpBlock2" class="help-block" style="display: none"></span>
                            </div>

                            <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">
                                <input type="submit" class="login-btn-form" name="filter_edit_submit" id="filter_edit_submit" value="Отправить">
                                <input type="text" hidden id="edit_filter_id" name="edit_filter_id" value="0">
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



<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php require_once "footer.php"?>