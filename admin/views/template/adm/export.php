<?php defined("CATALOG") or die("Access denied"); ?>
<?php require_once 'header.php'?>
<?php require_once 'tpl/topSettingsMenu.php'?>
<!-- Content Wrapper. Contains page content -->
<div class="contentBox clear">
    <div class="fist clear">
<!--        <div class="boxOneThird">-->
<!--            <h3>Database Export</h3>-->
<!--            <form action="--><?//=$_SERVER['REQUEST_URI']?><!--" method="post" enctype="multipart/form-data">-->
<!--                <input class="top" name="export_db" type="submit" value="Start Export">-->
<!--            </form>-->
<!--        </div>-->
        <div class="boxOneThird">
            <h3>Products export</h3>
            <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
                <input class="top" name="export_products" type="submit" value="Start Export">
            </form>
        </div>
        <div class="boxOneThird">
            <h3>Save client export</h3>
            <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
                <input class="top" name="export_users" type="submit" value="Start Export">
            </form>
        </div>
    </div>
</div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
