<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox clear">
    <h2>Import<i class="icons">call received</i></h2>
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="boxOneThird">
            <h3>Import full</h3>
            <div class="">
                <h3>Select category</h3>
                <select class="bottom" name="category">
                    <option value="0">Source category</option>
                    <?=$category_menu_admin?>
                </select>
            </div>
            <input type="file" class="bottom" name="file">
            <input type="submit" value="Import document" name="sub">
        </div>
    </form>
</div>
<!-- /.content-wrapper -->
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['filter'])){unset($_SESSION['filter']);}?>
<?php require_once "footer.php"?>
