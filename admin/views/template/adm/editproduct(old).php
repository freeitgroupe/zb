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
                Управление категориями товара
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li><a href="/admin/category-product-options/">Категории товара</a></li>
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

                                            <?php if($form_edit[$i]['type'] == 'img'):?>
                                                <label
                                                    class="control-label"

                                                >Фото<em>*</em>:
                                                </label>
                                                <img
                                                    class=""
                                                    src="<?=PROD_IMG . $form_edit[$i]['src']?>"
                                                    width="200"
                                                >
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='file'):?>
                                                <input
                                                    type="file"
                                                    class="form-group"
                                                    name="file"
                                                >
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type'] == 'file_gallery'):?>
                                                </br>
                                                <?php 
                                                    $arr = explode("|", $form_edit[$i]['src']);
                                                    $arr = array_diff($arr,['']);
                                                ?>
                                                <?php foreach($arr as $item):?>
                                                    <div class="gallery-block pg-<?=str_replace('.','_',$item)?>">
                                                        <span
                                                            class="btn-delete-pages toggle-fl-icon-delete"
                                                            data-name-file="<?=$item?>"
                                                            data-page = "<?=$form_edit[$i]['product_id']?>"
                                                            data-toggle="modal"
                                                            data-target="#modal-pages-action"
                                                        >
                                                            <i class="fa fa-close"></i>
                                                        </span>
                                                        <img class="" src="<?=GALLERY_IMG .  $item?>" width="150" height="150"/>
                                                    </div>
                                                <?php endforeach;?>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='file_gallery_new'):?>

                                                <div class="image-preview form-group col-md-12">
                                                    <img id="preview" src="" alt="">
                                                </div>

                                                <div id="btnimg">
                                                    <div>
                                                        <input
                                                            type="file"
                                                            class="form-group"
                                                            name="<?=$form_edit[$i]['name_input'] ?>"
                                                            id="gallery_img"
                                                            multiple
                                                        >
                                                    </div>
                                                </div>
                                                <a class="btn btn-success" id="add">Добавить поле</a>
                                                <a class="btn btn-warning" id="del">Удалить поле</a>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='select'):?>
                                                <select
                                                    name="<?=$form_edit[$i]['name_input']?>"
                                                    id="<?=$form_edit[$i]['name_input']?>"
                                                >
                                                    <?php for($s=0, $count_s=count($form_edit[$i]['option_value']); $s < $count_s; $s++):?>
                                                        <option
                                                            value="<?=$form_edit[$i]['option_value'][$s]?>"
                                                            <?php if($form_edit[$i]['value_selected'] == $form_edit[$i]['option_value'][$s]) echo 'selected'?>
                                                        >
                                                            <?=$form_edit[$i]['option_title'][$s]?>
                                                        </option>
                                                    <?php endfor; ?>
                                                </select>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type']=='select_category_product'):?>
                                                <select
                                                    name="<?=$form_edit[$i]['name_input']?>"
                                                    id="<?=$form_edit[$i]['name_input']?>"
                                                >

                                                    <?=$category_menu_admin?>

                                                </select>
                                            <?php endif;?>

                                            <?php if($form_edit[$i]['type'] == 'textarea'):?>
                                                <textarea name="<?=$form_edit[$i]['name_input']?>" id="editckeditor" cols="30" rows="10">
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

                            <?php //Модальное окно для удаления данных ?>
                            <div id="modal-pages-action" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Уведомление</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">

                                                <form id="form_action_page">
                                                    <h4 class="col-md-12 modal-title title-for-popup"></h4>
                                                    <div class="col-sm-4 col-sm-offset-4 btn-block-form text-center" role="group" aria-label="...">

                                                        <input type="submit" class="btn btn-success" align="center" name="page_delete_submit" id="action-btn" value="Подтвердить">
                                                        <input type="text" hidden id="processed-page" name="pages-delete" value="">
                                                        <input type="text" hidden id="processed-file-del" name="file-delete" value="">

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
    <!-- /.content-wrapper -->

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once "footer.php"?>