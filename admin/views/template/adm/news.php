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
                Новости
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li class="active"> Новости</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-3">
                    <a href="/admin/edit-news/new" class="btn btn-default">
                        <span class="fa fa-plus"></span> Добавить новости
                    </a>
                </div>
            </div>
            <br>

            <div class="row">
                <?php if($get_news_admin): ?>
                      <?php //debug_arr($get_news_admin)?>

                    <?php for($i=0, $count=count($get_news_admin); $i<$count; $i++):?>
                        <div class="col-md-6">
                            <div class="col-xs-12 pg-<?=$get_news_admin[$i]['id']?>">
                                <div class="box box-widget">
                                    <div class="box-header with-border">
                                        <div class="user-block">
                                            <img class="direct-chat-img" src="<?=PATH_ADMIN?>include/dist/img/default-50x50.gif" alt="Message User Image">
                                            <span class="username"><a href="#"><?=$get_news_admin[$i]['author']?></a></span>
                                            <span class="description">Опубликована - <?=$get_news_admin[$i]['date']?></span>
                                        </div>
                                        <div class="box-tools">
                                            <a href="/admin/edit-news/<?=$get_news_admin[$i]['id']?>" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Редактировать">
                                                <i class="fa fa-edit fa-lg"></i>
                                            </a>

                                            <a href="#" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-box-tool btn-delete-pages" data-page="<?=$get_news_admin[$i]['id']?>"  title="" data-original-title="Удаление">
                                                <i class="fa fa-remove fa-lg"></i>
                                            </a>

                                            <button data-toggle="modal" data-target="#modal-pages-action" class="btn btn-box-tool btn-show-pages b-s-p-<?=$get_news_admin[$i]['id']?>" data-page="<?=$get_news_admin[$i]['id']?>" <?php if($get_news_admin[$i]['view'] == 1):?>disabled<?php endif?>>
                                                <i class="fa fa-eye"></i>
                                            </button>

                                            <button href="" data-toggle="modal" data-target="#modal-pages-action" class="btn btn-box-tool btn-hide-pages b-h-p-<?=$get_news_admin[$i]['id']?>" data-page="<?=$get_news_admin[$i]['id']?>"  <?php if($get_news_admin[$i]['view'] == 0):?>disabled<?php endif?>>
                                                <i class="fa fa-eye-slash"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- /.box-header -->
                                    <div class="box-body" style="">
                                        <img class="img-responsive pad" src="<?=NEWS_IMG . $get_news_admin[$i]['img']?>" alt="">
                                        <h4 class="attachment-heading">
                                            <a href="/admin/edit-news/<?=$get_news_admin[$i]['id']?>"><?=$get_news_admin[$i]['title']?></a>
                                        </h4>
                                        <p>
                                            <?= get_cut_text($get_news_admin[$i]['description']) ?>
                                        </p>
                                    </div>
                                    <!-- /.box-body -->

                                </div>
                            </div>
                        </div>
                        <?php endfor?>

                        <div class="col-md-12 text-center">
                            <?php if($count_pages > 1 ): ?>
                             <?=$pagination?>
                            <?php endif; ?>
                        </div>

                    <?php endif;?>
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->
<?php //Модальное окно для удаления новости, скрытие на фронтэнде, отображение на фронтэнде ?>
    <div id="modal-pages-action" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Редактирование новости</h4>
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


<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){ unset($_SESSION['data']);}?>
<?php require_once "footer.php"?>