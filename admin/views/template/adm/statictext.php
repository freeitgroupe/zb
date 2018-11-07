<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topSettingsMenu.php'?>
    <!-- Content Wrapper. Contains page content -->
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="contentBox clear">
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Cart billing text</h3>
                    <textarea placeholder="Enter buillrg text" name="cart_text"><?=$getAdminSettings['cart_text']?></textarea>
                </div>
                <div class="boxOneThird">
                    <h3>upsell text</h3>
                    <textarea placeholder="Enter upsell text" name="upsell_text"><?=$getAdminSettings['upsell_text']?></textarea>
                </div>
                <div class="boxOneThird">
                    <h3>Order final step</h3>
                    <textarea placeholder="Enter final order text" name="order_final_text"><?=$getAdminSettings['order_final_text']?></textarea>
                </div>
            </div>
        </div>
        <div class="contentBox clear">
            <input class="fat" type="submit" value="Save texts" name="edit_statictext">
        </div>
    </form>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>