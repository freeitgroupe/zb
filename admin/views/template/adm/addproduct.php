<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data"  >
    <div class="contentBox clear">
        <h2>Add Product #<?=$_SESSION['data']['article']?><i class="icons">settings</i></h2>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Base</h3>
                <input class="bottom" type="text" placeholder="Title" value="<?=$_SESSION['data']['title']?>" name="title">
                <input class="bottom" type="text" placeholder="Vendor code" value="<?=$_SESSION['data']['article']?>" name="article">
                <input class="bottom" type="text" placeholder="Position in group" value="<?=$_SESSION['data']['position']?>" name="position">
                <input class="bottom" type="text" placeholder="Fast search tags" value="<?=$_SESSION['data']['meta_k']?>" name="meta_k">
            </div>

            <div class="boxOneThird">
                <h3>Storage</h3>
                <select name="category_id" class="bottom">
                    <?=$category_menu_admin?>
                </select>

                <h3>Chose Stock (Promotion)</h3>
                <select class="bottom" name="stock_id">
                    <option value="0">No stock</option>
            <?php if($arr_data['product_stock_info'] != false):?>
            <?php if((count($arr_data['product_stock_info']))!= 0):?>
                <?php foreach ($arr_data['product_stock_info'] as $item):?>
                    <option value="<?= $item['id']?>">
                        <?=$item['title']?>
                    </option>
                <?php endforeach;?>
            <?php endif?>
            <?php endif?>
                </select>
            </div>

            <div class="boxOneThird">
                <h3>Package</h3>
                <div id="btnimg">
                    <?php if($_SESSION['data']['package'] > ''):?>
                        <?php
                        $arr = explode("|", $_SESSION['data']['package']);
                        $arr = array_diff($arr,['']);
                        ?>
                        <?php foreach($arr as $item):?>
                            <div>
                                <input class="bottom" type="text" placeholder="Package" value="<?=$item?>" name="package[]">
                            </div>
                        <?php endforeach;?>
                    <?php else:?>
                        <div>
                            <input class="bottom" type="text" placeholder="Package" value="" name="package[]">
                        </div>
                    <?php endif?>
                </div>
                <input type="submit" value="Add" name="" id="add">
                <input type="submit" value="Dell" name="" disabled id="del" style="background: #f36060;">
            </div>
        </div>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Notice</h3>
                <textarea placeholder="Enter inportant notice text" name="notice"><?=$_SESSION['data']['notice']?></textarea>
            </div>
            <div class="boxOneThird">
                <h3>Seo description</h3>
                <textarea placeholder="Enter seo text" name="meta_d"><?=$_SESSION['data']['meta_d']?></textarea>
            </div>
            <div class="boxOneThird">
                <h3>Upsell</h3>
                <select class="bottom" name="upsell_product[]" multiple>
                    <?php if($_SESSION['data']['product_upsell']):?>
                    <?php foreach($_SESSION['data']['product_upsell'] as $item ):?>
                        <option value="<?=$item['id']?>" <?php if(isset($item['selected'])){ echo 'selected';}?>>
                            <?= $item['title']?>
                        </option>
                    <?php endforeach;?>
                    <?php endif;?>
                </select>
                <!--            <input class="bottom" type="text" placeholder="Name or Vendor code" value="">-->
                <!--            <input class="bottom" type="text" placeholder="Upsell discount" value="">-->
                <select class="bottom" name="related_category">
                    <option value="0">No recommended products category</option>
                    <?=$category_menu_admin_for_rel_cat?>
                </select>
            </div>
        </div>
        <div class="first clear">
            <div class="boxOneThird">
                <h3>Additional product properties</h3>
                <input type="text" value="" name="additional_attribute_product[]">
            </div>
            <div class="boxOneThird">
                <h3>Suppliers</h3>
                <select name="suppliers_id[]" multiple>
                    <?php foreach($suppliers as $item):?>
                    <option value="<?=$item['supplier_id']?>"><?=$item['title']?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>

        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Labels</h3>
                <div class="checkBox">
                    <p>
                        <input id="c1" name="mark_hit" type="checkbox" <?php $_SESSION['data']['mark_hit'] > 0 ? print 'checked':'';?> value="1">
                        <label for="c1"> <span></span> Bestseller </label>
                    </p>
                    <p>
                        <input id="c2" name="fast_delivery" type="checkbox" <?php $_SESSION['data']['fast_delivery'] > 0 ? print 'checked':'';?> value="1">
                        <label for="c2"> <span></span> Fast delivery </label>
                    </p>
                    <p>
                        <input id="c3" name="perfect_delivery" type="checkbox" <?php $_SESSION['data']['perfect_delivery'] > 0 ? print 'checked':'';?> value="1">
                        <label for="c3"> <span></span> Perfect condition</label>
                    </p>
                    <p>
                        <input id="c4" name="warranty_months" type="checkbox" <?php $_SESSION['data']['warranty_months'] > 0 ? print 'checked':'';?> value="1">
                        <label for="c4"> <span></span> 12 month guarantee </label>
                    </p>
                    <p>
                        <input id="c5" name="exchange_prod" type="checkbox" <?php $_SESSION['data']['exchange_prod'] > 0 ? print 'checked':'';?> value="1">
                        <label for="c5"> <span></span> 14 days for exchange </label>
                    </p>
                </div>
            </div>
            <div class="boxOneThird">
                <h3>Extra</h3>
                <div class="checkBox">
                    <p>
                        <input id="r1" name="mark_expert" type="checkbox" <?php $_SESSION['data']['mark_expert'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r1"> <span></span> Expert choice </label>
                    </p>
                    <p>
                        <input id="r2" name="mark_stock" type="checkbox" <?php $_SESSION['data']['mark_stock'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r2"> <span></span> Out of stock </label>
                    </p>
                    <p>
                        <input id="r3" name="mark_discontinued" type="checkbox" <?php $_SESSION['data']['mark_discontinued'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r3"> <span></span> Discontinued</label>
                    </p>
                    <p>
                        <input id="r4" name="mark_view" type="checkbox" <?php $_SESSION['data']['mark_view'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r4"> <span></span> View</label>
                    </p>
                    <p>
                        <input id="r4_mark_available" name="mark_available" type="checkbox" <?php $_SESSION['data']['mark_available'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r4_mark_available"> <span></span> Available</label>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Media<i class="icons">art_track</i></h2>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Thumbnail</h3>
                <div>
                    <input class="bottom" type="file" placeholder="Select thumb" name="image">
                </div>
                <span>*For correct display, the image width must be equal to the height!</span>
            </div>
            <div class="boxOneThird">
                <h3>Gallery photos</h3>
                <div class="image-preview form-group col-md-12">
                    <img id="preview" src="" alt="">
                </div>
                <div id="btnimg">
                    <div>
                        <input type="file" class="form-group" name="gallery_image[]" id="gallery_img" multiple>
                    </div>
                </div>
                <span>*For correct display, the image width must be equal to the height!</span>
            </div>
            <div class="boxOneThird">
                <h3>Base color</h3>
                <div>
                    <input type="color" class="bottom" name="color" value="<?=$_SESSION['data']['color']?>">
                </div>
                <input class="bottom" type="text" placeholder="Link for video" name="link_video" value="<?=$_SESSION['data']['link_video']?>">
                <div class="checkBox">
                    <p>
                        <input id="r5" name="watermark" type="checkbox" <?php $_SESSION['data']['watermark'] > 0 ? print 'checked':'';?> value="1">
                        <label for="r5"> <span></span> watermark</label>
                    </p>
                </div>
            </div>
        </div>
        <div class="boxOneThird">
            <h3>Common price</h3>
            <input class="bottom" type="text" placeholder="Common price" value="<?=$_SESSION['data']['price']?>" name="price">
        </div>
    </div>
    <div class="contentBox clear">
    <h2>Warehouses<i class="icons">storage</i></h2>
    <?php //информация (склады) ?>

    <?php if(isset($arr_data['new_prod'])):?>

    <?php for ($i=0, $count=count($arr_data['warehouse_all_info_empty_prod']); $i<$count; $i++ ):?>

        <div class="fist clear">
            <div class="boxOneThird">
                <h3><?=$arr_data['warehouse_all_info_empty_prod'][$i]['name'] . ' ' . $arr_data['warehouse_all_info_empty_prod'][$i]['state_id']?></h3>
                <input class="bottom" type="hidden" value="<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_id]">
                <input class="bottom" type="text" placeholder="Price" value="" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_price]">
                <input class="bottom" type="text" placeholder="Tax summ" value="" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_tax]">
                <input type="text" class="bottom" placeholder="Discount %" value="" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_discount]">
                <input type="text" placeholder="Count" value="" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_count]">
            </div>

            <div class="boxOneThird">
                <h3>Chose Stock (Promotion)</h3>
                <select class="bottom" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_stock]">
                    <option value="0">No stock</option>
            <?php if($arr_data['product_stock_info'] != false):?>
            <?php if(count($arr_data['product_stock_info'])!= 0):?>
                <?php foreach ($arr_data['product_stock_info'] as $item):?>
                    <option value="<?= $item['id']?>">
                        <?=$item['title']?>
                    </option>
                <?php endforeach;?>
            <?php endif?>
            <?php endif?>
                </select>

                <h3>Chose Availability</h3>
                <select class="bottom" name="warehouse[<?=$arr_data['warehouse_all_info_empty_prod'][$i]['id']?>][warehouse_availability]">
                    <?php if(count($arr_data['availability_products'])!= 0):?>
                        <?php foreach ($arr_data['availability_products'] as $item):?>
                            <option value="<?= $item['id']?>">
                                <?=$item['title']?>
                            </option>
                        <?php endforeach;?>
                    <?php endif?>
                </select>
            </div>

            <div class="boxOneThird">
                <h3>Information</h3>
                <p class="bottom"><?=$arr_data['warehouse_all_info_empty_prod'][$i]['notice']?></p>
            </div>
        </div>

    <?php endfor;?>
         <div class="fist clear">
            <input type="submit" value="Confirm" name="edit_pages_success">
         </div>
    </div>
</form>
<?php endif;?>


<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
