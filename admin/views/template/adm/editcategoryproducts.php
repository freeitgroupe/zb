<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox clear">
    <h2>Add new<i class="icons">add</i></h2>
    <div class="fist">
        <div class="boxOneThird">
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
                                        src="<?=CAT_IMG . $form_edit[$i]['src']?>"
                                        width="200"
                                >
                            <?php endif;?>

                            <?php if($form_edit[$i]['type']=='file'):?>
                                <input
                                        type="file"
                                        class=""
                                        name="file"
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

                            <?php if($form_edit[$i]['type']=='select_category_product'):?>
                                <select
                                        name="<?=$form_edit[$i]['name_input']?>"
                                        id="<?=$form_edit[$i]['name_input']?>"
                                >
                                    <?php if(isset($form_edit[$i]['create_category'])):?>
                                        <option value="0" selected>Самостоятельная категория</option>
                                    <?php endif;?>
                                    <?=$form_edit[$i]['data_tree']?>

                                </select>
                            <?php endif;?>

                            <?php if($form_edit[$i]['type'] == 'textarea'):?>
                                <textarea name="<?=$form_edit[$i]['name_input']?>" id="editckeditor" cols="30" rows="10">
                                    <?=$form_edit[$i]['value']?>
                                </textarea>
                            <?php endif;?>


                            <?php if($form_edit[$i]['type'] == 'submit'):?>
                                <div class="btn-block-form col-md-6 text-left" role="group" aria-label="...">
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
<!--                    <div class="box-body" id="addition-attribute"></div>-->
                </form>
                <?php // конструктор формы ?>
<!--                <div class="box-body">-->
<!--                    <button class="" name="" id="createParam">Сreate new param</button>-->
<!--                </div>-->
            <?php endif;?>
        </div>
<!--        <div class="boxTwoThirds">-->
<!--            <textarea placeholder="Category description">            </textarea>-->
<!--        </div>-->
    </div>
<!--    <input class="fat" type="submit" value="Add category">-->
</div>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
