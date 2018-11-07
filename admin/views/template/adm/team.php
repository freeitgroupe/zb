<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php" ?>
<?php require_once 'top_nav_products.php'?>
    <div class="contentBox clear">
        <nav class="pageNav clear">
            <ul>
                <a href="/admin/team/"><i class="icons">insert_emoticon</i><li>Team</li></a>
            </ul>
        </nav>
    </div>
    <div class="contentBox clear">
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
            <h2>Add users <i class="icons">add</i></h2>
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Main</h3>
                    <input class="bottom" type="text" placeholder="Login" name="login" value="<?=$_SESSION['data']['login']?>">
                    <input class="bottom" type="text" placeholder="Email" name="email" value="<?=$_SESSION['data']['email']?>">
                    <input class="bottom" type="text" placeholder="Password" name="password" value="">
                    <input class="bottom" type="time" placeholder="Start time to work" name="start_time_work" value="<?=$_SESSION['data']['start_time_work']?>">
                    <h3>Activation</h3>
                    <select class="bottom" name="admin_access_id" value="<?=$_SESSION['data']['admin_access_id']?>">
                        <?php if(isset($get_data_admin_access)):?>
                        <?php foreach ($get_data_admin_access as $item):?>
                                <option value="<?=$item['id']?>" <?=$_SESSION['data']['admin_access_id']==$item['id'] ? 'selected' : NULL; ?>><?=$item['team_name']?></option>
                        <?php endforeach;?>
                        <?php else:?>
                            <option value="">empty param</option>
                        <?php endif;?>
                    </select>
                </div>
                <div class="boxTwoThirds">
                    <h3>Profile</h3>
                    <input class="bottom" type="text" placeholder="Name" name="name" value="<?=$_SESSION['data']['name']?>">
                    <input class="bottom" type="text" placeholder="Phone" name="phone" value="<?=$_SESSION['data']['phone']?>">
                    <input class="bottom" type="text" placeholder="Ext phone" name="ext_phone" value="<?=$_SESSION['data']['ext_phone']?>">
                    <input class="bottom" type="text" placeholder="Age" name="age" value="<?=$_SESSION['data']['age']?>">
                    <input class="bottom" type="date" placeholder="Date birth" name="date_birth" value="<?=$_SESSION['data']['date_birth']?>">
                    <input class="bottom" type="text" placeholder="Education" name="education" value="<?=$_SESSION['data']['education']?>">
                </div>
            </div>
            <input class="fat" type="submit" value="Add user" name="create_user">
        </form>
    </div>
    <div class="contentBox clear">
        <h2>Team: <i class="icons">assignment</i></h2>
        <div class="tableBox">
            <table>
                <tbody>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Edit</th>
                </tr>
                <?php if(isset($get_data_admin)):?>
                    <?php foreach ($get_data_admin as $item):?>
                        <tr>
                            <td>#<?=$item['id']?></td>
                            <td><?=$item['email']?></td>
                            <td><?=$item['name']?></td>
                            <td><?=$item['phone']?></td>
                            <td><?=$item['team_name']?></td>
                            <td>
                                <a href="/admin/edit-team/<?=$item['id']?>" title="edit">
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