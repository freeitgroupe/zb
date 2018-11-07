<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php" ?>
<?php require_once 'top_nav_products.php'?>
    <div class="contentBox clear">
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
            <h2>Create discount. PM:(<?=date( "Y-m-d H:i:s", time())?>)<i class="icons">add</i></h2>
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Main</h3>
                    <input class="bottom" type="text" placeholder="Discount name*" name="title">
                    <input type="text" data-range="true" data-multiple-dates-separator="/" class="datepicker-here bottom" value="" name="rangeTime" placeholder="start date* / end date*">
                    <input class="bottom" type="text" placeholder="percent*" name="percent">
                    <h3>Activation</h3>
                    <select class="bottom" name="status_active">
                        <option value="1">enabled</option>
                        <option value="0">disabled</option>
                    </select>
                </div>
            </div>
            <input class="fat" type="submit" value="Create discount" name="create_discount">
        </form>

    </div>
    <div class="contentBox clear">
        <h2>Discount list<i class="icons">assignment</i></h2>
        <div class="tableBox">
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Start time</th>
                    <th>End time</th>
                    <th>Percent, %</th>
                    <th>Status</th>
                    <th>Edit</th>
                </tr>
                <?php if($get_data_admin):?>
                    <?php foreach ($get_data_admin as $item):?>
                        <tr>
                            <td>#<?=$item['id']?></td>
                            <td><?=$item['title']?></td>
                            <td><?=$item['start_date']?></td>
                            <td><?=$item['end_date']?></td>
                            <td><?=$item['percent']?></td>
                            <td><?=$item['status_active'] ? 'enabled' : 'disabled'; ?></td>
                            <td>
                                <a href="/admin/edit-discount/<?=$item['alias']?>" title="edit">
                                    <i class="icons">settings</i>
                                </a>
                            </td>
                        </tr>
                    <?php endforeach;?>
                <?php else:?>
                    <tr><td colspan="7">Empty param</td></tr>
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
<?php if(isset($_SESSION['filter'])) {unset($_SESSION['filter']);}?>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php' ?>