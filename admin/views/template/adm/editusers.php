<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php" ?>
<?php require_once 'top_nav_products.php'?>
    <div class="contentBox clear">
        <h2>Userlist<i class="icons">assignment</i></h2>
        <div class="tableBox">
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Registration</th>
                    <th>Total orders</th>
                    <th>Discount</th>
                    <th>Edit</th>
                </tr>
                <?php if(isset($get_data_admin)):?>
                    <?php foreach ($get_data_admin as $item):?>
                        <tr>
                            <td>#<?=$item['id']?></td>
                            <td><?=$item['email']?></td>
                            <td><?=$item['datetime']?></td>
                            <td><?=$item['sum']?></td>
                            <td><?=$item['discount']?></td>
                            <td>
                                <a href="/admin/edit-users/<?=$item['id']?>" title="edit">
                                    <i class="icons">settings</i>
                                </a>
                            </td>
                        </tr>
                    <?php endforeach;?>
                <?php else:?>
                    <tr><td>Empty param</td></tr>
                <?php endif;?>
                </tbody>
            </table>
        </div>
    </div>
<?php if(isset($_SESSION['filter'])) {unset($_SESSION['filter']);}?>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php' ?>