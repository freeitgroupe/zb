<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox clear">
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <h2>Create stock. PM:(<?=date( "Y-m-d H:i:s", time())?>)<i class="icons">add</i></h2>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Main</h3>
                <input class="bottom" type="text" placeholder="Stock name" name="title">
                <input class="bottom" type="datetime-local" placeholder="End date" name="end_time">
                <input class="bottom" type="text" placeholder="Short lood description" name="mini_description">
                <h3>Activation</h3>
                <select class="bottom" name="activation">
                    <option value="1">enabled</option>
                    <option value="0">disabled</option>
                </select>
            </div>
            <div class="boxTwoThirds">
                <h3>Stock page description</h3>
                <textarea name="description">Print the stock text</textarea>
            </div>
        </div>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Stock page image</h3>
                <input type="file" name="img">
            </div>
            <div class="boxOneThird">
                <h3>Loop thumbnail</h3>
                <input type="file" name="thumbnail">
            </div>
        </div>
        <input class="fat" type="submit" value="Create stock" name="create_stock">
    </form>

</div>
<div class="contentBox clear">
    <h2>Stock list</h2>
    <div class="tableBox clear">
        <table>
            <tbody>
            <tr>
                <th>ID</th>
                <th>Stock image</th>
                <th>Thumbnail image</th>
                <th>Stock name</th>
                <th>Final date</th>
                <th style="text-align: center;">Edit</th>
                <th style="text-align: center;">Cancel</th>
                <th style="text-align: center;">Delete</th>
            </tr>

            <?php if(is_array($get_stock_admin)):?>
            <?php foreach ($get_stock_admin as $item):?>

            <tr class="pg-<?=$item['id']?>">
                <td>#<?=$item['id']?></td>
                <td><img src="<?=substr(PATH,0,-1) . STOCK_IMG . $item['stock_img']?>" width="100" alt=""></td>
                <td><img src="<?=PATH . STOCK_THUMBNAIL_IMG . $item['stock_thumbnail']?>" width="60" alt=""/></td>
                <td><?=$item['title']?></td>
                <td><?=$item['end_time']?></td>
                <td class="move" style="text-align: center;">
                    <a class="edit" href="/admin/edit-stock/<?=$item['id']?>">
                        <i class="icons edit">edit</i>
                    </a>
                </td>
                <td class="move" style="text-align: center;">
                    <a href="#" class="trigger btn-cancel-pages" data-page="<?=$item['id']?>"><i class="icons delete">delete</i></a>
                </td>
                <td class="move" style="text-align: center;">
                    <a href="#" class="trigger btn-delete-pages" data-page="<?=$item['id']?>"><i class="icons delete">delete</i></a>
                </td>
            </tr>
            <?php endforeach; ?>
            <?php else:?>
                <tr><td colspan="8"><?=$get_stock_admin?></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
    <div class="pageNavigation clear">
        <div class="fist clear">
            <div class="boxOneThird">
                <?=$pagination?>
            </div>
        </div>
    </div>
</div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>