<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<div class="contentBox clear">
    <nav class="pageNav clear">
        <ul>
            <a href="/admin/suppliers"><i class="icons">storage</i><li>Suppliers</li></a>
            <a href="/admin/edit-suppliers/new"><i class="icons">queue</i><li>Add new</li></a>
        </ul>
    </nav>
</div>
<div class="contentBox clear">
    <h2>Search Filter<i class="icons">search</i></h2>
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Location</h3>
                <select class="bottom" name="state">
                    <option value="0">All States</option>
                    <?php for($i=0, $count=count($states_of_usa); $i<$count; $i++):?>
                        <option value="<?=$states_of_usa[$i]['name']?>"
                            <?php $getDataSupplier['state'] == $states_of_usa[$i]['name'] ? print 'selected':'';?>><?=$states_of_usa[$i]['name']?></option>
                    <?php endfor;?>
                </select>
                <input class="bottom" type="text" placeholder="city" name="city" value="<?php $getDataSupplier['city'] > false ? print $getDataSupplier['city'] : '';?>">
                <input class="bottom" type="text" placeholder="zip_code" name="zip_code" value="<?php $getDataSupplier['zip_code'] > false ? print $getDataSupplier['zip_code'] : '';?>">
            </div>
            <div class="boxOneThird">
                <h3>Special</h3>
                <input class="bottom" type="text" placeholder="title" name="title" value="<?php $getDataSupplier['title'] > false ? print $getDataSupplier['title'] : '';?>">
                <input class="bottom" type="text" placeholder="description" name="description" value="<?php $getDataSupplier['description'] > '' ? print $getDataSupplier['description'] : '';?>">
                <input class="bottom" type="text" placeholder="meta description" name="meta_d" value="<?php $getDataSupplier['meta_d'] > '' ? print $getDataSupplier['meta_d'] : '';?>">
                <input class="bottom" type="text" placeholder="meta keywords" name="meta_k" value="<?php $getDataSupplier['meta_k'] > '' ? print $getDataSupplier['meta_k'] : '';?>">
            </div>
            <div class="boxOneThird">
                <h3>Contact</h3>
                <input class="bottom" type="text" placeholder="Email" name="email" value="<?php $getDataSupplier['email'] > '' ? print $getDataSupplier['email'] : '';?>">
                <input class="bottom" type="text" placeholder="phone" name="phone" value="<?php $getDataSupplier['phone'] > '' ? print $getDataSupplier['phone'] : '';?>">
                <select class="bottom" name="visible">
                    <?php foreach($visibleSupplier as $k=>$v):?>
                        <option value="<?=$v?>" <?php $getDataSupplier['visible'] == $v ? print 'selected':'';?>><?=$k?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>
        <input type="submit" class="fat" value="Confirm" name="edit_supplier_success">
    </form>
</div>
<div class="contentBox clear">
    <h2>Products list<i class="icons">dehaze</i></h2>
    <div class="tableBox clear">
        <?php if($getDataProductsSupplier !=false && is_array($getDataProductsSupplier)):?>
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Price</th>
                </tr>
                <?php foreach ($getDataProductsSupplier as $item):?>
                    <tr class="pg-<?=$item['id']?>">
                        <td>#<?=$item['id']?></td>
                        <td><a href="<?=PATH_ADMIN . 'edit-product/' .$item['alias'] ?>" target="_blank"><?=$item['title']?></a></td>
                        <td><?=$item['price']?></td>
                    </tr>
                <?php endforeach;?>
                </tbody>
            </table>
        <?php else:?>
            <table>
                <td>
                    <tr>Empty</tr>
                </td>
            </table>
        <?php endif;?>
    </div>
</div>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>