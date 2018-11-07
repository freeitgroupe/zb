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

        <section class="content-header">
            <h1>
                Управление страницей
                <small>используются статические данные</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/admin"><i class="fa fa-dashboard"></i> Главная</a></li>
                <li><a href="/admin/static-pages/">Страницы сайта</a></li>
                <li class="active">Управление страницей</li>
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
                                <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" id="form_edit_pages">
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
                                                    <?=$form_edit[$i]['required']?>
                                                >
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

<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php require_once "footer.php"?>