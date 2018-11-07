<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<!-- Content Wrapper. Contains page content -->
<div class="contentBox clear">
    <nav class="pageNav clear">
        <ul>
            <a href="/admin/product-options"><i class="icons">home</i><li>Products</li></a>
            <a href="/admin/add-product/new"><i class="icons">queue</i><li>Add new</li></a>
            <a href="/admin/upsell"><i class="icons">local_mall</i><li>Upsell</li></a>
            <a href="/admin/stock"><i class="icons">local_play</i><li>Stock</li></a>
        </ul>
    </nav>
</div>
<div class="contentBox clear">
    <nav class="pageNav clear">
        <ul>
            <a href="/admin/category-product-options/"><i class="icons">content_paste</i><li>Categories</li></a>
            <a href="/admin/product-import"><i class="icons">play_for_work</i><li>CSV import</li></a>
            <a href="/admin/category-fields/"><i class="icons">settings_applications</i><li>Product fields</li></a>
        </ul>
    </nav>
</div>
    <div class="contentBox clear">
        <?php isset($_SESSION['message']['error']) ? print '<h3 class=\'err_adm\'>'.$_SESSION['message']['error'].'</h3>':'';?>
        <h2>Search Filter<i class="icons">search</i></h2>
        <form action="" id="searchProduct" method="get">
        <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Location</h3>
                    <select class="bottom" name="state_id">
                        <option value="0">All States</option>
                        <?php for($i=0, $count=count($states_of_usa); $i<$count; $i++):?>
                            <option value="<?=$states_of_usa[$i]['id']?>"
                                <?php $_SESSION['filter']['state_id'] == $states_of_usa[$i]['id'] ? print 'selected':'';?>><?=$states_of_usa[$i]['name']?></option>
                        <?php endfor;?>
                    </select>
                    <!--
                    <select>
                         <option>All Warehouses</option>
                         <option>alab-001</option>
                         <option>alab-002</option>
                         <option>alab-003</option>
                         <option>alab-004</option>
                     </select>
                    -->
                </div>
                <div class="boxOneThird">
                    <h3>Storage</h3>
                    <select class="bottom" name="category_id">
                        <option value="0">All category</option>
                        <?=$category_menu_admin?>
                    </select>
                    <!--
                    <select class="bottom">
                        <option>All Child</option>
                        <option>First Child</option>
                        <option>Second Child</option>
                        <option>Third Child</option>
                        <option>Fourth Child</option>
                    </select>
                    -->
                    <input class="bottom" type="text" placeholder="Price from" name="price[]" value="<?php $_SESSION['filter']['start_price'] > 0 ? print $_SESSION['filter']['start_price']:'';?>">
                    <input type="text" placeholder="Price to" name="price[]" value="<?php $_SESSION['filter']['end_price'] > 0 ? print $_SESSION['filter']['end_price']:'';?>">
                </div>
                <div class="boxOneThird">
                    <h3>Special</h3>
                    <select class="bottom" name="available">
                        <option value="0" name="">Any status</option>
                        <?php for($i=0, $count=count($special_meta_available); $i<$count; $i++):?>
                            <option value="<?=$special_meta_available[$i]['id']?>" <?php $_SESSION['filter']['available'] == $special_meta_available[$i]['id'] ? print 'selected':'';?>><?=$special_meta_available[$i]['title']?></option>
                        <?php endfor;?>
                    </select>
                    <h3>Stock</h3>
                    <select class="bottom" name="stock_id">
                            <option value="0">Disabled</option>
                            <option value="1" <?php $_SESSION['filter']['stock_id'] > 0 ? print 'selected' : '';?>>Stock</option>
                    </select>
                    <h3>Upsell</h3>
                    <select class="bottom" name="upsell_product">
                        <option value="0">Disabled</option>
                        <option value="1" <?php $_SESSION['filter']['upsell_product'] > 0 ? print 'selected' : '';?>>Upsell</option>
                    </select>
                    <input class="bottom" type="text" placeholder="product ID" name="id" value="<?php $_SESSION['filter']['id'] > 0 ? print $_SESSION['filter']['id'] : '';?>">
                    <input type="text" placeholder="Vendor code(#22222)" name="article" value="<?php $_SESSION['filter']['article'] > '' ? print $_SESSION['filter']['article'] : '';?>">
                </div>

        </div>
        <input type="submit" class="fat" value="Search" name="searchButton">
            <a  class="fat" href="/admin/product-options">Reset</a>
        </form>
    </div>
    <div class="contentBox clear">
        <h2>Produc list<i class="icons">assignment</i></h2>
        <div class="tableBox">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Vendor code</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Special</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Edit</th>
                    <th>Del</th>
                </tr>
        <?php if(isset($get_product_admin) && is_array($get_product_admin)):?>
            <?php for($i=0, $count=count($get_product_admin['result_query']); $i<$count; $i++):?>
                <tr class="pg-<?=$get_product_admin['result_query'][$i]['id']?>">
                    <td>#<?=$get_product_admin['result_query'][$i]['id']?></td>
                    <td><?=$get_product_admin['result_query'][$i]['article']?></td>
                    <td><?=$get_product_admin['result_query'][$i]['title']?></td>
                    <td><?=$get_product_admin['result_query'][$i]['category_title']?></td>
                    <td></td>
                    <td><?=get_count_product_id_in_warehouse($get_product_admin['result_query'][$i]['id'])?></td>
                    <td><?=$get_product_admin['result_query'][$i]['price'] . $currency?></td>
                    <td>
                        <a href="<?=PATH_ADMIN?>edit-product/<?=$get_product_admin['result_query'][$i]['alias']?>" title="edit"><i class="icons">settings</i>
                        </a>
                    </td>
                    <td>
                        <a href="#" class="trigger btn-delete-pages" data-page="<?=$get_product_admin['result_query'][$i]['id']?>"><i class="icons delete">delete</i></a>
                    </td>
                </tr>
            <?php endfor;?>
        <?php endif;?>
            </table>
        </div>
        <div class="pageNavigation clear">
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Page navigation</h3>
                    <?=$pagination?>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.content-wrapper -->
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['filter'])){unset($_SESSION['filter']);}?>
<?php require_once "footer.php"?>

