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
    <form action="" id="searchProduct" method="get">
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Location</h3>
                <select class="bottom" name="state">
                    <option value="0">All States</option>
                    <?php for($i=0, $count=count($states_of_usa); $i<$count; $i++):?>
                        <option value="<?=$states_of_usa[$i]['name']?>"
                            <?php $_SESSION['filter']['state'] == $states_of_usa[$i]['name'] ? print 'selected':'';?>><?=$states_of_usa[$i]['name']?>
                        </option>
                    <?php endfor;?>
                </select>
                <input class="bottom" type="text" placeholder="city" name="city" value="<?php $_SESSION['filter']['city'] > false ? print $_SESSION['filter']['city'] : '';?>">
                <input class="bottom" type="text" placeholder="zip_code" name="zip_code" value="<?php $_SESSION['filter']['zip_code'] > false ? print $_SESSION['filter']['zip_code'] : '';?>">
            </div>
            <div class="boxOneThird">
                <h3>Special</h3>
                <input class="bottom" type="text" placeholder="title" name="title" value="<?php $_SESSION['filter']['title'] > false ? print $_SESSION['filter']['title'] : '';?>">
                <input type="text" placeholder="email" name="email" value="<?php $_SESSION['filter']['email'] > '' ? print $_SESSION['filter']['email'] : '';?>">
            </div>
        </div>
        <input type="submit" class="fat" value="Search" name="searchButton">
        <a class="fat" href="/admin/suppliers">Reset</a>
    </form>
</div>
<div class="contentBox clear">
    <h2>Suppliers list<i class="icons">dehaze</i></h2>
    <div class="tableBox clear">
        <?php if($get_suppliers_admin !==false && count($get_suppliers_admin)>0):?>
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>States</th>
                    <th>City</th>
                    <th>ZIP code</th>
                    <th>Email</th>
                    <th style="text-align: center;">Edit</th>
                    <th style="text-align: center;">Delete</th>
                </tr>
                <?php foreach ($get_suppliers_admin as $item):?>
                    <tr class="pg-<?=$item['supplier_id']?>">
                        <td>#<?=$item['supplier_id']?></td>
                        <td><?=$item['title']?></td>
                        <td><?=$item['state']?></td>
                        <td><?=$item['city']?></td>
                        <td><?=$item['zip_code']?></td>
                        <td><?=$item['email']?></td>
                        <td class="move" style="text-align: center;"><a class="edit" href="<?=PATH_ADMIN?>edit-suppliers/<?=$item['alias']?>"> <i class="icons edit">edit</i></a></td>
                        <td class="move" style="text-align: center;">
                            <a href="#" class="trigger btn-delete-pages" data-page="<?=$item['supplier_id']?>">
                                <i class="icons delete">delete</i>
                            </a>
                        </td>
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
    <div class="pageNavigation clear">
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Page navigation</h3>
                <?=$pagination?>
            </div>
        </div>
    </div>
</div>
<?php if(isset($_SESSION['filter'])) {unset($_SESSION['filter']);}?>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>