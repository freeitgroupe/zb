<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
    <div class="contentBox clear">
        <nav class="pageNav clear">
            <ul>
                <a href="/admin/warehouse"><i class="icons">storage</i><li>Warehouses</li></a>
                <a href="/admin/edit-warehouse/new"><i class="icons">queue</i><li>Add new</li></a>
            </ul>
        </nav>
    </div>
    <div class="contentBox clear">
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
                </div>

                <div class="boxOneThird">
                    <h3>Special</h3>

                    <input class="bottom" type="text" placeholder="city" name="city" value="<?php $_SESSION['filter']['city'] > false ? print $_SESSION['filter']['city'] : '';?>">

                    <input type="text" placeholder="tax_summ" name="tax_summ" value="<?php $_SESSION['filter']['tax_summ'] > '' ? print $_SESSION['filter']['tax_summ'] : '';?>">

                    <div class="checkBox">
                        <p>
                            <input id="r5" name="official_registration" type="checkbox" <?php $_SESSION['filter']['official_registration'] > 0 ? print 'checked':'';?> value="1">
                            <label for="r5"> <span></span>With official registration</label>
                        </p>
                    </div>
                </div>
            </div>
            <input type="submit" class="fat" value="Search" name="searchButton">
        </form>
    </div>


<!--        <div class="contentBox clear">-->
<!--            <nav class="pageNav clear">-->
<!--                <ul>-->
<!--                    <a href="warehouse.html"><i class="icons">storage</i><li>Warehouses</li></a>-->
<!--                    <a href="warehouseadd.html"><i class="icons">queue</i><li>Add new</li></a>-->
<!--                </ul>-->
<!--            </nav>-->
<!--        </div>-->
    <div class="contentBox clear">
        <h2>Warehouses list<i class="icons">dehaze</i></h2>
        <div class="tableBox clear">
            <?php if($get_warehouse_admin !==false && count($get_warehouse_admin)>0):?>
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>States</th>
                    <th>City</th>
                    <th>Warehouse_index</th>
                    <th>Address</th>
                    <th style="text-align: center;">Edit</th>
                    <th style="text-align: center;">Delete</th>
                </tr>
                <?php foreach ($get_warehouse_admin as $item):?>
                <tr class="pg-<?=$item['id']?>">
                    <td>#<?=$item['id']?></td>
                    <td><?=$item['name']?></td>
                    <td><?=$item['states_name']?></td>
                    <td><?=$item['city']?></td>
                    <td><?=$item['warehouse_index']?></td>
                    <td><?=$item['address']?></td>
                    <td class="move" style="text-align: center;"><a class="edit" href="<?=PATH_ADMIN?>edit-warehouse/<?=$item['id']?>"> <i class="icons edit">edit</i></a></td>
                    <td class="move" style="text-align: center;">
                        <a href="#" class="trigger btn-delete-pages" data-page="<?=$item['id']?>">
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
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>