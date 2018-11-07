<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php"?>
    <div class="col-md-9" id="right-cont-prof">

        <?php if(isset($_SESSION['message']['success'])):?>
            <div class="row">
                <div class="alert alert-success col-md-12">
                    <p><?=$_SESSION['message']['success']?></p>
                </div>
            </div>
        <?php endif;?>

        <?php if(isset($_SESSION['message']['error'])):?>
            <div class="row">
                <div class="alert alert-danger col-md-12">
                    <?=$_SESSION['message']['error']?>
                </div>
            </div>
        <?php endif;?>

        <h1>Статические стариницы сайта</h1>
        <div class="profile-option">
            <div class="block-form-profile">
                <?php if(isset($get_edit_pages)):?>
                    <table id="table-pages" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><h3>Наименование страницы</h3></th>
                                <th><h3>Управление стараницам</h3></th>
                            </tr>
                        </thead>
                            <tbody>
                            <?php for($i=0, $count=count($get_edit_pages); $i<$count; $i++):?>
                                <tr class=" pg-<?=$get_edit_pages[$i]['page_id']?>">
                                    <td>
                                           <p><?=$get_edit_pages[$i]['title']?></p>
                                    </td>
                                    <td>
                                        <a href="/admin/edit-pages/<?=$get_edit_pages[$i]['page_id']?>" class="btn btn-default btn-warning" >Редактировать</a>
                                        <a href="#" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-delete-pages" data-page="<?=$get_edit_pages[$i]['page_id']?>">Удалить</a>
                                        <button href="" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-success btn-show-pages b-s-p-<?=$get_edit_pages[$i]['page_id']?>" data-page="<?=$get_edit_pages[$i]['page_id']?>" <?php if($get_edit_pages[$i]['view'] == 1):?>disabled<?php endif?>>
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <button href="" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-default btn-danger btn-hide-pages b-h-p-<?=$get_edit_pages[$i]['page_id']?>" data-page="<?=$get_edit_pages[$i]['page_id']?>"  <?php if($get_edit_pages[$i]['view'] == 0):?>disabled<?php endif?>>
                                            <i class="fa fa-eye-slash"></i>
                                        </button>
                                    </td>
                                </tr>
                            <?php endfor?>
                            </tbody>
                    </table>
                    <script>
                        $(document).ready(function() {
                            $('#table-pages').DataTable();
                        } );
                    </script>
                <?php endif;?>
                <div class="row">
                    <div class="col-sm-4  col-sm-offset-4 btn-block-form" role="group" aria-label="...">
                        <a href="" id="add_pages" class="login-btn-form" >Добавить страницу</a>
                    </div>
                </div>
            </div>
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
                    <h4 class="modal-title">Редактирование страницы</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form id="form_action_page">
                            <h4 class="col-md-12 modal-title title-for-popup"></h4>
                            <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">

                                <input type="submit" class="login-btn-form" name="page_delete_submit" id="action-btn" value="Подтвердить">
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
    </section>
<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php require_once "footer.php"?>