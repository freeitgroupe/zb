<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox">
    <h2>Fields for: <?=$category_product_for_edit['title']?><i class="icons">settings</i></h2>
    <div class="fist clear">
        <div class="tableBox">
            <table>
                <tbody>
                <tr>
                    <th>Order</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th style="text-align: center;">Edit</th>
                    <th style="text-align: center;">Delete</th>
                </tr>
                <?php if(is_array($AdditionalAttributesInCategory)):?>
                    <?php $i=1; foreach ($AdditionalAttributesInCategory as $item):?>
                <tr class="pg-<?=$item['init_id']?>">
                    <td>#<?=$i?></td>
                    <td><?=$item['additionaltext_label']?></td>
                    <td><?=$item['type_val']?></td>
                    <td class="move" style="text-align: center;">
                        <a class="edit btn-edit-pages"
                           href="#"
                           data-additionaltext_label="<?=$item['additionaltext_label']?>"
                           data-id_val="<?=$item['id_val']?>"
                           data-position_val="<?=$item['position_val']?>"
                           data-type_val="<?=$item['type_val']?>"
                           data-description_val="<?=$item['description_val']?>"
                           data-init_id="<?=$item['init_id']?>"

                        >
                            <i class="icons edit">edit</i></a>
                    </td>
                    <td class="move" style="text-align: center;">
                        <a class="trigger btn-delete-pages delete" href="#" data-page="<?=$item['init_id']?>"><i class="icons delete">delete</i></a>
                    </td>
                </tr>
                     <?php $i++; endforeach;?>
                <?php endif;?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="form-block">
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
        <input hidden value="<?=$category_product_for_edit['id']?>" name="id">
<!--        <div class="contentBox">-->
<!--            <h2>Rules<i class="icons">short_text</i></h2>-->
<!--            <div class="fist">-->
<!--                <div class="boxTwoThirds">-->
<!--                    <h3>Add rule</h3>-->
<!--                    <input class="bottom" type="text" value="Category" readonly="readonly">-->
<!--                    <select class="bottom" name="id">-->
<!--                        --><?//=$category_menu_admin?>
<!--                    </select>-->
<!--                </div>-->
<!--                <div class="boxOneThird">-->
<!--                    <h3>Current rules</h3>-->
<!--                    <ul>-->
<!--                        <li>Category = Category One</li>-->
<!--                        <li>Category != Category Seven in Category One</li>-->
<!--                        <li>Category = Category Six</li>-->
<!--                    </ul>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
        <div class="new-field-block">
            <div class="contentBox">
                <h2>Add New Field</h2>
                <div class="fist clear">
                    <div class="boxOneThird">
                        <h3>Base</h3>
                        <input class="bottom" type="text" name="additional_attribute[0][additionaltext_label]" placeholder="Field name" value="<?=$_SESSION['data']['additionaltext_label']?>">
                        <input class="bottom" type="text" name="additional_attribute[0][id_val]" placeholder="ID value" value="<?=$_SESSION['data']['id_val']?>">
                        <input class="bottom" type="text" name="additional_attribute[0][position_val]"  placeholder="Position value" value="<?=$_SESSION['data']['position_val']?>">

                        <select name="additional_attribute[0][type_val]">
                            <?php if(is_array($AdditionalAttributes)):?>
                                <?php foreach ($AdditionalAttributes as $item):?>
                                    <option value="<?=$item['value']?>"<?php if($item['value'] == $_SESSION['data']['type_val'])echo 'selected';?>><?=$item['title']?></option>
                                <?php endforeach;?>
                            <?php else:?>
                                <option value="0">Empty</option>
                            <?php endif;?>
                        </select>
                    </div>
                    <div class="boxTwoThirds">
                        <h3>Field instructions</h3>
                        <textarea placeholder="Fill instuctions for content manager" name="additional_attribute[0][description_val]"><?=$_SESSION['data']['description_val']?></textarea>
                    </div>
                </div>
                <input class="fat" type="submit" value="Add field" name="fields_add_success">
            </div>
        </div>
    </form>
    <div class="editable-field-block" style="display: none;">
        <form action="<?php $_SERVER['REQUEST_URI']?>" method="post">
            <div class="contentBox">
                <h2>Edit Field</h2>
                <div class="fist clear">
                    <div class="boxOneThird">
                        <h3>Base</h3>
                        <input class="bottom" type="text" name="additional_attribute[0][additionaltext_label]" id="additionaltext_label" placeholder="Field name" value="">
                        <input class="bottom" type="text" name="additional_attribute[0][id_val]" id="id_val" placeholder="ID value" value="">
                        <input class="bottom" type="text" name="additional_attribute[0][position_val]" id="position_val"  placeholder="Position value" value="">

                        <select name="additional_attribute[0][type_val]" id="type_val">
                            <?php if(is_array($AdditionalAttributes)):?>
                                <?php foreach ($AdditionalAttributes as $item):?>
                                    <option value="<?=$item['value']?>"><?=$item['title']?></option>
                                <?php endforeach;?>
                            <?php else:?>
                                <option value="0">Empty</option>
                            <?php endif;?>
                        </select>

                    </div>
                    <div class="boxTwoThirds">
                        <h3>Field instructions</h3>
                        <textarea placeholder="Fill instuctions for content manager" name="additional_attribute[0][description_val]" id="description_val"><?=$_SESSION['data']['description_val']?></textarea>
                        <input type="hidden" id="init_id">
                    </div>
                </div>
                <input class="fat" type="submit" value="Confirm edit" name="fields_edit_success">
                <input class="fat" type="submit" value="Cancel" id="cancel-edit">
            </div>
        </form>
    </div>
</div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
