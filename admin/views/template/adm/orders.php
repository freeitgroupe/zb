<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
    <!-- Content Wrapper. Contains page content -->
    <div class="contentBox clear">
        <nav class="pageNav clear">
            <ul>
                <a href="orders.html"><i class="icons">list</i><li>Orders</li></a>
<!--                <a href="ordersrecall.html"><i class="icons">call</i><li>Recalls</li></a>-->
            </ul>
        </nav>
    </div>
    <div class="contentBox clear">
        <h2>Search filter<i class="icons">search</i></h2>
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="get">
            <div class="fist clear">
                <div class="boxOneThird clear">
                    <input class="bottom" type="datetime-local" placeholder="Date from" name="created_at[]">
                    <input class="bottom" type="datetime-local" placeholder="Date to" name="created_at[]">
                    <input type="text" placeholder="Manager Name" name="manager_name">
                </div>
                <div class="boxOneThird clear">
                    <input class="bottom" type="number" min="0" placeholder="Amount from" name="sum[]">
                    <input class="bottom" type="number" max="100000" placeholder="Amount to" name="sum[]">
                    <select name="order_status" name="status">
                        <?php foreach ($order_status as $item):?>
                        <option value="<?=$item['param_status']?>"><?=$item['title']?></option>
                        <?php endforeach?>
                    </select>
                </div>
                <div class="boxOneThird clear">
                    <input class="bottom" type="text" placeholder="Client Name" name="name">
                    <input type="text" placeholder="Phone nums" name="phone">
                </div>
            </div>
            <input type="submit" value="Search" class="fat" name="searchButton">
            <a href="/admin/orders-options">Reset</a>
        </form>
    </div>
    <div class="contentBox clear">
        <h2>Order list<i class="icons">assignment</i></h2>
        <div class="tableBox clear">
            <table>
                <tbody>
                <tr>
                    <th>Num</th>
                    <th>Date</th>
                    <th>Updated Date</th>
                    <th>Status</th>
                    <th>Manager</th>
                    <th>Amount</th>
                    <th>Client</th>
                    <th>Phone</th>
                    <th>Edit</th>
                </tr>
                <?php if($get_orders_admin):?>
                <?php foreach ($get_orders_admin as $item):?>
                <tr>
                    <td>#<?=$item['id']?></td>
                    <td><?=$item['created_at']?></td>
                    <td><?=$item['updated_at']?></td>
                    <td><?=$item['status_title']?></td>
                    <td><?=$item['manager_name']?></td>
                    <td><?=$item['sum']?></td>
                    <td><?=$item['name']?></td>
                    <td><?=$item['phone']?></td>
                    <td><a href="/admin/edit-order/<?=$item['id']?>" title="edit"><i class="icons">settings</i></a></td>
                </tr>
                <?php endforeach;?>
                <?php endif;?>
                </tbody>
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
    <!-- /.content-wrapper -->
<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['filter'])){unset($_SESSION['filter']);}?>
<?php require_once "footer.php"?>