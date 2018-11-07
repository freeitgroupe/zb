<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
    <div class="contentBox clear">
        <form action="<?=PATH_ADMIN?>upsell/" method="post">
            <h2>Create upsell unit<i class="icons">directions</i></h2>
            <div class="fist clear">
                <div class="boxHalf" style="position: relative">
                    <input type="text" class="bottom" name="search" id="search-box" placeholder="Source vendor code or name" <?php if(isset($_SESSION['search'])):?> value="<?=$_SESSION['search']?>"<?php endif?>/>
                    <select name="product_id" id="suggesstion-box" class="bottom" style="display: none"></select>
                    <input type="text" name="default_price" value="" class="bottom suggesstion-prices" placeholder="default price" style="display: none">
                    <input type="text" name="upsell_price" value="" placeholder="upsell price" class="suggesstion-prices" style="display: none">
                </div>
            </div>
            <input type="submit" name="upsell_confirm" value="Add rule" class="fat suggesstion-prices" style="display: none"/>
        </form>
    </div>
    <div class="contentBox clear">
        <div class="tableBox fist">
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Source product</th>
                    <th>Upsell product</th>
                    <th>Upsell price</th>
                    <th style="text-align: center;">Edit</th>
                    <th style="text-align: center;">Delete</th>
                </tr>

                <?php if(is_array($ProductsForUpsell)):?>
                <?php foreach ($ProductsForUpsell as $item):?>
                <tr class=" pg-<?=$item['id']?>">
                    <td>#<?=$item['id']?></td>
                    <td><?=$item['title_product']?></td>
                    <td><?=$item['name'] . ' ' . '('. $item['default_price'] . $currency . ')'?></td>
                    <td><?=$item['upsell_price'] . $currency?></td>
                    <td class="move" style="text-align: center;"><a class="edit" href="/admin/edit-upsell/<?=$item['id']?>"><i class="icons edit">edit</i></a></td>
                    <td class="move" style="text-align: center;"><a href="#" class="trigger btn-delete-pages" data-page="<?=$item['id']?>"><i class="icons delete">delete</i></a></td>
                </tr>
                <?php endforeach; ?>
                <?php else:?>
                    <td colspan="6"><?=$ProductsForUpsell?></td>
                <?php endif;?>
                </tbody>
            </table>
            <div class="pageNavigation clear">
                <div class="clear">
                    <div class="boxOneThird">
                        <?=$pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>