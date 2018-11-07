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
                                <?php $_SESSION['data']['state'] == $states_of_usa[$i]['name'] ? print 'selected':'';?>><?=$states_of_usa[$i]['name']?></option>
                        <?php endfor;?>
                    </select>
                    <input class="bottom" type="text" placeholder="city" name="city" value="<?php $_SESSION['data']['city'] > false ? print $_SESSION['data']['city'] : '';?>">
                    <input class="bottom" type="text" placeholder="zip_code" name="zip_code" value="<?php $_SESSION['data']['zip_code'] > false ? print $_SESSION['data']['zip_code'] : '';?>">
                </div>
                <div class="boxOneThird">
                    <h3>Special</h3>
                    <input class="bottom" type="text" placeholder="title" name="title" value="<?php $_SESSION['data']['title'] > false ? print $_SESSION['data']['title'] : '';?>">
                    <input class="bottom" type="text" placeholder="description" name="description" value="<?php $_SESSION['data']['description'] > '' ? print $_SESSION['data']['description'] : '';?>">
                    <input class="bottom" type="text" placeholder="meta description" name="meta_d" value="<?php $_SESSION['data']['meta_d'] > '' ? print $_SESSION['data']['meta_d'] : '';?>">
                    <input class="bottom" type="text" placeholder="meta keywords" name="meta_k" value="<?php $_SESSION['data']['meta_k'] > '' ? print $_SESSION['data']['meta_k'] : '';?>">
                </div>
                <div class="boxOneThird">
                    <h3>Contact</h3>
                    <input class="bottom" type="text" placeholder="Email" name="email" value="<?php $_SESSION['data']['email'] > '' ? print $_SESSION['data']['email'] : '';?>">
                    <input class="bottom" type="text" placeholder="phone" name="phone" value="<?php $_SESSION['data']['phone'] > '' ? print $_SESSION['data']['phone'] : '';?>">
                    <select class="bottom" name="visible">
                        <?php foreach($visibleSupplier as $k=>$v):?>
                            <option value="<?=$v?>" <?php $_SESSION['data']['visible'] == $v ? print 'selected':'';?>><?=$k?></option>
                        <?php endforeach;?>
                    </select>
                </div>
            </div>
            <input type="submit" class="fat" value="Confirm" name="new_supplier_success">
        </form>
    </div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>