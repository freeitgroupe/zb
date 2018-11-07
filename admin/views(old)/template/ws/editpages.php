<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php"?>
    <div class="col-md-9" id="right-cont-prof">
        
        <?php if(isset($_SESSION['message']['success'])):?>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> <?=$_SESSION['message']['success']?></h4>
            </div>            
        <?php endif;?>

        <?php if(isset($_SESSION['message']['error'])):?>
            <div class="error-bl">
                <div class="alert alert-danger col-md-12">
                    <?=$_SESSION['message']['error']?>
                </div>
            </div>
        <?php endif;?>        

        <h1>Редактирование страницы</h1>
        <div class="profile-option">
            <div class="block-form-profile">
                <?php if($form_edit): ?>
                    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" id="form_edit_pages">
                        <?php for($i=0, $count=count($form_edit); $i < $count; $i++):?>

                            <div class="col-md-12 form-group">
                                <?php if(isset($form_edit[$i]['label'])):?>
                                    <label
                                        class="control-label"
                                        for="<?=$form_edit[$i]['name_input']?>"
                                    ><?=$form_edit[$i]['label']?><sub>*</sub>:
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
                                            class="login-btn-form"
                                            value="<?=$form_edit[$i]['value']?>"
                                        >
                                    </div>
                                <?php endif;?>
                            </div>

                        <?php endfor; ?>
                    </form>
                <?php endif;?>
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
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php require_once "footer.php"?>